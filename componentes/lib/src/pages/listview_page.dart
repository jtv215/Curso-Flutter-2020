import 'package:flutter/material.dart';
import 'dart:async';

class ListaPage extends StatefulWidget {
  @override
  _ListaPageState createState() => _ListaPageState();
}

class _ListaPageState extends State<ListaPage> {
  ScrollController _scrollController = new ScrollController();

  List<int> _listaNumero = new List();
  int _ultimoItem = 0;
  bool _isLoading = false;

  @override
  void initState() {
    super.initState();
    _agregar10();

    _scrollController.addListener(() {
      if (_scrollController.position.pixels ==
          _scrollController.position.maxScrollExtent) {
        // _agregar10();

        fetchData(); //fetchdata lo que le digo que espere 2 segundos para que cargue y se muestre
      }
      // print('bajando');
    });
  }

  @override
  void dispose() {
    super.dispose();
    _scrollController.dispose();
    //elimina addLister cuando sales de la pantalla , para liberar memoria.
    //con el metodo del dispose
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Listas'),
      ),
      body: Stack(
        //El stack apila los obejtos uno encima del otro
        children: <Widget>[
          _crearLista(),
          _crearLoading(),
        ],
      ),
    );
  }

  Widget _crearLista() {
    return RefreshIndicator(
      onRefresh: obtenerPagina1,
      child: ListView.builder(
        ///lista de imagenes en un array
        controller: _scrollController,
        itemCount: _listaNumero.length,
        itemBuilder: (BuildContext context, int index) {
          final image = _listaNumero[index];

          return FadeInImage(
              placeholder: AssetImage('assets/jar-loading.gif'),
              image:
                  NetworkImage('https://picsum.photos/500/300/?image=$image'));
        },
      ),
    );
  }

  Future<Null> obtenerPagina1() async {
    final duration = new Duration(seconds: 2);
    print(duration);

     new Timer(duration, () {
       _listaNumero.clear();
      // _ultimoItem++;

      _agregar10();
    });

     return  Future.delayed(Duration(seconds: 2));
  }

  void _agregar10() {
    setState(() {
      for (var i = 0; i < 10; i++) {
        _ultimoItem++;
        _listaNumero.add(_ultimoItem);
      }
    });
  }

  void fetchData() {
    _isLoading = true;

    setState(() {
      //setState es para decir que una propiedad cambió
      final duration = new Duration(seconds: 2);
      new Timer(duration, respuestaHTTP);
    });
  }

  void respuestaHTTP() {
    _isLoading = false;

    _scrollController.animateTo(_scrollController.position.pixels + 600,
        duration: Duration(milliseconds: 550), curve: Curves.fastOutSlowIn);

    _agregar10();
  }

  Widget _crearLoading() {
    if (_isLoading) {
      return Column(
        mainAxisSize: MainAxisSize.max,
        mainAxisAlignment: MainAxisAlignment.end,
        children: <Widget>[
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              CircularProgressIndicator(),
            ],
          ),
        ],
      );
    } else {
      return Container();
    }
  }
}
