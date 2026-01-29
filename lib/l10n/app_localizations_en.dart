// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for English (`en`).
class AppLocalizationsEn extends AppLocalizations {
  AppLocalizationsEn([String locale = 'en']) : super(locale);

  @override
  String get appTitle => 'Bitcoin Trivia';

  @override
  String get startQuiz => 'Start Quiz';

  @override
  String get settings => 'Settings';

  @override
  String get feedback => 'Feedback';

  @override
  String get feedbackTitle => 'Send Feedback';

  @override
  String get feedbackPlaceholder => 'Write your feedback here...';

  @override
  String get feedbackSend => 'Send';

  @override
  String get feedbackEmpty => 'Please enter your feedback';

  @override
  String get feedbackEmailSubject => 'Feedback from the App';

  @override
  String get supportProject => 'Support the Project';

  @override
  String get privacy => 'Privacy Policy';

  @override
  String get impressum => 'Legal Notice';

  @override
  String get legal => 'Legal';

  @override
  String get statistics => 'Statistics';

  @override
  String get overallStatistics => 'Overall Statistics';

  @override
  String get difficultyStatistics => 'Statistics by Difficulty';

  @override
  String get totalQuestions => 'Total Questions';

  @override
  String get correctAnswers => 'Correct Answers';

  @override
  String get wrongAnswers => 'Wrong Answers';

  @override
  String get accuracy => 'Accuracy';

  @override
  String get bestStreak => 'Best Streak';

  @override
  String get total => 'Total';

  @override
  String get correct => 'Correct';

  @override
  String get wrong => 'Wrong';

  @override
  String get easy => 'Easy';

  @override
  String get medium => 'Medium';

  @override
  String get difficult => 'Hard';

  @override
  String get resetStatistics => 'Reset Statistics';

  @override
  String get resetStatisticsConfirmation =>
      'Are you sure you want to reset all statistics? This action cannot be undone.';

  @override
  String get cancel => 'Cancel';

  @override
  String get reset => 'Reset';

  @override
  String get statisticsReset => 'Statistics have been reset';

  @override
  String get statisticsStorageInfo =>
      'Statistics are stored locally on your device. If you change devices, you can manually backup and transfer the data.';

  @override
  String get supportTitle => 'Support the Project';

  @override
  String get supportBitcoinTrivia => 'Support Bitcoin Trivia';

  @override
  String get supportDescription =>
      'If you like the project, you can support it in various ways.';

  @override
  String get bitcoinDonation => 'Bitcoin Donation';

  @override
  String get bitcoinDonationSubtitle =>
      'Support us directly via Lightning or On-Chain.';

  @override
  String get paypal => 'PayPal';

  @override
  String get paypalSubtitle => 'Simple and quick support.';

  @override
  String get affiliatePrograms => 'Affiliate Programs';

  @override
  String get bitboxWallet => 'BitBox Hardware Wallet';

  @override
  String get bitboxSubtitle => 'Recommended for secure Bitcoin storage.';

  @override
  String get ledgerWallet => 'Ledger Wallet';

  @override
  String get ledgerSubtitle => 'Alternative hardware wallet option.';

  @override
  String get cointracking => 'CoinTracking';

  @override
  String get cointrackingSubtitle =>
      'Portfolio tracking and tax tools. 10% discount!';

  @override
  String get blockpit => 'Blockpit';

  @override
  String get blockpitSubtitle =>
      'Portfolio tracking and tax tools. 15% discount!';

  @override
  String get bisonApp => 'BISON App';

  @override
  String get bisonAppSubtitle => 'Easy and secure crypto trading platform.';

  @override
  String get bitvavo => 'Bitvavo';

  @override
  String get bitvavoSubtitle => 'Trade €10,000 without fees.';

  @override
  String get jadeWallet => 'Blockstream Jade Wallet';

  @override
  String get jadeWalletSubtitle => 'Secure hardware wallet from Blockstream.';

  @override
  String get buyBitcoin => 'Buy Bitcoin';

  @override
  String get storeBitcoin => 'Store Bitcoin';

