import 'package:flutter/material.dart';
import '../../l10n/app_localizations.dart';
import 'package:flutter_application_5/routing/routes.dart';

class VistaCompras extends StatefulWidget {
  const VistaCompras({super.key});
  
  @override
  _VistaComprasState createState() => _VistaComprasState();
}

class _VistaComprasState extends State<VistaCompras> {

  //Lista de productos
  late List<Map<String, String>> productos;

  static Map<String, String> createCompraMap(String name, String price, String dischargeDate,String description, String image) {
    return {
      "name": name,
      "price": price,
      "dischargeDate": dischargeDate,
      "description": description,
      "image": image
    };
  }

  void removeProduct(String productName) {
    setState(() {
      productos.removeWhere((producto) => producto["name"] == productName);
    });
    Navigator.pop(context);
  }

  @override
  Widget build(BuildContext context) {
    final localizations = AppLocalizations.of(context);
    productos = [
      createCompraMap(localizations.product_1, "10", "fecha", localizations.product_1_desc, "lib/assets/productos/fresa.png"),
      createCompraMap(localizations.product_2, "10", "fecha", localizations.product_2_desc, "lib/assets/productos/mango.jpg"),
      createCompraMap(localizations.product_3, "10", "fecha", localizations.product_3_desc, "lib/assets/productos/manzana.jpg"),
      createCompraMap(localizations.product_4, "10", "fecha", localizations.product_4_desc, "lib/assets/productos/melon.jpg"),
      createCompraMap(localizations.product_5, "10", "fecha", localizations.product_5_desc, "lib/assets/productos/naranja.jpg"),
      createCompraMap(localizations.product_6, "10", "fecha", localizations.product_6_desc, "lib/assets/productos/pera.jpg"),
      createCompraMap(localizations.product_7, "10", "fecha", localizations.product_7_desc, "lib/assets/productos/piña.jpg"),
      createCompraMap(localizations.product_8, "10", "fecha", localizations.product_8_desc, "lib/assets/productos/platano.jpg"),
      createCompraMap(localizations.product_9, "10", "fecha", localizations.product_9_desc, "lib/assets/productos/uva.jpg"),
      createCompraMap(localizations.product_10, "10", "fecha", localizations.product_10_desc, "lib/assets/productos/limon.jpg"),
      ];
    return Scaffold(
        appBar: AppBar(
          title: Text(localizations.shopping),
        ),
        body: ListView.builder(
          itemCount: productos.length,
          itemBuilder: (context, index) {
            final producto = productos[index];
            return Card(
              margin: EdgeInsets.all(8),
              child: ListTile(
                leading: Hero(
                  tag: producto["name"]!,
                  child: Image.network(
                    producto["image"]!,
                    width: 100,
                    height: 100,
                    fit: BoxFit.cover,                    
                  ),
                ),
                title: Text(
                  producto["name"]!,
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
                ),
                subtitle: Text(
                  '${producto["price"]!}€\n${localizations.date}: ${producto["dischargeDate"]!}',
                ),
                isThreeLine: true,
                onTap: () {
                  Navigator.pushNamed(
                    context,
                    Routes.compra,
                    arguments: {
                      "producto": producto,
                      "onDelete": removeProduct,
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