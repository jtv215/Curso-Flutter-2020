import 'package:flutter/material.dart';
import 'package:flutter_vscdo/src/pages/contador_page.dart';

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Center(
        child:ContadorPage(),
      ),
    );
  }
}
