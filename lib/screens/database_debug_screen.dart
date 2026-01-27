import 'package:flutter/material.dart';
import '../services/database_service.dart';

class DatabaseDebugScreen extends StatefulWidget {
  const DatabaseDebugScreen({super.key});

  @override
  State<DatabaseDebugScreen> createState() => _DatabaseDebugScreenState();
}

class _DatabaseDebugScreenState extends State<DatabaseDebugScreen> {
  final DatabaseService _dbService = DatabaseService();
  String _debugInfo = 'Lade Datenbank-Informationen...';
  bool _isLoading = true;

  @override
  void initState() {
    super.initState();
    _loadDebugInfo();
  }

  Future<void> _loadDebugInfo() async {
    try {
      final db = await _dbService.database;
      
      final StringBuffer info = StringBuffer();
      
      // Zeige Tabellen
      final tables = await db.rawQuery(
        "SELECT name FROM sqlite_master WHERE type='table'"
      );
      info.writeln('=== Tabellen ===');
      for (var table in tables) {
        info.writeln('  - ${table['name']}');
      }
      info.writeln('');
      
      // Schema
      try {
        final schema = await db.rawQuery("PRAGMA table_info(questions)");
        info.writeln('=== Schema (questions) ===');
        for (var column in schema) {
          info.writeln('  ${column['name']} (${column['type']})');
        }
        info.writeln('');
      } catch (e) {
        info.writeln('Fehler beim Schema-Abruf: $e');
        info.writeln('');
      }
      
      // Gesamt-Anzahl
      try {
        final count = await db.rawQuery('SELECT COUNT(*) as count FROM questions');
        info.writeln('=== Gesamt-Fragen ===');
        info.writeln('  ${count.first['count']}');
        info.writeln('');
        
        // Enabled-Anzahl
        final enabledCount = await db.rawQuery('SELECT COUNT(*) as count FROM questions WHERE enabled = 1');
        info.writeln('=== Enabled-Fragen ===');
        info.writeln('  ${enabledCount.first['count']}');
        info.writeln('');
      } catch (e) {
        info.writeln('Fehler beim Count: $e');
        info.writeln('');
      }
      
      // Sprachen
      try {
        final languages = await db.rawQuery('SELECT DISTINCT lang FROM questions');
        info.writeln('=== Sprachen (lang) ===');
        for (var lang in languages) {
          final langCode = lang['lang'];
          final langCount = await db.rawQuery(
            'SELECT COUNT(*) as count FROM questions WHERE lang = ? AND enabled = 1',
            [langCode]
          );
          info.writeln('  $langCode: ${langCount.first['count']} enabled');
        }
        info.writeln('');
      } catch (e) {
        info.writeln('Fehler bei Sprachen: $e');
        info.writeln('');
      }
      
      // Kategorien
      try {
        final categories = await db.rawQuery('SELECT DISTINCT category FROM questions WHERE enabled = 1');
        info.writeln('=== Kategorien (enabled) ===');
        for (var cat in categories) {
          final catName = cat['category'];
          final catCount = await db.rawQuery(
            'SELECT COUNT(*) as count FROM questions WHERE category = ? AND enabled = 1',
            [catName]
          );
          info.writeln('  $catName: ${catCount.first['count']}');
        }
        info.writeln('');
      } catch (e) {
        info.writeln('Fehler bei Kategorien: $e');
        info.writeln('');
      }
      
      // Schwierigkeiten
      try {
        final difficulties = await db.rawQuery('SELECT DISTINCT difficulty FROM questions WHERE enabled = 1');
        info.writeln('=== Schwierigkeiten (enabled) ===');
        for (var diff in difficulties) {
          final diffName = diff['difficulty'];
          final diffCount = await db.rawQuery(
            'SELECT COUNT(*) as count FROM questions WHERE difficulty = ? AND enabled = 1',
            [diffName]
          );
          info.writeln('  $diffName: ${diffCount.first['count']}');
        }
        info.writeln('');
      } catch (e) {
        info.writeln('Fehler bei Schwierigkeiten: $e');
        info.writeln('');
      }
      
      // Test-Abfrage wie die App
      try {
        info.writeln('=== Test-Abfrage (wie App) ===');
        final testCount = await db.rawQuery(
          'SELECT COUNT(*) as count FROM questions WHERE difficulty = ? AND category IN (?,?,?,?) AND enabled = 1 AND lang = ?',
          ['normal', 'history', 'technology', 'economics', 'general', 'de']
        );
        info.writeln('  normal + alle Kategorien + de: ${testCount.first['count']}');
        
        // Zeige was tatsächlich da ist
        final actualCombo = await db.rawQuery('''
          SELECT difficulty, category, lang, COUNT(*) as count 
          FROM questions 
          WHERE enabled = 1 
          GROUP BY difficulty, category, lang
          ORDER BY difficulty, category, lang
        ''');
        info.writeln('');
        info.writeln('=== Vorhandene Kombinationen ===');
        for (var row in actualCombo) {
          info.writeln('  ${row['difficulty']} / ${row['category']} / ${row['lang']}: ${row['count']}');
        }
        info.writeln('');
      } catch (e) {
        info.writeln('Fehler bei Test-Abfrage: $e');
        info.writeln('');
      }
      
      // Beispiel-Einträge
      try {
        final sample = await db.rawQuery('SELECT * FROM questions WHERE enabled = 1 LIMIT 3');
        info.writeln('=== Beispiel-Einträge (enabled) ===');
        for (var row in sample) {
          info.writeln('ID ${row['id']}:');
          final question = row['question']?.toString() ?? '';
          info.writeln('  Frage: ${question.length > 50 ? question.substring(0, 50) + "..." : question}');
          info.writeln('  Kategorie: ${row['category']}');
          info.writeln('  Schwierigkeit: ${row['difficulty']}');
          info.writeln('  Sprache: ${row['lang']}');
          info.writeln('  Enabled: ${row['enabled']}');
          info.writeln('');
        }
      } catch (e) {
        info.writeln('Fehler bei Beispiel-Einträgen: $e');
        info.writeln('');
      }
      
      setState(() {
        _debugInfo = info.toString();
        _isLoading = false;
      });
      
    } catch (e) {
      setState(() {
        _debugInfo = 'FEHLER: $e';
        _isLoading = false;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Datenbank Debug'),
      ),
      body: _isLoading
          ? const Center(child: CircularProgressIndicator())
          : SingleChildScrollView(
              padding: const EdgeInsets.all(16),
              child: SelectableText(
                _debugInfo,
                style: const TextStyle(fontFamily: 'monospace', fontSize: 12),
              ),
            ),
    );
  }
}
