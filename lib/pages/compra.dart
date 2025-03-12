import 'package:flutter/material.dart';
import 'package:flutter_application_5/l10n/app_localizations.dart';

class VistaCompra extends StatefulWidget {
  final Map<String, String> producto;
  final Function(String) onDelete;
  const VistaCompra({super.key, required this.producto, required this.onDelete});
  
  @override
  _VistaCompraState createState() => _VistaCompraState();
}

class _VistaCompraState extends State<VistaCompra> {

  @override
  Widget build(BuildContext context) {
    final producto = widget.producto;
    final localizations = AppLocalizations.of(context);
    return Scaffold(
      appBar: AppBar(title: Text(producto["name"]!)),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Hero(
              tag: producto["name"]!,
              child: Image.network(
                producto["image"]!,
                width: 300,
                height: 200,
                fit: BoxFit.cover,
              ),
            ),
            const SizedBox(height: 20),
            Text(
              producto["name"]!,
              style: const TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 10),
            Text(
              "${localizations.price}: ${producto["price"]!}",
              style: const TextStyle(fontSize: 18),
            ),
            const SizedBox(height: 10),
            Text(
              "${localizations.date}: ${producto["dischargeDate"]!}",
              style: const TextStyle(fontSize: 18),
            ),
            Text(
              "${localizations.description}: ${producto["description"]!}",
              style: const TextStyle(fontSize: 18),
            ),
            const SizedBox(height: 20,),
            ElevatedButton(
              onPressed: () {
                widget.onDelete(producto["name"]!);
              },
              child: const Text('Delete'),
            ),
          ],
        ),
      ),
    );
  }
}