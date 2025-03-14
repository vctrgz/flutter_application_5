import 'package:flutter/material.dart';
import 'package:flutter_application_5/l10n/app_localizations.dart';

class VistaCiudad extends StatefulWidget {
  final Map<String, String> city;
  final Function(String) onDelete;
  const VistaCiudad({super.key, required this.city, required this.onDelete});
  
  @override
  _VistaCiudadState createState() => _VistaCiudadState();
}

class _VistaCiudadState extends State<VistaCiudad> {

  @override
  Widget build(BuildContext context) {
    final city = widget.city;
    final localizations = AppLocalizations.of(context);
    return Scaffold(
      appBar: AppBar(title: Text(city["name"]!)),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Hero(
              tag: city["name"]!,
              child: Image.network(
                city["image"]!,
                width: 300,
                height: 200,
                fit: BoxFit.cover,
              ),
            ),
            const SizedBox(height: 20),
            Text(
              city["name"]!,
              style: const TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 10),
            Text(
              "${localizations.country}: ${city["country"]!}",
              style: const TextStyle(fontSize: 18),
            ),
            const SizedBox(height: 10),
            Text(
              "${localizations.population}: ${city["population"]!}",
              style: const TextStyle(fontSize: 18),
            ),
            const SizedBox(height: 20,),
            ElevatedButton(
              onPressed: () {
                widget.onDelete(city["name"]!);
              },
              child: const Text('Delete'),
            ),
          ],
        ),
      ),
    );
  }
}