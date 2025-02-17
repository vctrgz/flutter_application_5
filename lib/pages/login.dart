// Vista Login
import 'package:flutter/material.dart';

import '../routing/routes.dart';

class VistaA extends StatefulWidget {
  const VistaA({super.key, required String title});

  @override
  _VistaAState createState() => _VistaAState();
}

class _VistaAState extends State<VistaA> {
   // Controladores para los campos de texto
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  @override
  void dispose() {
    // Liberar recursos de los controladores
    emailController.dispose();
    passwordController.dispose();
    super.dispose();
  }
  // Función para validar credenciales
  void _validateEmailAndPassword(BuildContext context) {
    final email = emailController.text;
    //final password = passwordController.text;
    if (_formKey.currentState!.validate()) {
      Navigator.pushReplacementNamed(context, Routes.home, arguments: email);
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
    return Scaffold(
      appBar: AppBar(
        title: const Text('Login Page'),
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
                controller: emailController,
                validator: (value){
                  if (value == null || value.isEmpty) {
                      return 'Por favor ingresa tu correo';
                    } else if (value != "Usuario") {
                      return 'El correo no existe';
                    }
                    return null;
                },
                keyboardType: TextInputType.emailAddress,
                decoration: const InputDecoration(
                  labelText: 'Email',
                  hintText: 'Email',
                  border: OutlineInputBorder(),
                  prefixIcon: Icon(Icons.email),
                ),
              ),
            //PASSWORD
            const SizedBox(height: 40,),
            TextFormField(
                controller: passwordController,
                validator: (value){
                  if (value == null || value.isEmpty) {
                      return 'Por favor ingresa tu contraseña';
                    } else if (value != "12345") {
                      return 'Contraseña incorrecta';
                    }
                    return null;
                },
                keyboardType: TextInputType.emailAddress,
                decoration: const InputDecoration(
                  labelText: 'Password',
                  hintText: 'Password',
                  border: OutlineInputBorder(),
                  prefixIcon: Icon(Icons.lock),
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
              child: const Text('Forgot Password'),
            ),
            //BOTON LOGIN
            const SizedBox(height: 20,),
            ElevatedButton(
              onPressed: () => _validateEmailAndPassword(context),
              child: const Text('Login'),
            ),
          ])
          )
          

        )
      ),
    );
  }
}