import 'dart:async';

import 'package:flutter/foundation.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:intl/intl.dart' as intl;

import 'app_localizations_de.dart';
import 'app_localizations_en.dart';
import 'app_localizations_fr.dart';

// ignore_for_file: type=lint

/// Callers can lookup localized strings with an instance of AppLocalizations
/// returned by `AppLocalizations.of(context)`.
///
/// Applications need to include `AppLocalizations.delegate()` in their app's
/// `localizationDelegates` list, and the locales they support in the app's
/// `supportedLocales` list. For example:
///
/// ```dart
/// import 'l10n/app_localizations.dart';
///
/// return MaterialApp(
///   localizationsDelegates: AppLocalizations.localizationsDelegates,
///   supportedLocales: AppLocalizations.supportedLocales,
///   home: MyApplicationHome(),
/// );
/// ```
///
/// ## Update pubspec.yaml
///
/// Please make sure to update your pubspec.yaml to include the following
/// packages:
///
/// ```yaml
/// dependencies:
///   # Internationalization support.
///   flutter_localizations:
///     sdk: flutter
///   intl: any # Use the pinned version from flutter_localizations
///
///   # Rest of dependencies
/// ```
///
/// ## iOS Applications
///
/// iOS applications define key application metadata, including supported
/// locales, in an Info.plist file that is built into the application bundle.
/// To configure the locales supported by your app, you’ll need to edit this
/// file.
///
/// First, open your project’s ios/Runner.xcworkspace Xcode workspace file.
/// Then, in the Project Navigator, open the Info.plist file under the Runner
/// project’s Runner folder.
///
/// Next, select the Information Property List item, select Add Item from the
/// Editor menu, then select Localizations from the pop-up menu.
///
/// Select and expand the newly-created Localizations item then, for each
/// locale your application supports, add a new item and select the locale
/// you wish to add from the pop-up menu in the Value field. This list should
/// be consistent with the languages listed in the AppLocalizations.supportedLocales
/// property.
abstract class AppLocalizations {
  AppLocalizations(String locale)
    : localeName = intl.Intl.canonicalizedLocale(locale.toString());

  final String localeName;

  static AppLocalizations? of(BuildContext context) {
    return Localizations.of<AppLocalizations>(context, AppLocalizations);
  }

  static const LocalizationsDelegate<AppLocalizations> delegate =
      _AppLocalizationsDelegate();

  /// A list of this localizations delegate along with the default localizations
  /// delegates.
  ///
  /// Returns a list of localizations delegates containing this delegate along with
  /// GlobalMaterialLocalizations.delegate, GlobalCupertinoLocalizations.delegate,
  /// and GlobalWidgetsLocalizations.delegate.
  ///
  /// Additional delegates can be added by appending to this list in
  /// MaterialApp. This list does not have to be used at all if a custom list
  /// of delegates is preferred or required.
  static const List<LocalizationsDelegate<dynamic>> localizationsDelegates =
      <LocalizationsDelegate<dynamic>>[
        delegate,
        GlobalMaterialLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
      ];

  /// A list of this localizations delegate's supported locales.
  static const List<Locale> supportedLocales = <Locale>[
    Locale('de'),
    Locale('en'),
    Locale('fr'),
  ];

  /// The application title
  ///
  /// In en, this message translates to:
  /// **'Bitcoin Trivia'**
  String get appTitle;

  /// Button text to start the quiz
  ///
  /// In en, this message translates to:
  /// **'Start Quiz'**
  String get startQuiz;

  /// Settings menu item
  ///
  /// In en, this message translates to:
  /// **'Settings'**
  String get settings;

  /// Feedback menu item
  ///
  /// In en, this message translates to:
  /// **'Feedback'**
  String get feedback;

  /// No description provided for @feedbackTitle.
  ///
  /// In en, this message translates to:
  /// **'Send Feedback'**
  String get feedbackTitle;

  /// No description provided for @feedbackPlaceholder.
  ///
  /// In en, this message translates to:
  /// **'Write your feedback here...'**
  String get feedbackPlaceholder;

  /// No description provided for @feedbackSend.
  ///
  /// In en, this message translates to:
  /// **'Send'**
  String get feedbackSend;

  /// No description provided for @feedbackEmpty.
  ///
  /// In en, this message translates to:
  /// **'Please enter your feedback'**
  String get feedbackEmpty;

  /// No description provided for @feedbackEmailSubject.
  ///
  /// In en, this message translates to:
  /// **'Feedback from the App'**
  String get feedbackEmailSubject;

  /// Support menu item
  ///
  /// In en, this message translates to:
  /// **'Support the Project'**
  String get supportProject;

  /// Privacy policy menu item
  ///
  /// In en, this message translates to:
  /// **'Privacy Policy'**
  String get privacy;

