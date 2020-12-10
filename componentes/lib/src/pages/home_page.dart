import 'package:componentes/src/providers/menu_provider.dart';
import 'package:flutter/material.dart';
import 'package:componentes/src/utils/icono_string_util.dart';

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('componentes'),
      ),
      body: _lista(),
    );
  }

  Widget _lista() {
    /**No es viable este método porque lo que tarda en mostrar los datos, es lo que tarda en abrirse la app **/
    // menuProvider.cargarData().then((opciones) {
    //   print('dentro del menu privider');
    //   print(opciones);

    //   return ListView(
    //     children: _listaItems(opciones),
    //   );
    // });

    return FutureBuilder(
      future: menuProvider.cargarData(),
      initialData: [],
      builder: (context, AsyncSnapshot<List<dynamic>> snapshot) {  //el tipo de dato que devuelve el future
        
        return ListView(
          children: _listaItems(snapshot.data, context),
        );

      },
    );
  }
}

List<Widget> _listaItems(List<dynamic> data,BuildContext context) {
 
  final List<Widget> opciones = [];

  // if(data==null ){return [];}

  data.forEach((opt) {
    final temp = ListTile(
      title: Text(opt['texto']),
      leading: getIcon(opt['icon']),
      trailing: Icon(Icons.keyboard_arrow_right, color: Colors.blueAccent),
      onTap:(){

        /**El nombre de la ruta tiene que esta definida en MyApp */
        Navigator.pushNamed(context, opt['ruta']);

      /***RUTAS */
        // final route= MaterialPageRoute(
        //   builder: (context)=> AlertPage()
        // );

        // Navigator.push(context, route);

      },
      );
   
    opciones..add(temp)..add(Divider());
  });
  return opciones;
}
