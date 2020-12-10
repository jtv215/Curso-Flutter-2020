import 'dart:convert';

import 'package:flutter/services.dart' show rootBundle;


class _MenuProvider {
  List<dynamic> opciones = [];

  _MenuProvider() {
    cargarData();
  }

  Future<List<dynamic>> cargarData() async{
  final resp= await  rootBundle.loadString('data/menu_opts.json');

      Map dataMap= json.decode(resp);
      opciones= dataMap['rutas'];
      print('leyendo fichero');
      print(opciones);

      return opciones;

  }

}

final menuProvider = new _MenuProvider();