  /// Impressum/Legal notice menu item
  ///
  /// In en, this message translates to:
  /// **'Legal Notice'**
  String get impressum;

  /// Title of the support screen
  ///
  /// In en, this message translates to:
  /// **'Support the Project'**
  String get supportTitle;

  /// Header text on support screen
  ///
  /// In en, this message translates to:
  /// **'Support Bitcoin Trivia'**
  String get supportBitcoinTrivia;

  /// Description text on support screen
  ///
  /// In en, this message translates to:
  /// **'If you like the project, you can support it in various ways.'**
  String get supportDescription;

  /// Bitcoin donation option title
  ///
  /// In en, this message translates to:
  /// **'Bitcoin Donation'**
  String get bitcoinDonation;

  /// Bitcoin donation option subtitle
  ///
  /// In en, this message translates to:
  /// **'Support us directly via Lightning or On-Chain.'**
  String get bitcoinDonationSubtitle;

  /// PayPal option title
  ///
  /// In en, this message translates to:
  /// **'PayPal'**
  String get paypal;

  /// PayPal option subtitle
  ///
  /// In en, this message translates to:
  /// **'Simple and quick support.'**
  String get paypalSubtitle;

  /// Affiliate programs section header
  ///
  /// In en, this message translates to:
  /// **'Affiliate Programs'**
  String get affiliatePrograms;

  /// BitBox wallet affiliate title
  ///
  /// In en, this message translates to:
  /// **'BitBox Hardware Wallet'**
  String get bitboxWallet;

  /// BitBox wallet subtitle
  ///
  /// In en, this message translates to:
  /// **'Recommended for secure Bitcoin storage.'**
  String get bitboxSubtitle;

  /// Ledger wallet affiliate title
  ///
  /// In en, this message translates to:
  /// **'Ledger Wallet'**
  String get ledgerWallet;

  /// Ledger wallet subtitle
  ///
  /// In en, this message translates to:
  /// **'Alternative hardware wallet option.'**
  String get ledgerSubtitle;

  /// CoinTracking affiliate title
  ///
  /// In en, this message translates to:
  /// **'CoinTracking'**
  String get cointracking;

  /// CoinTracking subtitle
  ///
  /// In en, this message translates to:
  /// **'Portfolio tracking and tax tools. 10% discount!'**
  String get cointrackingSubtitle;

  /// No description provided for @blockpit.
  ///
  /// In en, this message translates to:
  /// **'Blockpit'**
  String get blockpit;

  /// No description provided for @blockpitSubtitle.
  ///
  /// In en, this message translates to:
  /// **'Portfolio tracking and tax tools. 15% discount!'**
  String get blockpitSubtitle;

  /// No description provided for @bisonApp.
  ///
  /// In en, this message translates to:
  /// **'BISON App'**
  String get bisonApp;

  /// No description provided for @bisonAppSubtitle.
  ///
  /// In en, this message translates to:
  /// **'Easy and secure crypto trading platform.'**
  String get bisonAppSubtitle;

  /// No description provided for @bitvavo.
  ///
  /// In en, this message translates to:
  /// **'Bitvavo'**
  String get bitvavo;

  /// No description provided for @bitvavoSubtitle.
  ///
  /// In en, this message translates to:
  /// **'Trade €10,000 without fees.'**
  String get bitvavoSubtitle;

  /// No description provided for @jadeWallet.
  ///
  /// In en, this message translates to:
  /// **'Blockstream Jade Wallet'**
  String get jadeWallet;

  /// No description provided for @jadeWalletSubtitle.
  ///
  /// In en, this message translates to:
  /// **'Secure hardware wallet from Blockstream.'**
  String get jadeWalletSubtitle;

  /// No description provided for @buyBitcoin.
  ///
  /// In en, this message translates to:
  /// **'Buy Bitcoin'**
  String get buyBitcoin;

  /// No description provided for @storeBitcoin.
  ///
  /// In en, this message translates to:
  /// **'Store Bitcoin'**
  String get storeBitcoin;

  /// No description provided for @taxAndTracking.
  ///
  /// In en, this message translates to:
  /// **'Tax & Tracking'**
  String get taxAndTracking;

  /// No description provided for @donate.
  ///
  /// In en, this message translates to:
  /// **'Donate'**
  String get donate;

  /// No description provided for @bitcoinDonationViaOpenNode.
  ///
  /// In en, this message translates to:
  /// **'Support us with Bitcoin through OpenNode - the preferred way!'**
  String get bitcoinDonationViaOpenNode;

  /// No description provided for @paypalDonationSubtitle.
  ///
  /// In en, this message translates to:
  /// **'For those who prefer to use traditional payment methods.'**
  String get paypalDonationSubtitle;

