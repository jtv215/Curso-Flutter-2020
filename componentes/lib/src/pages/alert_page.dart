import 'package:flutter/material.dart';

class AlertPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Alert Page'),
      ),
      body: Center(
        child: RaisedButton(
          child: Text('Mostrar Alerta'),
          color: Colors.blue,
          textColor: Colors.white,
          shape: StadiumBorder(), //que el boton sea bordeado
          onPressed: () => _mostrarAlert(context),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.add_location),
        onPressed: () {
          Navigator.pop(context);
        },
      ),
    );
  }
}

void _mostrarAlert(context) {
  showDialog(
      context: context,
      barrierDismissible: true, //cerrar alerta fuera del dialog
      builder: (context) {
        return AlertDialog(
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20.0)), //darle borde a una alerta
          title: Text('Titulo'),
          content: Column(
            mainAxisSize:
                MainAxisSize.min, //se adapte al contenido de la alerta
            children: <Widget>[
              Text('Este es el contenido de la caja de la alerta'),
              FlutterLogo(size: 100.0)
            ],
          ),
          actions: <Widget>[
            FlatButton(
                child: Text('Cancelar'),
                onPressed: () => Navigator.of(context).pop(),
                ),
            FlatButton(
              child: Text('ok'),
              onPressed: () => Navigator.of(context).pop(),
            ),
          ],
        );
      });
}
