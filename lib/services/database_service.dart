import 'dart:io';
import 'package:flutter/services.dart';
import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';
import 'package:path_provider/path_provider.dart';
import '../models/question.dart';
import '../models/quiz_config.dart';

class DatabaseService {
  static Database? _database;
  static const String _dbName = 'questions.db';
  static bool? _hasLangColumn;
  static bool? _hasEnabledColumn;

  Future<Database> get database async {
    if (_database != null) return _database!;
    _database = await _initDatabase();
    return _database!;
  }
  
  Future<bool> _checkLangColumn() async {
    if (_hasLangColumn != null) return _hasLangColumn!;
    
    final db = await database;
    final result = await db.rawQuery('PRAGMA table_info(questions)');
    _hasLangColumn = result.any((column) => column['name'] == 'lang');
    return _hasLangColumn!;
  }
  
  Future<bool> _checkEnabledColumn() async {
    if (_hasEnabledColumn != null) return _hasEnabledColumn!;
    
    final db = await database;
    final result = await db.rawQuery('PRAGMA table_info(questions)');
    _hasEnabledColumn = result.any((column) => column['name'] == 'enabled');
    return _hasEnabledColumn!;
  }

  Future<Database> _initDatabase() async {
    final documentsDirectory = await getApplicationDocumentsDirectory();
    final path = join(documentsDirectory.path, _dbName);

    // Lösche alte Datenbank und kopiere immer neu aus Assets
    final exists = await databaseExists(path);
    if (exists) {
      await deleteDatabase(path);
    }
    
    await Directory(dirname(path)).create(recursive: true);
    final data = await rootBundle.load('assets/db/$_dbName');
    final bytes = data.buffer.asUint8List(data.offsetInBytes, data.lengthInBytes);
    await File(path).writeAsBytes(bytes);

    return await openDatabase(path, version: 1);
  }

  /// Lädt Fragen basierend auf der Quiz-Konfiguration
  Future<List<Question>> loadQuestions(QuizConfig config) async {
    final db = await database;
    final hasLang = await _checkLangColumn();
    final hasEnabled = await _checkEnabledColumn();
    
    // Erstelle WHERE-Clause für Kategorien
    final categoryPlaceholders = config.categories.map((_) => '?').join(',');
    
    String whereClause = 'difficulty = ? AND category IN ($categoryPlaceholders)';
    List<dynamic> whereArgs = [config.difficulty, ...config.categories];
    
    if (hasEnabled) {
      whereClause += ' AND enabled = 1';
    }
    
    if (hasLang) {
      whereClause += ' AND lang = ?';
      whereArgs.add(config.language);
    }
    
    final result = await db.query(
      'questions',
      where: whereClause,
      whereArgs: whereArgs,
      orderBy: 'RANDOM()',
      limit: config.numberOfQuestions,
    );

    return result.map((map) => Question.fromMap(map)).toList();
  }

  /// Gibt alle verfügbaren Kategorien zurück
  Future<List<String>> getAvailableCategories() async {
    final db = await database;
    final result = await db.rawQuery('SELECT DISTINCT category FROM questions');
    return result.map((row) => row['category'] as String).toList();
  }

  /// Gibt die Anzahl verfügbarer Fragen für eine Konfiguration zurück
  Future<int> getAvailableQuestionCount(QuizConfig config) async {
    final db = await database;
    final hasLang = await _checkLangColumn();
    final hasEnabled = await _checkEnabledColumn();
    final categoryPlaceholders = config.categories.map((_) => '?').join(',');
    
    String whereClause = 'difficulty = ? AND category IN ($categoryPlaceholders)';
    List<dynamic> whereArgs = [config.difficulty, ...config.categories];
    
    if (hasEnabled) {
      whereClause += ' AND enabled = 1';
    }
    
    if (hasLang) {
      whereClause += ' AND lang = ?';
      whereArgs.add(config.language);
    }
    
    // Debug logging
    print('=== DEBUG: getAvailableQuestionCount ===');
    print('Query: SELECT COUNT(*) as count FROM questions WHERE $whereClause');
    print('Args: $whereArgs');
    print('hasLang: $hasLang, hasEnabled: $hasEnabled');
    
    final result = await db.rawQuery(
      'SELECT COUNT(*) as count FROM questions WHERE $whereClause',
      whereArgs,
    );
    
    final count = Sqflite.firstIntValue(result) ?? 0;
    print('Result count: $count');
    print('=========================================');

    return count;
  }

  Future<void> close() async {
    final db = await database;
    await db.close();
    _database = null;
  }
}
