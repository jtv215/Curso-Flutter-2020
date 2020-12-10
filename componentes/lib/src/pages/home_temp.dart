import 'package:flutter/material.dart';

class HomepageTemp extends StatelessWidget {
  // const HomePage({Key key}) : super(key: key);

  final opciones = ['uno', 'dos', 'tres', 'cuatro', 'cinco'];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('componentes Temp'),
      ),
      body: ListView(
          //children: _crearItems()),
          children: _crearItemsCorta()),
    );
  }

  // List<Widget> _crearItems() {
  //   List<Widget> lista = new List<Widget>();

  //   for (String opt in opciones) {
  //     final tempWidget = ListTile(
  //       title: Text(opt),
  //     );

  //     lista
  //       ..add(tempWidget)
  //       ..add(Divider(
  //         color: Colors.red,
  //       ));
  //   }
  //   return lista;
  // }

  List<Widget> _crearItemsCorta() {
    var widgets = opciones.map((item) {
      return Column(
        children: <Widget>[
          ListTile(
            title: Text(item + '!'),
            subtitle: Text('cualquier cosa'),
            leading: Icon(Icons.accessibility_new),
            trailing: Icon(Icons.keyboard_arrow_right),
            onTap: (){ Text('hola');},
          ),
          Divider(),
        ],
      );
    }).toList();

    return widgets;
  }
}
