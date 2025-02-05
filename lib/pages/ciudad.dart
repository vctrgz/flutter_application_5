import 'package:flutter/material.dart';

class VistaDetalle extends StatefulWidget {
  final Map<String, String> city;

  const VistaDetalle({super.key, required this.city});
  
  @override
  _VistaDetalleState createState() => _VistaDetalleState();
}

class _VistaDetalleState extends State<VistaDetalle> {

  @override
  Widget build(BuildContext context) {
    final city = widget.city;

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
              "País: ${city["country"]!}",
              style: const TextStyle(fontSize: 18),
            ),
            const SizedBox(height: 10),
            Text(
              "Población: ${city["population"]!}",
              style: const TextStyle(fontSize: 18),
            ),
          ],
        ),
      ),
    );
  }
}