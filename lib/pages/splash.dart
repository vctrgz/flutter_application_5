import 'package:flutter/material.dart';

import '../routing/routes.dart';

class SplashPage extends StatefulWidget{
  const SplashPage({super.key});

  @override
  State<SplashPage> createState()=> _SplashPageState();
}

class _SplashPageState extends State<SplashPage>{
  @override
  void initState(){
    super.initState();
    Future.delayed(
      const Duration(seconds: 5)
    ).then((value) => {
      Navigator.pushReplacementNamed(context, Routes.login),
    });
  }
  
  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Column(
        children: <Widget> [
          SizedBox(height: 50.0),
          SizedBox(
            height: 200.0,
            child: Stack(
              children: <Widget>[
                Center(
                  child: SizedBox(
                    width: 200,
                    height: 200,
                    child: CircularProgressIndicator(),
                ),),
                Center(child: Text("Cargando...")),
              ],
            ),
          )
        ]
      )
    );
  }
}