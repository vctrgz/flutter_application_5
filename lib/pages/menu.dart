import 'package:flutter/material.dart';
import '../../l10n/app_localizations.dart';
import 'package:flutter_application_5/routing/routes.dart';


class VistaMenu extends StatefulWidget {
  final String userName;
  final String title;
  final Function(Locale) changeLanguage;
  const VistaMenu({super.key, required this.title, required this.userName, required this.changeLanguage});
  
  @override
  _VistaMenuState createState() => _VistaMenuState();
  
}

class _VistaMenuState extends State<VistaMenu> {
  @override
  Widget build(BuildContext context) {
    final localizations = AppLocalizations.of(context);
    return Scaffold(
      appBar: AppBar(
        title: Text('${localizations.helloUser} ${widget.userName}'),
        actions: [
          DropdownButton<Locale>(
            icon:
                const Icon(Icons.language, color: Color.fromARGB(255, 0, 0, 0)),
            underline: SizedBox(),
            onChanged: (Locale? locale) {
              if (locale != null) {
                widget.changeLanguage(locale);
              }
            },
            items: const [
              DropdownMenuItem(value: Locale('es'), child: Text('Español')),
              DropdownMenuItem(value: Locale('en'), child: Text('English')),
              DropdownMenuItem(value: Locale('fr'), child: Text('Français')),
              DropdownMenuItem(value: Locale('it'), child: Text('Italiano')),
            ],
          ),
        ],
      ),
      body: Center(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center, // Centra verticalmente
          children: [
            _buildButton(localizations.cities, () => Navigator.pushNamed(context, Routes.ciudades, arguments: {})),
            const SizedBox(width: 20), // Espacio entre botones
            _buildButton(localizations.shopping, () => Navigator.pushNamed(context, Routes.compras, arguments: {})),
          ],
        ),
      ),
    );
  }
}

Widget _buildButton(String text, VoidCallback onPressed, {String? imageUrl}) {
  return SizedBox(
    width: 250,  // Aumenta el ancho
    height: 120, // Aumenta la altura
    child: ElevatedButton(
      style: ElevatedButton.styleFrom(
        foregroundColor: Colors.white,
        backgroundColor: imageUrl != null ? Colors.transparent : Colors.blue, // Azul si no hay imagen
        padding: EdgeInsets.zero, // Elimina padding interno
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(15),
        ),
      ),
      onPressed: onPressed,
      child: Stack(
        fit: StackFit.expand,
        children: [
          if (imageUrl != null)
            ClipRRect(
              borderRadius: BorderRadius.circular(15),
              child: Image.network(
                imageUrl,
                fit: BoxFit.cover,
              ),
            ),
          Center(
            child: Text(
              text,
              style: TextStyle(fontSize: 26, fontWeight: FontWeight.bold, color: imageUrl != null ? Colors.white : Colors.black),
            ),
          ),
        ],
      ),
    ),
  );
}