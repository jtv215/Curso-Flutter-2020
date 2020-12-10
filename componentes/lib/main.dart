import 'package:componentes/src/routes/routes.dart';
import 'package:flutter/material.dart';

import 'package:componentes/src/pages/alert_page.dart';
import 'package:flutter_localizations/flutter_localizations.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Material App',
      debugShowCheckedModeBanner: false,
      localizationsDelegates: [  //Calendario en español 1/2
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
      ],
      supportedLocales: [ //Calendario en español 2/2
        const Locale('en', ''), 
        const Locale('es', 'ES'),      
      ],
      // home: HomePage()
      initialRoute: '/', //aqui indica que cargue la pagia homePage en ruta,
      routes: getAplicationRoutes(),
      onGenerateRoute: (RouteSettings settings) {
        //cuando una ruta no esta implementada
        // print('ruta llamada ${settings.name}');

        return MaterialPageRoute(
            builder: (BuildContext context) => AlertPage());
      },
    );
  }
}
