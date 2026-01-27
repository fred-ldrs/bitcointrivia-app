import 'dart:io';
import 'package:sqflite_common_ffi/sqflite_ffi.dart';

void main() async {
  sqfliteFfiInit();
  databaseFactory = databaseFactoryFfi;

  final dbPath = r'C:\dev\bitcointrivia-data\db\questions.db';
  
  if (!await File(dbPath).exists()) {
    print('Database not found at: $dbPath');
    return;
  }

  final db = await openDatabase(dbPath);
  
  print('\n=== CATEGORIES ===');
  final categories = await db.rawQuery('SELECT DISTINCT category FROM questions ORDER BY category');
  for (var row in categories) {
    print('- ${row['category']}');
  }
  
  print('\n=== LANGUAGES ===');
  final languages = await db.rawQuery('SELECT DISTINCT lang FROM questions ORDER BY lang');
  for (var row in languages) {
    print('- ${row['lang']}');
  }
  
  print('\n=== DIFFICULTIES ===');
  final difficulties = await db.rawQuery('SELECT DISTINCT difficulty FROM questions ORDER BY difficulty');
  for (var row in difficulties) {
    print('- ${row['difficulty']}');
  }
  
  print('\n=== ENABLED QUESTIONS ===');
  final enabled = await db.rawQuery('SELECT COUNT(*) as count, lang, difficulty FROM questions WHERE enabled = 1 GROUP BY lang, difficulty');
  for (var row in enabled) {
    print('${row['lang']} / ${row['difficulty']}: ${row['count']} questions');
  }
  
  print('\n=== ALL QUESTIONS (enabled status) ===');
  final all = await db.rawQuery('SELECT id, category, difficulty, lang, enabled, question FROM questions LIMIT 10');
  for (var row in all) {
    print('\nID: ${row['id']}');
    print('Category: ${row['category']} | Difficulty: ${row['difficulty']} | Lang: ${row['lang']} | Enabled: ${row['enabled']}');
    print('Question: ${row['question']}');
  }
  
  await db.close();
}
