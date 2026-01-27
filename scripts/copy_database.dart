import 'dart:io';

/// Kopiert die Fragen-Datenbank aus dem externen Verzeichnis in das Assets-Verzeichnis
/// Diese Datei sollte vor jedem Build ausgeführt werden
void main() async {
  final sourceDb = File(r'C:\dev\bitcointrivia-data\db\questions.db');
  final targetDbDir = Directory('assets/db');
  final targetDb = File('assets/db/questions.db');

  print('Kopiere Datenbank...');
  print('Quelle: ${sourceDb.path}');
  print('Ziel: ${targetDb.path}');

  // Prüfe ob Quelldatenbank existiert
  if (!await sourceDb.exists()) {
    print('FEHLER: Quelldatenbank nicht gefunden: ${sourceDb.path}');
    exit(1);
  }

  // Erstelle Zielverzeichnis falls nötig
  if (!await targetDbDir.exists()) {
    await targetDbDir.create(recursive: true);
    print('Zielverzeichnis erstellt: ${targetDbDir.path}');
  }

  // Kopiere Datei
  await sourceDb.copy(targetDb.path);
  
  final targetSize = await targetDb.length();
  print('✓ Datenbank erfolgreich kopiert (${(targetSize / 1024).toStringAsFixed(2)} KB)');
}
