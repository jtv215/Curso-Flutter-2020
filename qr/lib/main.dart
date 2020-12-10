import 'package:flutter/material.dart';
import 'package:qr/pages/home_page.dart';
import 'package:qr/pages/mapa_page.dart';
 
void main() => runApp(MyApp());
 
class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Material App',
      initialRoute: 'home',
      routes: {
        'home':(BuildContext context)=>HomePage(),
        'mapa':(BuildContext context)=>MapaPage(),
      },   
      theme: ThemeData(   //cambia el estilo de toda la applicacion que venga por defecto
        primaryColor: Colors.deepPurple
      ),
     );
  }
}