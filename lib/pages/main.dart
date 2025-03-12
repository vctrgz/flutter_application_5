// ignore_for_file: library_private_types_in_public_api, unused_element, prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:flutter_application_5/routing/app_routes.dart';
import '../../l10n/app_localizations.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../routing/routes.dart';
//import 'login.dart';

void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  SharedPreferences prefs = await SharedPreferences.getInstance();

  runApp(MyApp());
}
class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState()=> _MyAppState();
}
class _MyAppState extends State<MyApp> { 
  Locale _locale = const Locale('es');
  void changeLanguage(Locale locale) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.setString('languageCode', locale.languageCode);

    setState(() {
      _locale = locale;
    });
  }
  @override
  // ignore: override_on_non_overriding_member
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Navigation Activity',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      //home: const VistaA(title: '',), // Pantalla inicial
      routes: appRoutes(changeLanguage),
      initialRoute: Routes.splash,
      localizationsDelegates: const[
        AppLocalizations.delegate,
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
      ],
      supportedLocales: const[
        Locale('es'),
        Locale('fr'),
        Locale('en'),
        Locale('it'),
      ],
      locale: _locale,
      localeResolutionCallback: (locale, supportedLocales) {
        for (var supportedLocale in supportedLocales) {
          if (supportedLocale.languageCode == locale?.languageCode) {
            return supportedLocale;
          }
        }
            return supportedLocales.first;
      }
    );
  }
}