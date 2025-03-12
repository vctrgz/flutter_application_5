import 'dart:async';

import 'package:flutter/foundation.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:intl/intl.dart' as intl;

import 'app_localizations_en.dart';
import 'app_localizations_es.dart';
import 'app_localizations_fr.dart';
import 'app_localizations_it.dart';

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
  AppLocalizations(String locale) : localeName = intl.Intl.canonicalizedLocale(locale.toString());

  final String localeName;

  static AppLocalizations of(BuildContext context) {
    return Localizations.of<AppLocalizations>(context, AppLocalizations)!;
  }

  static const LocalizationsDelegate<AppLocalizations> delegate = _AppLocalizationsDelegate();

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
  static const List<LocalizationsDelegate<dynamic>> localizationsDelegates = <LocalizationsDelegate<dynamic>>[
    delegate,
    GlobalMaterialLocalizations.delegate,
    GlobalCupertinoLocalizations.delegate,
    GlobalWidgetsLocalizations.delegate,
  ];

  /// A list of this localizations delegate's supported locales.
  static const List<Locale> supportedLocales = <Locale>[
    Locale('en'),
    Locale('es'),
    Locale('fr'),
    Locale('it')
  ];

  /// No description provided for @appTitle.
  ///
  /// In es, this message translates to:
  /// **'Flutter'**
  String get appTitle;

  /// No description provided for @loginPage.
  ///
  /// In es, this message translates to:
  /// **'Página de inicio de sesión'**
  String get loginPage;

  /// No description provided for @emailLabel.
  ///
  /// In es, this message translates to:
  /// **'Correo electrónico'**
  String get emailLabel;

  /// No description provided for @emailHint.
  ///
  /// In es, this message translates to:
  /// **'Ingresa tu correo'**
  String get emailHint;

  /// No description provided for @passwordLabel.
  ///
  /// In es, this message translates to:
  /// **'Contraseña'**
  String get passwordLabel;

  /// No description provided for @passwordHint.
  ///
  /// In es, this message translates to:
  /// **'Ingresa tu contraseña'**
  String get passwordHint;

  /// No description provided for @forgotPassword.
  ///
  /// In es, this message translates to:
  /// **'¿Olvidaste tu contraseña?'**
  String get forgotPassword;

  /// No description provided for @loginButton.
  ///
  /// In es, this message translates to:
  /// **'Iniciar sesión'**
  String get loginButton;

  /// No description provided for @invalidEmail.
  ///
  /// In es, this message translates to:
  /// **'Por favor ingresa un correo válido'**
  String get invalidEmail;

  /// No description provided for @invalidPassword.
  ///
  /// In es, this message translates to:
  /// **'Contraseña incorrecta'**
  String get invalidPassword;

  /// No description provided for @helloUser.
  ///
  /// In es, this message translates to:
  /// **'Hola '**
  String get helloUser;

  /// No description provided for @cities.
  ///
  /// In es, this message translates to:
  /// **'CIUDADES'**
  String get cities;

  /// No description provided for @shopping.
  ///
  /// In es, this message translates to:
  /// **'COMPRAS'**
  String get shopping;

  /// No description provided for @delete.
  ///
  /// In es, this message translates to:
  /// **'Eliminar'**
  String get delete;

  /// No description provided for @population.
  ///
  /// In es, this message translates to:
  /// **'Población'**
  String get population;

  /// No description provided for @date.
  ///
  /// In es, this message translates to:
  /// **'Fecha de publicación'**
  String get date;

  /// No description provided for @description.
  ///
  /// In es, this message translates to:
  /// **'Descripción'**
  String get description;

  /// No description provided for @country.
  ///
  /// In es, this message translates to:
  /// **'País'**
  String get country;

  /// No description provided for @price.
  ///
  /// In es, this message translates to:
  /// **'Precio'**
  String get price;

  /// No description provided for @city_1.
  ///
  /// In es, this message translates to:
  /// **'Madrid'**
  String get city_1;

  /// No description provided for @city_1_country.
  ///
  /// In es, this message translates to:
  /// **'España'**
  String get city_1_country;

  /// No description provided for @city_2.
  ///
  /// In es, this message translates to:
  /// **'Londres'**
  String get city_2;

  /// No description provided for @city_2_country.
  ///
  /// In es, this message translates to:
  /// **'Reino Unido'**
  String get city_2_country;

  /// No description provided for @city_3.
  ///
  /// In es, this message translates to:
  /// **'Tokio'**
  String get city_3;

  /// No description provided for @city_3_country.
  ///
  /// In es, this message translates to:
  /// **'Japón'**
  String get city_3_country;

  /// No description provided for @city_4.
  ///
  /// In es, this message translates to:
  /// **'París'**
  String get city_4;

  /// No description provided for @city_4_country.
  ///
  /// In es, this message translates to:
  /// **'Francia'**
  String get city_4_country;

  /// No description provided for @city_5.
  ///
  /// In es, this message translates to:
  /// **'Ciudad de México'**
  String get city_5;

  /// No description provided for @city_5_country.
  ///
  /// In es, this message translates to:
  /// **'México'**
  String get city_5_country;

  /// No description provided for @city_6.
  ///
  /// In es, this message translates to:
  /// **'Sídney'**
  String get city_6;

  /// No description provided for @city_6_country.
  ///
  /// In es, this message translates to:
  /// **'Australia'**
  String get city_6_country;

  /// No description provided for @city_7.
  ///
  /// In es, this message translates to:
  /// **'Berlín'**
  String get city_7;

  /// No description provided for @city_7_country.
  ///
  /// In es, this message translates to:
  /// **'Alemania'**
  String get city_7_country;

  /// No description provided for @city_8.
  ///
  /// In es, this message translates to:
  /// **'Dubái'**
  String get city_8;

  /// No description provided for @city_8_country.
  ///
  /// In es, this message translates to:
  /// **'Emiratos Árabes Unidos'**
  String get city_8_country;

  /// No description provided for @city_9.
  ///
  /// In es, this message translates to:
  /// **'Buenos Aires'**
  String get city_9;

  /// No description provided for @city_9_country.
  ///
  /// In es, this message translates to:
  /// **'Argentina'**
  String get city_9_country;

  /// No description provided for @city_10.
  ///
  /// In es, this message translates to:
  /// **'El Cairo'**
  String get city_10;

  /// No description provided for @city_10_country.
  ///
  /// In es, this message translates to:
  /// **'Egipto'**
  String get city_10_country;

  /// No description provided for @product_1.
  ///
  /// In es, this message translates to:
  /// **'Fresa'**
  String get product_1;

  /// No description provided for @product_1_desc.
  ///
  /// In es, this message translates to:
  /// **'Una fruta pequeña y dulce de color rojo, rica en vitamina C y antioxidantes.'**
  String get product_1_desc;

  /// No description provided for @product_2.
  ///
  /// In es, this message translates to:
  /// **'Mango'**
  String get product_2;

  /// No description provided for @product_2_desc.
  ///
  /// In es, this message translates to:
  /// **'Una fruta tropical con un sabor dulce y jugoso, rica en vitamina A.'**
  String get product_2_desc;

  /// No description provided for @product_3.
  ///
  /// In es, this message translates to:
  /// **'Manzana'**
  String get product_3;

  /// No description provided for @product_3_desc.
  ///
  /// In es, this message translates to:
  /// **'Una fruta crujiente y jugosa disponible en muchas variedades, ideal para meriendas y postres.'**
  String get product_3_desc;

  /// No description provided for @product_4.
  ///
  /// In es, this message translates to:
  /// **'Melón'**
  String get product_4;

  /// No description provided for @product_4_desc.
  ///
  /// In es, this message translates to:
  /// **'Una fruta refrescante y dulce con un alto contenido de agua, perfecta para la hidratación.'**
  String get product_4_desc;

  /// No description provided for @product_5.
  ///
  /// In es, this message translates to:
  /// **'Naranja'**
  String get product_5;

  /// No description provided for @product_5_desc.
  ///
  /// In es, this message translates to:
  /// **'Un cítrico conocido por su alto contenido en vitamina C y su sabor refrescante.'**
  String get product_5_desc;

  /// No description provided for @product_6.
  ///
  /// In es, this message translates to:
  /// **'Pera'**
  String get product_6;

  /// No description provided for @product_6_desc.
  ///
  /// In es, this message translates to:
  /// **'Una fruta dulce y jugosa con una textura suave y granulada.'**
  String get product_6_desc;

  /// No description provided for @product_7.
  ///
  /// In es, this message translates to:
  /// **'Piña'**
  String get product_7;

  /// No description provided for @product_7_desc.
  ///
  /// In es, this message translates to:
  /// **'Una fruta tropical con un sabor agridulce y una piel dura y espinosa.'**
  String get product_7_desc;

  /// No description provided for @product_8.
  ///
  /// In es, this message translates to:
  /// **'Plátano'**
  String get product_8;

  /// No description provided for @product_8_desc.
  ///
  /// In es, this message translates to:
  /// **'Una fruta suave y cremosa rica en potasio, perfecta para obtener energía rápida.'**
  String get product_8_desc;

  /// No description provided for @product_9.
  ///
  /// In es, this message translates to:
  /// **'Uva'**
  String get product_9;

  /// No description provided for @product_9_desc.
  ///
  /// In es, this message translates to:
  /// **'Una fruta pequeña y jugosa utilizada a menudo para hacer vino y jugos.'**
  String get product_9_desc;

  /// No description provided for @product_10.
  ///
  /// In es, this message translates to:
  /// **'Limón'**
  String get product_10;

  /// No description provided for @product_10_desc.
  ///
  /// In es, this message translates to:
  /// **'Un cítrico ácido comúnmente usado para condimentar y en bebidas.'**
  String get product_10_desc;
}

class _AppLocalizationsDelegate extends LocalizationsDelegate<AppLocalizations> {
  const _AppLocalizationsDelegate();

  @override
  Future<AppLocalizations> load(Locale locale) {
    return SynchronousFuture<AppLocalizations>(lookupAppLocalizations(locale));
  }

  @override
  bool isSupported(Locale locale) => <String>['en', 'es', 'fr', 'it'].contains(locale.languageCode);

  @override
  bool shouldReload(_AppLocalizationsDelegate old) => false;
}

AppLocalizations lookupAppLocalizations(Locale locale) {


  // Lookup logic when only language code is specified.
  switch (locale.languageCode) {
    case 'en': return AppLocalizationsEn();
    case 'es': return AppLocalizationsEs();
    case 'fr': return AppLocalizationsFr();
    case 'it': return AppLocalizationsIt();
  }

  throw FlutterError(
    'AppLocalizations.delegate failed to load unsupported locale "$locale". This is likely '
    'an issue with the localizations generation tool. Please file an issue '
    'on GitHub with a reproducible sample app and the gen-l10n configuration '
    'that was used.'
  );
}
