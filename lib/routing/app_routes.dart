import 'package:flutter/material.dart';
import 'package:flutter_application_5/pages/ciudad.dart';
import 'package:flutter_application_5/pages/main.dart';
import 'package:flutter_application_5/pages/splash.dart';

import '../pages/login.dart';
import 'routes.dart';

Map<String, Widget Function(BuildContext)> get appRoutes {
  return{
    Routes.splash: (context) => const SplashPage(),
    Routes.login: (context) => const VistaA(title: "Primera pantalla"),
    Routes.home: (context) {
      final username = ModalRoute.of(context)!.settings.arguments as String;
      return VistaB(
        title: "Segunda pantalla",
        userName : username,
      );
    },
    Routes.ciudad: (context) {
      final city = ModalRoute.of(context)!.settings.arguments as Map<String, String>?;
      if (city == null) {
        return const Scaffold(
          body: Center(child: Text("Error: No se encontraron datos de la ciudad.")),
        );
      }
      return VistaDetalle(city: city);
    },
  };
}