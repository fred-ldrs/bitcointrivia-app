import 'dart:io';
import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';

void main() async {
  final dbPath = r'C:\dev\bitcointrivia-data\db\questions.db';
  
  print('Öffne Datenbank: $dbPath');
  
  final db = await openDatabase(dbPath);
  
  // Zeige Tabellen
  final tables = await db.rawQuery(
    "SELECT name FROM sqlite_master WHERE type='table'"
  );
  print('\nVorhandene Tabellen:');
  for (var table in tables) {
    print('  - ${table['name']}');
  }
  
  // Zeige Schema der questions Tabelle falls vorhanden
  try {
    final schema = await db.rawQuery("PRAGMA table_info(questions)");
    print('\nSchema der questions Tabelle:');
    for (var column in schema) {
      print('  ${column['name']} (${column['type']})');
    }
    
    // Zeige Anzahl der Einträge
    final count = await db.rawQuery('SELECT COUNT(*) as count FROM questions');
    print('\nAnzahl Fragen: ${count.first['count']}');
    
    // Zeige Beispiel-Einträge
    final sample = await db.rawQuery('SELECT * FROM questions LIMIT 3');
    print('\nBeispiel-Einträge:');
    for (var row in sample) {
      print('  ID ${row['id']}: ${row['question']?.toString().substring(0, 50)}...');
      print('    Kategorie: ${row['category']}, Schwierigkeit: ${row['difficulty']}, Sprache: ${row['language']}');
    }
    
    // Zeige Sprachen
    final languages = await db.rawQuery('SELECT DISTINCT language FROM questions');
    print('\nVerfügbare Sprachen:');
    for (var lang in languages) {
      print('  - ${lang['language']}');
    }
    
    // Zeige Kategorien
    final categories = await db.rawQuery('SELECT DISTINCT category FROM questions');
    print('\nVerfügbare Kategorien:');
    for (var cat in categories) {
      print('  - ${cat['category']}');
    }
    
    // Zeige Schwierigkeiten
    final difficulties = await db.rawQuery('SELECT DISTINCT difficulty FROM questions');
    print('\nVerfügbare Schwierigkeiten:');
    for (var diff in difficulties) {
      print('  - ${diff['difficulty']}');
    }
    
  } catch (e) {
    print('Fehler beim Abfragen der questions Tabelle: $e');
  }
  
  await db.close();
  print('\nFertig!');
}
