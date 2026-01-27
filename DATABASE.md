# Datenbank-Verwaltung

## Übersicht

Die Fragen-Datenbank (`questions.db`) wird **nicht** im Git-Repository gespeichert. Stattdessen wird sie vor jedem Build aus einem externen Verzeichnis kopiert.

### Quellverzeichnis
```
C:\dev\bitcointrivia-data\db\questions.db
```

### Zielverzeichnis (im Projekt)
```
assets/db/questions.db
```

## Workflow

### Vor jedem Build

Führe eines der folgenden Befehle aus, um die Datenbank zu kopieren:

**Windows:**
```batch
copy_db.bat
```

**Linux/Mac:**
```bash
./copy_db.sh
```

**Direkt mit Dart:**
```bash
dart run scripts/copy_database.dart
```

### Hinweise

- Die Datenbank wird automatisch in `.gitignore` ignoriert
- Die Master-Datenbank liegt unter `C:\dev\bitcointrivia-data\db\questions.db`
- Änderungen an der Datenbank müssen in der Master-Datei vorgenommen werden
- Die Datei im `assets/db/` Verzeichnis wird bei jedem Kopiervorgang überschrieben

## Integration in Build-Prozesse

### Android Studio / IntelliJ

Füge als Pre-Build-Schritt hinzu:
```
dart run scripts/copy_database.dart
```

### VS Code

In `.vscode/tasks.json` kannst du einen Task definieren:
```json
{
  "label": "Copy Database",
  "type": "shell",
  "command": "dart run scripts/copy_database.dart",
  "group": "build",
  "presentation": {
    "reveal": "silent"
  }
}
```

### CI/CD

Stelle sicher, dass die Quelldatenbank vor dem Build verfügbar ist und führe das Kopier-Script aus.
