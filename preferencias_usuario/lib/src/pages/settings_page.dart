import 'package:flutter/material.dart';
import 'package:preferencias_usuario/src/share_prefs/preferencias_usuario.dart';
import 'package:preferencias_usuario/src/widgets/menu_widgets.dart';

class SettintgsPage extends StatefulWidget {
  static final String routeName = 'settings';

  @override
  _SettintgsPageState createState() => _SettintgsPageState();
}

class _SettintgsPageState extends State<SettintgsPage> {
  bool _colorSecundario = false;
  int _genero;
  // String _nombre;

  TextEditingController _textController;
  final prefs = new PreferenciasUsuario();

  @override
  void initState() {
    super.initState();
     prefs.ultimaPagina= SettintgsPage.routeName;
    _genero = prefs.genero;
    _colorSecundario = prefs.colorSecundario;
    _textController = new TextEditingController(text: prefs.nombreUsuario);
  }

  _setSelectedRadio(int valor) {
    prefs.genero = valor;
    _genero = valor;

    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('Ajustes'),
          backgroundColor: (prefs.colorSecundario) ? Colors.teal : Colors.blue,
        ),
        drawer: MenuWidget(),
        body: ListView(
          children: <Widget>[
            Container(
              padding: EdgeInsets.all(5.0),
              child: Text(
                'Ajuste Page',
                style: TextStyle(fontSize: 45.0, fontWeight: FontWeight.bold),
              ),
            ),
            Divider(),
            SwitchListTile(
              value: _colorSecundario,
              title: Text('Color secundario'),
              onChanged: (value) {
                //opcion2
                setState(() {
                  _colorSecundario = value;
                  prefs.colorSecundario = value;
                });
              },
            ),
            RadioListTile(
              value: 1,
              groupValue: _genero,
              title: Text('Masculino'),
              onChanged: _setSelectedRadio,

              // onChanged: (value) {
              //    setState(() {
              //     _genero = value;
              //   });
              // },
            ),
            RadioListTile(
              value: 2,
              groupValue: _genero,
              title: Text('Femenino'),
              onChanged: _setSelectedRadio,
              // onChanged: (value) {
              //    setState(() {
              //      print(value);
              //     _genero = value;
              //   });
              // },
            ),
            Divider(),
            Container(
              padding: EdgeInsets.symmetric(horizontal: 20.0),
              child: TextField(
                controller: _textController,
                decoration: InputDecoration(
                  labelText: 'nombre',
                  helperText: 'nombre de la persona',
                ),
                onChanged: (value) {
                  prefs.nombreUsuario= value;
                },
              ),
            )
          ],
        ));
  }
}
