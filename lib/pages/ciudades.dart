// Vista Home
import 'package:flutter/material.dart';
import 'package:flutter_application_5/routing/routes.dart';
import '../../l10n/app_localizations.dart';

class VistaCiudades extends StatefulWidget {
  const VistaCiudades({super.key});
  
  @override
  _VistaCiudadesState createState() => _VistaCiudadesState();
}

class _VistaCiudadesState extends State<VistaCiudades> {
  // Lista de ciudades con sus detalles
  late List<Map<String, String>> cities;

  //Lista de productos

  static Map<String, String> createCiudadMap(String name, String country, String population, String image) {
    return {
      "name": name,
      "country": country,
      "population": population,
      "image": image
    };
  }

  void removeCity(String cityName) {
    setState(() {
      cities.removeWhere((city) => city["name"] == cityName);
    });
    Navigator.pop(context);
  }

  @override
  Widget build(BuildContext context) {
    final localizations = AppLocalizations.of(context);
    cities = [
      createCiudadMap(localizations.city_1, localizations.city_1_country, "3,280,000", "lib/assets/ciudades/madrid.jpg"),
      createCiudadMap(localizations.city_2, localizations.city_2_country, "9,002,000", "lib/assets/ciudades/londres.jpeg"),
      createCiudadMap(localizations.city_3, localizations.city_3_country, "14,043,000", "lib/assets/ciudades/tokio.jpg"),
      createCiudadMap(localizations.city_4, localizations.city_4_country, "2,165,000", "lib/assets/ciudades/paris.jpg"),
      createCiudadMap(localizations.city_5, localizations.city_5_country, "9,209,000", "lib/assets/ciudades/ciudad_de_mexico.jpg"),
      createCiudadMap(localizations.city_6, localizations.city_6_country, "5,312,000", "lib/assets/ciudades/sidney.jpg"),
      createCiudadMap(localizations.city_7, localizations.city_7_country, "3,769,000", "lib/assets/ciudades/Berlin.jpg"),
      createCiudadMap(localizations.city_8, localizations.city_8_country, "3,331,000", "lib/assets/ciudades/dubai.jpg"),
      createCiudadMap(localizations.city_9, localizations.city_9_country, "2,891,000", "lib/assets/ciudades/buenos_aires.jpg"),
      createCiudadMap(localizations.city_10, localizations.city_10_country, "10,025,000", "lib/assets/ciudades/el_cairo.jpg"),
    ];
    return Scaffold(
        appBar: AppBar(
          title: Text(localizations.cities),
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
                  '${city["country"]!}\n${localizations.population}: ${city["population"]!}',
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