
import 'package:flutter/material.dart';
import 'package:qr/models/scan_model.dart';

class MapaPage extends StatelessWidget {


  @override
  Widget build(BuildContext context) {

  final ScanModel scan= ModalRoute.of(context).settings.arguments;// obtener los datos que se pasan de la pantalla anterior medainte navigador pushname

    return Scaffold(
      appBar: AppBar(
        title: Text('coordenadas qr'),
        actions: <Widget>[
          IconButton(
            icon: Icon(Icons.my_location),
            onPressed: () {},
          ),
        ],
      ),
      body: Center(
        child: Text(scan.valor),
        
      ),
    );
  }
}
