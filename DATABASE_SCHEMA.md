# Datenbank-Schema für questions.db

## Tabelle: questions

Die Datenbank muss eine Tabelle `questions` mit folgender Struktur enthalten:

```sql
CREATE TABLE questions (
    id INTEGER PRIMARY KEY,
    question TEXT NOT NULL,
    correct_answer TEXT NOT NULL,
    wrong_answers TEXT NOT NULL,  -- Pipe-separiert: "Answer 1|Answer 2|Answer 3"
    difficulty TEXT NOT NULL,     -- 'easy', 'normal', 'difficult'
    category TEXT NOT NULL,       -- 'history', 'technology', 'economics', 'general'
    language TEXT NOT NULL        -- 'en', 'de', 'fr'
);
```

## Beispiel-Eintrag

```sql
INSERT INTO questions (question, correct_answer, wrong_answers, difficulty, category, language) VALUES (
    'In welchem Jahr wurde Bitcoin erstmals veröffentlicht?',
    '2009',
    '2008|2010|2011',
    'easy',
    'history',
    'de'
);
```

## Kategorien

- **history**: Geschichte von Bitcoin und Kryptowährungen
- **technology**: Technische Aspekte (Mining, Blockchain, etc.)
- **economics**: Ökonomische Aspekte (Geldpolitik, Finanzen)
- **general**: Allgemeinwissen über Bitcoin

## Schwierigkeitsgrade

- **easy**: Einfache Fragen für Anfänger
- **normal**: Mittlere Schwierigkeit
- **difficult**: Schwierige Fragen für Experten

## Sprachen

- **en**: Englisch
- **de**: Deutsch
- **fr**: Französisch

## Hinweise

- Falsche Antworten (`wrong_answers`) werden mit Pipe-Zeichen (`|`) getrennt
- Es sollten genau 3 falsche Antworten pro Frage vorhanden sein
- Insgesamt hat jede Frage also 4 Antwortmöglichkeiten (1 richtig, 3 falsch)
- Die Antworten werden in der App automatisch gemischt
