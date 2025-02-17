// ignore_for_file: library_private_types_in_public_api, unused_element, prefer_const_constructors

import 'package:flutter/material.dart';
//import 'package:flutter_application_5/pages/ciudad.dart';
import 'package:flutter_application_5/routing/app_routes.dart';

import '../routing/routes.dart';
//import 'login.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

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
      routes: appRoutes,
      initialRoute: Routes.splash,
    );
  }
}

// Vista Home
class VistaB extends StatefulWidget {
  final String userName;
  final String title;
  const VistaB({super.key, required this.title, required this.userName});
  
  @override
  _VistaBState createState() => _VistaBState();
}

class _VistaBState extends State<VistaB> {
  // Lista de ciudades con sus detalles
  final List<Map<String, String>> cities = [
    {
      "name": "Nueva York",
      "country": "Estados Unidos",
      "population": "8,468,000",
      "image": "lib/assets/nueva-york.jpg"
    },
    {
      "name": "Londres",
      "country": "Reino Unido",
      "population": "9,002,000",
      "image": 'lib/assets/londres.jpeg'
    },
    {
      "name": "Tokio",
      "country": "Japón",
      "population": "14,043,000",
      "image": "lib/assets/tokio.jpg"
    },
    {
      "name": "París",
      "country": "Francia",
      "population": "2,165,000",
      "image": "lib/assets/paris.jpg"
    },
    {
      "name": "Ciudad de México",
      "country": "México",
      "population": "9,209,000",
      "image": "lib/assets/ciudad_de_mexico.jpg"
    },
    {
      "name": "Sídney",
      "country": "Australia",
      "population": "5,312,000",
      "image": "lib/assets/sidney.jpg"
    },
    {
      "name": "Berlín",
      "country": "Alemania",
      "population": "3,769,000",
      "image": "lib/assets/Berlin.jpg"
    },
    {
      "name": "Dubai",
      "country": "Emiratos Árabes Unidos",
      "population": "3,331,000",
      "image": "lib/assets/dubai.jpg"
    },
    {
      "name": "Buenos Aires",
      "country": "Argentina",
      "population": "2,891,000",
      "image": "lib/assets/buenos_aires.jpg"
    },
    {
      "name": "El Cairo",
      "country": "Egipto",
      "population": "10,025,000",
      "image": "lib/assets/el_cairo.jpg"
    },
  ];

  void removeCity(String cityName) {
    setState(() {
      cities.removeWhere((city) => city["name"] == cityName);
    });
    Navigator.pop(context);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('Hola ${widget.userName}'),
        ),
        body: ListView.builder(
          itemCount: cities.length,
          itemBuilder: (context, index) {
            final city = cities[index];
            return Card(
              margin: EdgeInsets.all(8),
              child: ListTile(
                leading: Hero(
                  tag: city["name"]!,
                  child: Image.network(
                    city["image"]!,
                    width: 100,
                    height: 100,
                    fit: BoxFit.cover,                    
                  ),
                ),
                title: Text(
                  city["name"]!,
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
                ),
                subtitle: Text(
                  '${city["country"]!}\nPoblación: ${city["population"]!}',
                ),
                isThreeLine: true,
                onTap: () {
                  Navigator.pushNamed(
                    context,
                    Routes.ciudad,
                    arguments: {
                      "city": city,
                      "onDelete": removeCity,
                    }
                  );
                },
              ),
            );
          },
        ),
    );
  }
}

