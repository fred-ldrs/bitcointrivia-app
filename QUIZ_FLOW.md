# Bitcoin Trivia App - Quiz-Flow

## Übersicht

Die App implementiert einen vollständigen Quiz-Flow mit Konfiguration, Durchführung und Ergebnisanzeige.

## Quiz-Flow

### 1. Startseite (Home Screen)

- Button "Quiz starten" öffnet die Quiz-Konfiguration
- [lib/screens/home_screen.dart](lib/screens/home_screen.dart)

### 2. Quiz-Konfiguration (Quiz Config Screen)

**Standardeinstellungen:**
- Schwierigkeit: normal
- Kategorien: alle 4 aktiviert (History, Technology, Economics, General)
- Fragenanzahl: 10
- Sprache: entspricht App-Sprache

**Anpassbare Einstellungen:**
- **Schwierigkeit**: Easy, Normal, Difficult
- **Kategorien**: 4 Kategorien einzeln auswählbar
- **Fragenanzahl**: 5, 10, 15 oder freie Eingabe
- Zeigt verfügbare Fragenanzahl basierend auf Einstellungen an

**Validierung:**
- Mindestens eine Kategorie muss ausgewählt sein
- Genug Fragen müssen für die Konfiguration verfügbar sein

[lib/screens/quiz_config_screen.dart](lib/screens/quiz_config_screen.dart)

### 3. Quiz-Durchführung (Quiz Screen)

**Features:**
- Fortschrittsanzeige (Progress Bar)
- Kategorie und Schwierigkeit werden pro Frage angezeigt
- 4 Antwortmöglichkeiten (zufällig gemischt)
- Sofortiges Feedback nach Auswahl:
  - Grün = richtige Antwort
  - Rot = falsche Antwort
  - Richtige Antwort wird immer angezeigt
- Navigation zur nächsten Frage
- Zurück-Button mit Bestätigungsdialog

**Tracking:**
- Anzahl richtiger Antworten
- Anzahl falscher Antworten
- Fehler pro Kategorie

[lib/screens/quiz_screen.dart](lib/screens/quiz_screen.dart)

### 4. Quiz-Ergebnis (Result Screen)

**Anzeige:**
- Prozentsatz mit visuellem Indikator
- Emoji und Nachricht basierend auf Ergebnis:
  - 100%: 🏆 Perfekt!
  - 80-99%: 🎉 Ausgezeichnet!
  - 60-79%: 👍 Gut gemacht!
  - 40-59%: 📚 Weiter lernen!
  - 0-39%: 💪 Weiter üben!

**Statistiken:**
- Richtige Antworten
- Falsche Antworten
- Gesamtfragen

**Fehleranalyse:**
- Liste der Kategorien mit Fehlern
- Anzahl Fehler pro Kategorie

**Buttons:**
- "Zurück zur Startseite"
- "Neues Quiz"

[lib/screens/quiz_result_screen.dart](lib/screens/quiz_result_screen.dart)

## Architektur

### Models

- **[Question](lib/models/question.dart)**: Repräsentiert eine Quiz-Frage
- **[QuizConfig](lib/models/quiz_config.dart)**: Quiz-Konfiguration
- **[QuizResult](lib/models/quiz_result.dart)**: Quiz-Ergebnis mit Statistiken

### Services

- **[DatabaseService](lib/services/database_service.dart)**: 
  - Lädt Datenbank aus Assets
  - Lädt Fragen basierend auf Konfiguration
  - Gibt verfügbare Fragenanzahl zurück

### Datenbank

Die App nutzt eine SQLite-Datenbank (`questions.db`), die:
- Nicht im Git-Repository gespeichert wird
- Vor jedem Build aus `C:\dev\bitcointrivia-data\db\` kopiert wird
- Als Asset in `assets/db/` geladen wird

Siehe [DATABASE.md](DATABASE.md) für Details zur Datenbank-Verwaltung.
Siehe [DATABASE_SCHEMA.md](DATABASE_SCHEMA.md) für die Datenbank-Struktur.

## Lokalisierung

Die App unterstützt drei Sprachen:
- Englisch (en)
- Deutsch (de)
- Französisch (fr)

Alle Quiz-Texte sind lokalisiert in:
- [lib/l10n/app_en.arb](lib/l10n/app_en.arb)
- [lib/l10n/app_de.arb](lib/l10n/app_de.arb)
- [lib/l10n/app_fr.arb](lib/l10n/app_fr.arb)

## Entwicklung

### Datenbank vorbereiten

Vor dem ersten Start oder Build:

```bash
dart run scripts/copy_database.dart
```

oder

```bash
copy_db.bat
```

### App starten

```bash
flutter run
```

### Lokalisierungen neu generieren

```bash
flutter gen-l10n
```
