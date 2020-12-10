import 'package:flutter/material.dart';

class ScrollPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Center(
      child: PageView(
        scrollDirection: Axis.vertical,
        children: <Widget>[
          _paggina1(),
          _paggina2(),
        ],
      ),
    ));
  }

  Widget _paggina1() {
    return Stack(
      children: <Widget>[
        _colorFondo(),
        _imagenFondo(),
        _textos(),
      ],
    );
  }

  Widget _paggina2() {
    return Container(
      width: double.infinity,
      height: double.infinity,
      color: Color.fromRGBO(108, 192, 218, 1.0),
      child: Center(
        child: RaisedButton(
          shape: StadiumBorder(),
          color: Colors.blue,
          textColor: Colors.white,
          child:Padding(
            padding: EdgeInsets.symmetric(horizontal: 40.0, vertical: 20.0),
            child: Text('Bienvenidos', style: TextStyle(fontSize: 20.0),)),
           onPressed: (){

           }
           
           ),
      ),
    );
  }

  Widget _colorFondo() {
    return Container(
      width: double.infinity,
      height: double.infinity,
      color: Color.fromRGBO(108, 192, 218, 1.0),
    );
  }

  Widget _imagenFondo() {
    return Container(
        width: double.infinity,
        height: double.infinity,
        child: Image(
          image: AssetImage('assets/scroll-1.png'),
          fit: BoxFit.cover,
        ));
  }

  Widget _textos() {
    final estiloTexto = TextStyle(color: Colors.white, fontSize: 50.0);
    return Column(
      children: <Widget>[
        SizedBox(
          height: 20.0,
        ),
        Text('11aaaaaaº', style: estiloTexto),
        Text('Miércoles', style: estiloTexto),
        Expanded(child: Container()),
        Icon(
          Icons.keyboard_arrow_down,
          size: 70.0,
          color: Colors.white,
        ),
      ],
    );
  }
}
