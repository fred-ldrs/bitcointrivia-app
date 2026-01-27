// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for German (`de`).
class AppLocalizationsDe extends AppLocalizations {
  AppLocalizationsDe([String locale = 'de']) : super(locale);

  @override
  String get appTitle => 'Bitcoin Trivia';

  @override
  String get startQuiz => 'Quiz starten';

  @override
  String get settings => 'Einstellungen';

  @override
  String get feedback => 'Feedback';

  @override
  String get supportProject => 'Projekt unterstützen';

  @override
  String get privacy => 'Datenschutz';

  @override
  String get impressum => 'Impressum';

  @override
  String get supportTitle => 'Projekt unterstützen';

  @override
  String get supportBitcoinTrivia => 'Unterstütze Bitcoin Trivia';

  @override
  String get supportDescription =>
      'Wenn dir das Projekt gefällt, kannst du es auf verschiedene Arten unterstützen.';

  @override
  String get bitcoinDonation => 'Bitcoin Spende';

  @override
  String get bitcoinDonationSubtitle =>
      'Unterstütze uns direkt über Lightning oder On-Chain.';

  @override
  String get paypal => 'PayPal';

  @override
  String get paypalSubtitle => 'Einfach und schnell unterstützen.';

  @override
  String get affiliatePrograms => 'Affiliate-Programme';

  @override
  String get bitboxWallet => 'BitBox Hardware Wallet';

  @override
  String get bitboxSubtitle => 'Empfohlen für sichere Bitcoin-Aufbewahrung.';

  @override
  String get ledgerWallet => 'Ledger Wallet';

  @override
  String get ledgerSubtitle => 'Alternative Hardware-Wallet-Option.';

  @override
  String get cointracking => 'CoinTracking';

  @override
  String get cointrackingSubtitle => 'Portfolio-Tracking und Steuer-Tools.';

  @override
  String get thankYou => 'Danke für deine Unterstützung!';

  @override
  String get impressumTitle => 'Impressum';

  @override
  String get impressumHeader => 'Impressum';

  @override
  String get impressumLegalReference => 'Angaben gemäß § 5 DDG';

  @override
  String get impressumResponsible =>
      'Verantwortlich für den Inhalt nach § 55 Abs. 2 RStV';

  @override
  String get settingsTitle => 'Einstellungen';

  @override
  String get language => 'Sprache';

  @override
  String get languageEnglish => 'Englisch';

  @override
  String get languageGerman => 'Deutsch';

  @override
  String get languageFrench => 'Französisch';

  @override
  String get theme => 'Design';

  @override
  String get themeLight => 'Hell';

  @override
  String get themeDark => 'Dunkel';

  @override
  String get themeSystem => 'System';

  @override
  String get privacyTitle => 'Datenschutz';

  @override
  String get privacyHeader => 'Datenschutzerklärung';

  @override
  String get privacyContent =>
      'Diese Website speichert keine personenbezogenen Daten, setzt keine Cookies ein und verwendet keine Tracking- oder Analysetools, die personenbezogene Daten erfassen.\n\nWir nutzen die Google Search Console zur Überwachung und Optimierung unserer Website. Dabei werden ausschließlich aggregierte, nicht personenbezogene Daten verarbeitet. Ein Rückschluss auf einzelne Besucher ist nicht möglich.\n\nBeim Besuch der Seite kann GitHub Pages (als Hosting-Provider) automatisch technische Informationen erfassen (z. B. IP-Adresse, Browsertyp, Betriebssystem). Diese Verarbeitung erfolgt durch GitHub Pages gemäß deren Datenschutzerklärung. Auf diese Daten habe ich keinen direkten Zugriff.\n\nExterne Links öffnen in einem neuen Tab. Beim Klicken gelten die Datenschutzbestimmungen der jeweiligen Anbieter.\n\nBei Fragen zum Datenschutz wenden Sie sich bitte per E-Mail an mich.';

  @override
  String get quizConfiguration => 'Quiz-Konfiguration';

  @override
  String get difficulty => 'Schwierigkeit';

  @override
  String get difficultyEasy => 'Einfach';

  @override
  String get difficultyNormal => 'Normal';

  @override
  String get difficultyDifficult => 'Schwierig';

  @override
  String get categories => 'Kategorien';

  @override
  String get categoryHistory => 'Geschichte';

  @override
  String get categoryTechnology => 'Technologie';

  @override
  String get categoryEconomics => 'Wirtschaft';

  @override
  String get categoryGeneral => 'Allgemein';

  @override
  String get numberOfQuestions => 'Fragenanzahl';

  @override
  String get customAmount => 'Freie Eingabe';

  @override
  String availableQuestions(int count) {
    return '$count Fragen verfügbar';
  }

  @override
  String get selectAtLeastOneCategory =>
      'Bitte wählen Sie mindestens eine Kategorie';

  @override
  String get invalidQuestionCount =>
      'Bitte geben Sie eine gültige Fragenanzahl ein';

  @override
  String notEnoughQuestions(int count) {
    return 'Nur $count Fragen mit aktuellen Einstellungen verfügbar';
  }

  @override
  String get quiz => 'Quiz';

  @override
  String questionNumber(int current, int total) {
    return 'Frage $current von $total';
  }

  @override
  String get nextQuestion => 'Nächste Frage';

  @override
  String get finishQuiz => 'Quiz beenden';

  @override
  String get quitQuiz => 'Quiz verlassen?';

  @override
  String get quitQuizMessage =>
      'Möchten Sie das Quiz wirklich verlassen? Ihr Fortschritt geht verloren.';

  @override
  String get cancel => 'Abbrechen';

  @override
  String get quit => 'Verlassen';

  @override
  String get noQuestionsAvailable =>
      'Keine Fragen mit aktuellen Einstellungen verfügbar';

  @override
  String get quizResult => 'Quiz-Ergebnis';

  @override
  String get resultPerfect => 'Perfekt!';

  @override
  String get resultExcellent => 'Ausgezeichnet!';

  @override
  String get resultGood => 'Gut gemacht!';

  @override
  String get resultNeedsImprovement => 'Weiter lernen!';

  @override
  String get resultKeepPracticing => 'Weiter üben!';

  @override
  String get correctAnswers => 'Richtige Antworten';

  @override
  String get wrongAnswers => 'Falsche Antworten';

  @override
  String get totalQuestions => 'Gesamte Fragen';

  @override
  String get errorsByCategory => 'Fehler nach Kategorie';

  @override
  String get backToHome => 'Zurück zur Startseite';

  @override
  String get newQuiz => 'Neues Quiz';
}
