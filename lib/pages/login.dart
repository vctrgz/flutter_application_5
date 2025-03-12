// Vista Login
import 'package:flutter/material.dart';
import 'package:flutter_application_5/l10n/app_localizations.dart';

import '../routing/routes.dart';

class VistaLogin extends StatefulWidget {
  const VistaLogin({super.key, required String title, required this.changeLanguage});
  final Function(Locale) changeLanguage;
  @override
  _VistaLoginState createState() => _VistaLoginState();
}

class _VistaLoginState extends State<VistaLogin> {
   // Controladores para los campos de texto
  final TextEditingController userNameController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  @override
  void dispose() {
    // Liberar recursos de los controladores
    userNameController.dispose();
    passwordController.dispose();
    super.dispose();
  }
  // Función para validar credenciales
  void _validateUserNameAndPassword(BuildContext context) {
    final userName = userNameController.text;
    //final password = passwordController.text;
    if (_formKey.currentState!.validate()) {
      Navigator.pushReplacementNamed(context, Routes.menu, arguments: userName);
    }else{
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text('Credenciales incorrectas'),
          duration: Duration(seconds: 2),
        ),
        );
    }
  }
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    final localizations = AppLocalizations.of(context);
    return Scaffold(
      appBar: AppBar(
        title: Text(localizations.loginPage),
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
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 250.0),
          child: Form(
            key: _formKey,
            child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
            //TITULO
            const Text(
              'Flutter',
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            //EMAIL
            const SizedBox(height: 40,),
            TextFormField(
                controller: userNameController,
                validator: (value){
                  if (value == null || value.isEmpty) {
                      return localizations.emailHint;
                    } else if (value != "Usuario") {
                      return localizations.invalidEmail;
                    }
                    return null;
                },
                keyboardType: TextInputType.emailAddress,
                decoration: InputDecoration(
                  labelText: localizations.emailLabel,
                  hintText: localizations.emailLabel,
                  border: const OutlineInputBorder(),
                  prefixIcon: const Icon(Icons.email),
                ),
              ),
            //PASSWORD
            const SizedBox(height: 40,),
            TextFormField(
                controller: passwordController,
                validator: (value){
                  if (value == null || value.isEmpty) {
                      return localizations.passwordHint;
                    } else if (value != "12345") {
                      return localizations.invalidPassword;
                    }
                    return null;
                },
                keyboardType: TextInputType.emailAddress,
                decoration: InputDecoration(
                  labelText: localizations.passwordLabel,
                  hintText: localizations.passwordLabel,
                  border: const OutlineInputBorder(),
                  prefixIcon: const Icon(Icons.lock),
                ),
              ),
            //BOTON FORGOTTED PASSWORD
            const SizedBox(height: 20,),
            ElevatedButton(
              onPressed: () {
                // Navigator.push(
                //   context,
                //   MaterialPageRoute(builder: (context) => const VistaB()),
                // );
              },
              child: Text(localizations.forgotPassword),
            ),
            //BOTON LOGIN
            const SizedBox(height: 20,),
            ElevatedButton(
              onPressed: () => _validateUserNameAndPassword(context),
              child: Text(localizations.loginButton),
            ),
          ])
          )
          

        )
      ),
    );
  }
}