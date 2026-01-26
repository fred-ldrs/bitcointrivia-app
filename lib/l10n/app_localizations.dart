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
  /// **'Portfolio tracking and tax tools.'**
  String get cointrackingSubtitle;

  /// Thank you message on support screen
  ///
  /// In en, this message translates to:
  /// **'Thank you for your support!'**
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
