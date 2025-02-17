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
      final arguments = ModalRoute.of(context)!.settings.arguments as Map<String, dynamic>?;
      if (arguments == null || !arguments.containsKey("city") || !arguments.containsKey("onDelete")) {
        return const Scaffold(
          body: Center(child: Text("Error: No se encontraron datos de la ciudad.")),
        );
      }

      final city = arguments["city"] as Map<String, String>;
      final Function(String) onDelete = arguments["onDelete"] as Function(String);

      return VistaDetalle(city: city, onDelete: onDelete);
    },
  };
}