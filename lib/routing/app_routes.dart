import 'package:flutter/material.dart';
import 'package:flutter_application_5/pages/ciudad.dart';
import 'package:flutter_application_5/pages/ciudades.dart';
import 'package:flutter_application_5/pages/compra.dart';
import 'package:flutter_application_5/pages/compras.dart';
import 'package:flutter_application_5/pages/menu.dart';
import 'package:flutter_application_5/pages/splash.dart';

import '../pages/login.dart';
import 'routes.dart';

Map<String, Widget Function(BuildContext)> appRoutes (Function(Locale) changeLanguage) {
  
  return{
    Routes.splash: (context) => const SplashPage(),

    Routes.login: (context) => VistaLogin(title: "Login", changeLanguage: changeLanguage,),

    Routes.menu: (context) {
      final username = ModalRoute.of(context)!.settings.arguments as String;
      return VistaMenu(
        title: "Menu",
        userName : username, 
        changeLanguage: changeLanguage,
      );
    },

    Routes.ciudades: (context) => const VistaCiudades(),

    Routes.ciudad: (context) {
      final arguments = ModalRoute.of(context)!.settings.arguments as Map<String, dynamic>?;
      if (arguments == null || !arguments.containsKey("city") || !arguments.containsKey("onDelete")) {
        return const Scaffold(
          body: Center(child: Text("Error: No se encontraron datos de la ciudad.")),
        );
      }

      final city = arguments["city"] as Map<String, String>;
      final Function(String) onDelete = arguments["onDelete"] as Function(String);

      return VistaCiudad(city: city, onDelete: onDelete);
    },

    Routes.compras: (context) => const VistaCompras(),

    Routes.compra: (context) {
      final arguments = ModalRoute.of(context)!.settings.arguments as Map<String, dynamic>?;
      if (arguments == null || !arguments.containsKey("producto") || !arguments.containsKey("onDelete")) {
        return const Scaffold(
          body: Center(child: Text("Error: No se encontraron datos del producto.")),
        );
      }

      final producto = arguments["producto"] as Map<String, String>;
      final Function(String) onDelete = arguments["onDelete"] as Function(String);

      return VistaCompra(producto: producto, onDelete: onDelete);
    },
  };
} 