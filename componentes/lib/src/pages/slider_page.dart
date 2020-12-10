import 'package:flutter/material.dart';

class SliderPage extends StatefulWidget {
  @override
  _SliderPageState createState() => _SliderPageState();
}

class _SliderPageState extends State<SliderPage> {
  double _valorSlider = 100.0;
  bool _bloquearCheck = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Slider Page'),
      ),
      body: Container(
        padding: EdgeInsets.only(top: 50.0), //darle espacios arriba
        child: Column(
          children: <Widget>[
            _crearSlider(),
            _checkBox(),
            _crearSwitch(),
            Expanded(child: _crearImagen())
          ],
        ),
      ),
    );
  }

  Widget _crearSlider() {
    return Slider(
      value: _valorSlider,
      label: 'Tamaño de la imagen',
      // divisions: 20,
      min: 10.0,
      max: 400.0,
      onChanged: (_bloquearCheck)
          ? null
          : (valor) {
              setState(() {
                //Es como decir para que se ejecute los cambios
                print(valor);
                _valorSlider = valor;
              });
            },
    );
  }

  Widget _crearImagen() {
    return Image(
      image: NetworkImage(
          'https://www.lavanguardia.com/r/GODO/LV/p5/WebSite/2018/09/27/Recortada/img_amarti_20180927-195943_imagenes_lv_otras_fuentes_fc_barcelona_v_rgb-pos-khGF-U452055320011ktH-992x558@LaVanguardia-Web.jpg'),
      width: _valorSlider,
      fit: BoxFit.contain,
    );
  }

  Widget _checkBox() {
    // return Checkbox(
    //   value: _bloquearCheck,
    //   onChanged: (value) {
    //     setState(() {
    //       _bloquearCheck=value;
    //     });
    //   },
    // );

    return CheckboxListTile(
      /**La diferencia CheckboxListTile es que este se puede dar click en toda la fila y el de arriba no */
      title: Text('Bloquear slider'),
      value: _bloquearCheck,
      onChanged: (value) {
        setState(() {
          _bloquearCheck = value;
        });
      },
    );
  }

 Widget _crearSwitch() {

   return SwitchListTile(
      
      title: Text('Bloquear slider'),
      value: _bloquearCheck,
      onChanged: (value) {
        setState(() {
          _bloquearCheck = value;
        });
      },
    );
 }




}