  @override
  String get taxAndTracking => 'Tax & Tracking';

  @override
  String get donate => 'Donate';

  @override
  String get bitcoinDonationViaOpenNode =>
      'Support us with Bitcoin through OpenNode - the preferred way!';

  @override
  String get paypalDonationSubtitle =>
      'For those who prefer to use traditional payment methods.';

  @override
  String get thankYou => '🧡 Thank you for your support! 🧡';

  @override
  String get impressumTitle => 'Legal Notice';

  @override
  String get impressumHeader => 'Legal Notice';

  @override
  String get impressumLegalReference => 'Information according to § 5 DDG';

  @override
  String get impressumResponsible =>
      'Responsible for content according to § 55 Abs. 2 RStV';

  @override
  String get settingsTitle => 'Settings';

  @override
  String get language => 'Language';

  @override
  String get languageEnglish => 'English';

  @override
  String get languageGerman => 'German';

  @override
  String get languageFrench => 'French';

  @override
  String get theme => 'Theme';

  @override
  String get themeLight => 'Light';

  @override
  String get themeDark => 'Dark';

  @override
  String get themeSystem => 'System';

  @override
  String get privacyTitle => 'Privacy Policy';

  @override
  String get privacyHeader => 'Privacy Policy';

  @override
  String get privacyContent =>
      'This website does not store any personal data, does not use cookies, and does not use tracking or analytics tools that collect personal data.\n\nWe use Google Search Console to monitor and optimize our website. Only aggregated, non-personal data is processed. Tracing back to individual visitors is not possible.\n\nWhen visiting the site, GitHub Pages (as hosting provider) may automatically collect technical information (e.g., IP address, browser type, operating system). This processing is carried out by GitHub Pages in accordance with their privacy policy. I do not have direct access to this data.\n\nExternal links open in a new tab. When clicking, the privacy policies of the respective providers apply.\n\nIf you have any questions about privacy, please contact me by email.';

  @override
  String get quizConfiguration => 'Quiz Configuration';

  @override
  String get difficulty => 'Difficulty';

  @override
  String get difficultyEasy => 'Easy';

  @override
  String get difficultyNormal => 'Normal';

  @override
  String get difficultyDifficult => 'Difficult';

  @override
  String get categories => 'Categories';

  @override
  String get categoryHistory => 'History';

  @override
  String get categoryTech => 'Technology';

  @override
  String get categoryCulture => 'Culture';

  @override
  String get categoryGeneralKnowledge => 'General Knowledge';

  @override
  String get numberOfQuestions => 'Number of Questions';

  @override
  String get customAmount => 'Custom Amount';

  @override
  String availableQuestions(int count) {
    return '$count questions available';
  }

  @override
  String get selectAtLeastOneCategory => 'Please select at least one category';

  @override
  String get invalidQuestionCount => 'Please enter a valid number of questions';

  @override
  String notEnoughQuestions(int count) {
    return 'Only $count questions available with current settings';
  }

  @override
  String get quiz => 'Quiz';

  @override
  String questionNumber(int current, int total) {
    return 'Question $current of $total';
  }

  @override
  String get nextQuestion => 'Next Question';

  @override
  String get finishQuiz => 'Finish Quiz';

  @override
  String get quitQuiz => 'Quit Quiz?';

  @override
  String get quitQuizMessage =>
      'Are you sure you want to quit? Your progress will be lost.';

  @override
  String get quit => 'Quit';

  @override
  String get noQuestionsAvailable =>
      'No questions available with current settings';

  @override
  String get quizResult => 'Quiz Result';

  @override
  String get resultPerfect => 'Perfect!';

  @override
  String get resultExcellent => 'Excellent!';

  @override
  String get resultGood => 'Good Job!';

  @override
  String get resultNeedsImprovement => 'Keep Learning!';

  @override
  String get resultKeepPracticing => 'Keep Practicing!';

  @override
  String get errorsByCategory => 'Errors by Category';

  @override
  String get backToHome => 'Back to Home';

  @override
  String get newQuiz => 'New Quiz';
}
