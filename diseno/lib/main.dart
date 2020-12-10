import 'package:diseno/src/pages/basico_page.dart';
import 'package:diseno/src/pages/botones_pages.dart';
import 'package:diseno/src/pages/scroll_page.dart';
import 'package:flutter/material.dart';
 
void main() => runApp(MyApp());
 
class MyApp extends StatelessWidget {


  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Material App',
      initialRoute: 'botones',
      routes: {
        '/':(BuildContext context)=>BasicoPage(),
        'scroll':(BuildContext context)=>ScrollPage(),
        'botones':(BuildContext context)=>BotonesPage(),
      },   
     );
  }
}