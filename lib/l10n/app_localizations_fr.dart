// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for French (`fr`).
class AppLocalizationsFr extends AppLocalizations {
  AppLocalizationsFr([String locale = 'fr']) : super(locale);

  @override
  String get appTitle => 'Bitcoin Trivia';

  @override
  String get startQuiz => 'Démarrer le quiz';

  @override
  String get settings => 'Paramètres';

  @override
  String get feedback => 'Commentaires';

  @override
  String get supportProject => 'Soutenir le projet';

  @override
  String get privacy => 'Politique de confidentialité';

  @override
  String get impressum => 'Mentions légales';

  @override
  String get supportTitle => 'Soutenir le projet';

  @override
  String get supportBitcoinTrivia => 'Soutenez Bitcoin Trivia';

  @override
  String get supportDescription =>
      'Si vous aimez le projet, vous pouvez le soutenir de différentes manières.';

  @override
  String get bitcoinDonation => 'Don Bitcoin';

  @override
  String get bitcoinDonationSubtitle =>
      'Soutenez-nous directement via Lightning ou On-Chain.';

  @override
  String get paypal => 'PayPal';

  @override
  String get paypalSubtitle => 'Soutien simple et rapide.';

  @override
  String get affiliatePrograms => 'Programmes d\'affiliation';

  @override
  String get bitboxWallet => 'Portefeuille matériel BitBox';

  @override
  String get bitboxSubtitle =>
      'Recommandé pour le stockage sécurisé de Bitcoin.';

  @override
  String get ledgerWallet => 'Portefeuille Ledger';

  @override
  String get ledgerSubtitle => 'Option alternative de portefeuille matériel.';

  @override
  String get cointracking => 'CoinTracking';

  @override
  String get cointrackingSubtitle => 'Suivi de portefeuille et outils fiscaux.';

  @override
  String get thankYou => 'Merci pour votre soutien !';

  @override
  String get impressumTitle => 'Mentions légales';

  @override
  String get impressumHeader => 'Mentions légales';

  @override
  String get impressumLegalReference => 'Informations conformément au § 5 DDG';

  @override
  String get impressumResponsible =>
      'Responsable du contenu selon § 55 Abs. 2 RStV';

  @override
  String get settingsTitle => 'Paramètres';

  @override
  String get language => 'Langue';

  @override
  String get languageEnglish => 'Anglais';

  @override
  String get languageGerman => 'Allemand';

  @override
  String get languageFrench => 'Français';

  @override
  String get theme => 'Thème';

  @override
  String get themeLight => 'Clair';

  @override
  String get themeDark => 'Sombre';

  @override
  String get themeSystem => 'Système';

  @override
  String get privacyTitle => 'Politique de confidentialité';

  @override
  String get privacyHeader => 'Politique de confidentialité';

  @override
  String get privacyContent =>
      'Ce site web ne stocke aucune donnée personnelle, n\'utilise pas de cookies et n\'utilise pas d\'outils de suivi ou d\'analyse qui collectent des données personnelles.\n\nNous utilisons Google Search Console pour surveiller et optimiser notre site web. Seules des données agrégées et non personnelles sont traitées. Il n\'est pas possible de remonter jusqu\'aux visiteurs individuels.\n\nLors de la visite du site, GitHub Pages (en tant que fournisseur d\'hébergement) peut automatiquement collecter des informations techniques (par exemple, adresse IP, type de navigateur, système d\'exploitation). Ce traitement est effectué par GitHub Pages conformément à leur politique de confidentialité. Je n\'ai pas d\'accès direct à ces données.\n\nLes liens externes s\'ouvrent dans un nouvel onglet. En cliquant, les politiques de confidentialité des fournisseurs respectifs s\'appliquent.\n\nPour toute question concernant la confidentialité, veuillez me contacter par e-mail.';

  @override
  String get quizConfiguration => 'Configuration du Quiz';

  @override
  String get difficulty => 'Difficulté';

  @override
  String get difficultyEasy => 'Facile';

  @override
  String get difficultyNormal => 'Normal';

  @override
  String get difficultyDifficult => 'Difficile';

  @override
  String get categories => 'Catégories';

  @override
  String get categoryHistory => 'Histoire';

  @override
  String get categoryTechnology => 'Technologie';

  @override
  String get categoryEconomics => 'Économie';

  @override
  String get categoryGeneral => 'Général';

  @override
  String get numberOfQuestions => 'Nombre de questions';

  @override
  String get customAmount => 'Montant personnalisé';

  @override
  String availableQuestions(int count) {
    return '$count questions disponibles';
  }

  @override
  String get selectAtLeastOneCategory =>
      'Veuillez sélectionner au moins une catégorie';

  @override
  String get invalidQuestionCount =>
      'Veuillez entrer un nombre de questions valide';

  @override
  String notEnoughQuestions(int count) {
    return 'Seulement $count questions disponibles avec les paramètres actuels';
  }

  @override
  String get quiz => 'Quiz';

  @override
  String questionNumber(int current, int total) {
    return 'Question $current sur $total';
  }

  @override
  String get nextQuestion => 'Question suivante';

  @override
  String get finishQuiz => 'Terminer le quiz';

  @override
  String get quitQuiz => 'Quitter le quiz ?';

  @override
  String get quitQuizMessage =>
      'Êtes-vous sûr de vouloir quitter ? Votre progression sera perdue.';

  @override
  String get cancel => 'Annuler';

  @override
  String get quit => 'Quitter';

  @override
  String get noQuestionsAvailable =>
      'Aucune question disponible avec les paramètres actuels';

  @override
  String get quizResult => 'Résultat du quiz';

  @override
  String get resultPerfect => 'Parfait !';

  @override
  String get resultExcellent => 'Excellent !';

  @override
  String get resultGood => 'Bon travail !';

  @override
  String get resultNeedsImprovement => 'Continuez à apprendre !';

  @override
  String get resultKeepPracticing => 'Continuez à pratiquer !';

  @override
  String get correctAnswers => 'Réponses correctes';

  @override
  String get wrongAnswers => 'Réponses incorrectes';

  @override
  String get totalQuestions => 'Questions totales';

  @override
  String get errorsByCategory => 'Erreurs par catégorie';

  @override
  String get backToHome => 'Retour à l\'accueil';

  @override
  String get newQuiz => 'Nouveau quiz';
}