  /// Thank you message on support screen
  ///
  /// In en, this message translates to:
  /// **'🧡 Thank you for your support! 🧡'**
  String get thankYou;

  /// Title of the impressum screen
  ///
  /// In en, this message translates to:
  /// **'Legal Notice'**
  String get impressumTitle;

  /// Header on impressum screen
  ///
  /// In en, this message translates to:
  /// **'Legal Notice'**
  String get impressumHeader;

  /// Legal reference text
  ///
  /// In en, this message translates to:
  /// **'Information according to § 5 DDG'**
  String get impressumLegalReference;

  /// Responsible for content label
  ///
  /// In en, this message translates to:
  /// **'Responsible for content according to § 55 Abs. 2 RStV'**
  String get impressumResponsible;

  /// Title of the settings screen
  ///
  /// In en, this message translates to:
  /// **'Settings'**
  String get settingsTitle;

  /// Language setting label
  ///
  /// In en, this message translates to:
  /// **'Language'**
  String get language;

  /// English language option
  ///
  /// In en, this message translates to:
  /// **'English'**
  String get languageEnglish;

  /// German language option
  ///
  /// In en, this message translates to:
  /// **'German'**
  String get languageGerman;

  /// French language option
  ///
  /// In en, this message translates to:
  /// **'French'**
  String get languageFrench;

  /// Theme setting label
  ///
  /// In en, this message translates to:
  /// **'Theme'**
  String get theme;

  /// Light theme option
  ///
  /// In en, this message translates to:
  /// **'Light'**
  String get themeLight;

  /// Dark theme option
  ///
  /// In en, this message translates to:
  /// **'Dark'**
  String get themeDark;

  /// System theme option
  ///
  /// In en, this message translates to:
  /// **'System'**
  String get themeSystem;

  /// Title of the privacy policy screen
  ///
  /// In en, this message translates to:
  /// **'Privacy Policy'**
  String get privacyTitle;

  /// Header on privacy policy screen
  ///
  /// In en, this message translates to:
  /// **'Privacy Policy'**
  String get privacyHeader;

  /// Privacy policy content text
  ///
  /// In en, this message translates to:
  /// **'This website does not store any personal data, does not use cookies, and does not use tracking or analytics tools that collect personal data.\n\nWe use Google Search Console to monitor and optimize our website. Only aggregated, non-personal data is processed. Tracing back to individual visitors is not possible.\n\nWhen visiting the site, GitHub Pages (as hosting provider) may automatically collect technical information (e.g., IP address, browser type, operating system). This processing is carried out by GitHub Pages in accordance with their privacy policy. I do not have direct access to this data.\n\nExternal links open in a new tab. When clicking, the privacy policies of the respective providers apply.\n\nIf you have any questions about privacy, please contact me by email.'**
  String get privacyContent;

  /// No description provided for @quizConfiguration.
  ///
  /// In en, this message translates to:
  /// **'Quiz Configuration'**
  String get quizConfiguration;

  /// No description provided for @difficulty.
  ///
  /// In en, this message translates to:
  /// **'Difficulty'**
  String get difficulty;

  /// No description provided for @difficultyEasy.
  ///
  /// In en, this message translates to:
  /// **'Easy'**
  String get difficultyEasy;

  /// No description provided for @difficultyNormal.
  ///
  /// In en, this message translates to:
  /// **'Normal'**
  String get difficultyNormal;

  /// No description provided for @difficultyDifficult.
  ///
  /// In en, this message translates to:
  /// **'Difficult'**
  String get difficultyDifficult;

  /// No description provided for @categories.
  ///
  /// In en, this message translates to:
  /// **'Categories'**
  String get categories;

  /// No description provided for @categoryHistory.
  ///
  /// In en, this message translates to:
  /// **'History'**
  String get categoryHistory;

  /// No description provided for @categoryTech.
  ///
  /// In en, this message translates to:
  /// **'Technology'**
  String get categoryTech;

  /// No description provided for @categoryCulture.
  ///
  /// In en, this message translates to:
  /// **'Culture'**
  String get categoryCulture;

  /// No description provided for @categoryGeneralKnowledge.
  ///
  /// In en, this message translates to:
  /// **'General Knowledge'**
  String get categoryGeneralKnowledge;

  /// No description provided for @numberOfQuestions.
  ///
  /// In en, this message translates to:
  /// **'Number of Questions'**
  String get numberOfQuestions;

  /// No description provided for @customAmount.
  ///
  /// In en, this message translates to:
  /// **'Custom Amount'**
  String get customAmount;

  /// No description provided for @availableQuestions.
  ///
  /// In en, this message translates to:
  /// **'{count} questions available'**
  String availableQuestions(int count);

