import 'dart:async';

import 'package:flutter/foundation.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:intl/intl.dart' as intl;

import 'app_localizations_en.dart';
import 'app_localizations_fa.dart';

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
    Locale('en'),
    Locale('fa')
  ];

  /// No description provided for @profilePageTitle.
  ///
  /// In en, this message translates to:
  /// **'Profile Page'**
  String get profilePageTitle;

  /// No description provided for @tooltipSunrise.
  ///
  /// In en, this message translates to:
  /// **'Toggle Theme'**
  String get tooltipSunrise;

  /// No description provided for @tooltipChat.
  ///
  /// In en, this message translates to:
  /// **'Chat'**
  String get tooltipChat;

  /// No description provided for @tooltipMoreOptions.
  ///
  /// In en, this message translates to:
  /// **'More Options'**
  String get tooltipMoreOptions;

  /// No description provided for @developerName.
  ///
  /// In en, this message translates to:
  /// **'Hamidreza Pakpour'**
  String get developerName;

  /// No description provided for @netFlutterDeveloper.
  ///
  /// In en, this message translates to:
  /// **'.Net & Flutter Developer'**
  String get netFlutterDeveloper;

  /// No description provided for @locationIcon.
  ///
  /// In en, this message translates to:
  /// **'Location Icon'**
  String get locationIcon;

  /// No description provided for @locationTehranIran.
  ///
  /// In en, this message translates to:
  /// **'Tehran, Iran'**
  String get locationTehranIran;

  /// No description provided for @likeIconTooltip.
  ///
  /// In en, this message translates to:
  /// **'Like'**
  String get likeIconTooltip;

  /// No description provided for @profileDescription.
  ///
  /// In en, this message translates to:
  /// **'A .NET and Flutter developer proficient in C# and Dart, dedicated to creating user-friendly and scalable applications. With experience in designing and implementing web and mobile software solutions, they provide innovative and optimized approaches to meet business needs. Additionally, they are passionate about continuous learning and staying updated with the latest technologies.'**
  String get profileDescription;

  /// No description provided for @skillsTitle.
  ///
  /// In en, this message translates to:
  /// **'Skills'**
  String get skillsTitle;

  /// No description provided for @skillIconTooltip.
  ///
  /// In en, this message translates to:
  /// **'Expand/Collapse Skills'**
  String get skillIconTooltip;

  /// No description provided for @skillPhotoshop.
  ///
  /// In en, this message translates to:
  /// **'Photoshop'**
  String get skillPhotoshop;

  /// No description provided for @skillLightRoom.
  ///
  /// In en, this message translates to:
  /// **'LightRoom'**
  String get skillLightRoom;

  /// No description provided for @skillAfterEffect.
  ///
  /// In en, this message translates to:
  /// **'AfterEffect'**
  String get skillAfterEffect;

  /// No description provided for @skillIllustrator.
  ///
  /// In en, this message translates to:
  /// **'Illustrator'**
  String get skillIllustrator;

  /// No description provided for @skillAdobeXD.
  ///
  /// In en, this message translates to:
  /// **'AdobeXD'**
  String get skillAdobeXD;

  /// No description provided for @personalInformationTitle.
  ///
  /// In en, this message translates to:
  /// **'Personal Information'**
  String get personalInformationTitle;

  /// No description provided for @emailLabel.
  ///
  /// In en, this message translates to:
  /// **'Email'**
  String get emailLabel;

  /// No description provided for @passwordLabel.
  ///
  /// In en, this message translates to:
  /// **'Password'**
  String get passwordLabel;

  /// No description provided for @saveButton.
  ///
  /// In en, this message translates to:
  /// **'Save'**
  String get saveButton;

  /// No description provided for @enLanguage.
  ///
  /// In en, this message translates to:
  /// **'English'**
  String get enLanguage;

  /// No description provided for @faLanguage.
  ///
  /// In en, this message translates to:
  /// **'Persian'**
  String get faLanguage;

  /// No description provided for @selectedLanguage.
  ///
  /// In en, this message translates to:
  /// **'Selected Language'**
  String get selectedLanguage;
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
      <String>['en', 'fa'].contains(locale.languageCode);

  @override
  bool shouldReload(_AppLocalizationsDelegate old) => false;
}

AppLocalizations lookupAppLocalizations(Locale locale) {
  // Lookup logic when only language code is specified.
  switch (locale.languageCode) {
    case 'en':
      return AppLocalizationsEn();
    case 'fa':
      return AppLocalizationsFa();
  }

  throw FlutterError(
      'AppLocalizations.delegate failed to load unsupported locale "$locale". This is likely '
      'an issue with the localizations generation tool. Please file an issue '
      'on GitHub with a reproducible sample app and the gen-l10n configuration '
      'that was used.');
}