  /// No description provided for @selectAtLeastOneCategory.
  ///
  /// In en, this message translates to:
  /// **'Please select at least one category'**
  String get selectAtLeastOneCategory;

  /// No description provided for @invalidQuestionCount.
  ///
  /// In en, this message translates to:
  /// **'Please enter a valid number of questions'**
  String get invalidQuestionCount;

  /// No description provided for @notEnoughQuestions.
  ///
  /// In en, this message translates to:
  /// **'Only {count} questions available with current settings'**
  String notEnoughQuestions(int count);

  /// No description provided for @quiz.
  ///
  /// In en, this message translates to:
  /// **'Quiz'**
  String get quiz;

  /// No description provided for @questionNumber.
  ///
  /// In en, this message translates to:
  /// **'Question {current} of {total}'**
  String questionNumber(int current, int total);

  /// No description provided for @nextQuestion.
  ///
  /// In en, this message translates to:
  /// **'Next Question'**
  String get nextQuestion;

  /// No description provided for @finishQuiz.
  ///
  /// In en, this message translates to:
  /// **'Finish Quiz'**
  String get finishQuiz;

  /// No description provided for @quitQuiz.
  ///
  /// In en, this message translates to:
  /// **'Quit Quiz?'**
  String get quitQuiz;

  /// No description provided for @quitQuizMessage.
  ///
  /// In en, this message translates to:
  /// **'Are you sure you want to quit? Your progress will be lost.'**
  String get quitQuizMessage;

  /// No description provided for @cancel.
  ///
  /// In en, this message translates to:
  /// **'Cancel'**
  String get cancel;

  /// No description provided for @quit.
  ///
  /// In en, this message translates to:
  /// **'Quit'**
  String get quit;

  /// No description provided for @noQuestionsAvailable.
  ///
  /// In en, this message translates to:
  /// **'No questions available with current settings'**
  String get noQuestionsAvailable;

  /// No description provided for @quizResult.
  ///
  /// In en, this message translates to:
  /// **'Quiz Result'**
  String get quizResult;

  /// No description provided for @resultPerfect.
  ///
  /// In en, this message translates to:
  /// **'Perfect!'**
  String get resultPerfect;

  /// No description provided for @resultExcellent.
  ///
  /// In en, this message translates to:
  /// **'Excellent!'**
  String get resultExcellent;

  /// No description provided for @resultGood.
  ///
  /// In en, this message translates to:
  /// **'Good Job!'**
  String get resultGood;

  /// No description provided for @resultNeedsImprovement.
  ///
  /// In en, this message translates to:
  /// **'Keep Learning!'**
  String get resultNeedsImprovement;

  /// No description provided for @resultKeepPracticing.
  ///
  /// In en, this message translates to:
  /// **'Keep Practicing!'**
  String get resultKeepPracticing;

  /// No description provided for @correctAnswers.
  ///
  /// In en, this message translates to:
  /// **'Correct Answers'**
  String get correctAnswers;

  /// No description provided for @wrongAnswers.
  ///
  /// In en, this message translates to:
  /// **'Wrong Answers'**
  String get wrongAnswers;

  /// No description provided for @totalQuestions.
  ///
  /// In en, this message translates to:
  /// **'Total Questions'**
  String get totalQuestions;

  /// No description provided for @errorsByCategory.
  ///
  /// In en, this message translates to:
  /// **'Errors by Category'**
  String get errorsByCategory;

  /// No description provided for @backToHome.
  ///
  /// In en, this message translates to:
  /// **'Back to Home'**
  String get backToHome;

  /// No description provided for @newQuiz.
  ///
  /// In en, this message translates to:
  /// **'New Quiz'**
  String get newQuiz;
}

class _AppLocalizationsDelegate
    extends LocalizationsDelegate<AppLocalizations> {
  const _AppLocalizationsDelegate();

  @override
  Future<AppLocalizations> load(Locale locale) {
    return SynchronousFuture<AppLocalizations>(lookupAppLocalizations(locale));
  }

  @override
  bool isSupported(Locale locale) =>
      <String>['de', 'en', 'fr'].contains(locale.languageCode);

  @override
  bool shouldReload(_AppLocalizationsDelegate old) => false;
}

AppLocalizations lookupAppLocalizations(Locale locale) {
  // Lookup logic when only language code is specified.
  switch (locale.languageCode) {
    case 'de':
      return AppLocalizationsDe();
    case 'en':
      return AppLocalizationsEn();
    case 'fr':
      return AppLocalizationsFr();
  }

  throw FlutterError(
    'AppLocalizations.delegate failed to load unsupported locale "$locale". This is likely '
    'an issue with the localizations generation tool. Please file an issue '
    'on GitHub with a reproducible sample app and the gen-l10n configuration '
    'that was used.',
  );
}
