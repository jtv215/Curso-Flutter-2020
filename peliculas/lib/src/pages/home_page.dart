import 'package:flutter/material.dart';
import 'package:peliculas/src/models/pelicula_model.dart';
import 'package:peliculas/src/providers/pelicula_provider.dart';
import 'package:peliculas/src/search/search_delegate.dart';
import 'package:peliculas/src/widgets/card_swiper_widget.dart';
import 'package:peliculas/src/widgets/movie_horizontal.dart';

class HomePage extends StatelessWidget {
  //información:
  // SafeArea(..) //SafeArea: No escribe en el navbar donde esta los iconos de la hora
  final peliculasProvider = new PeliculaProvider();

  @override
  Widget build(BuildContext context) {
    peliculasProvider.getPopulares();

    return Scaffold(
      appBar: AppBar(
        centerTitle: false,
        title: Text('Peliculas en cines'),
        backgroundColor: Colors.indigoAccent,
        actions: <Widget>[
          IconButton(
            icon: Icon(Icons.search),
            onPressed: () {
              showSearch(
                context: context,
                delegate: DataSearch(),
                // query: 'hola',
              );
            },
          )
        ],
      ),
      body: Container(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: <Widget>[
            _swiperTarjetas(),
            _footer(context),
          ],
        ),
      ),
    );
  }

  Widget _swiperTarjetas() {
    return FutureBuilder(
      future: peliculasProvider.getEnCines(),
      // initialData: InitialData, se quiere poner un loading
      builder: (BuildContext context, AsyncSnapshot<List<Pelicula>> snapshot) {
        if (snapshot.hasData) {
          return CardSwiper(peliculas: snapshot.data);
        } else {
          return Container(
            height: 300.0,
            child: Center(
              child: CircularProgressIndicator(),
            ),
          ); //loading

        }
      },
    );
  }

  Widget _footer(BuildContext context) {
    return Container(
      width: double.infinity,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start, //para columna
        children: <Widget>[
          Container(
            padding: EdgeInsets.only(left: 20.0),
            child:
                Text('Populares', style: Theme.of(context).textTheme.headline4),
          ),
          SizedBox(height: 15.0),
          StreamBuilder(
            stream: peliculasProvider.popularesStream,
            // initialData: [],
            builder: (BuildContext context, AsyncSnapshot<List> snapshot) {
              // snapshot.data?.forEach((p)=> print(p.title));
              if (snapshot.hasData) {
                return MovieHorizontal(
                    peliculas: snapshot.data,
                    siguientePagina: peliculasProvider.getPopulares);
              } else {
                return Center(child: CircularProgressIndicator()); //loading
              }
            },
          ),
        ],
      ),
    );
  }
}

/**FutureBuilder: Solo se ejecuta una vez,streamBuilder se ejecuta como un observable  */
// FutureBuilder(
//           future: peliculasProvider.getPopulares(),
//           // initialData: InitialData,
//           builder: (BuildContext context, AsyncSnapshot<List> snapshot) {
//             // snapshot.data?.forEach((p)=> print(p.title));
//             if (snapshot.hasData) {
//               return MovieHorizontal(peliculas: snapshot.data);
//             } else {
//               return Center(child: CircularProgressIndicator()); //loading
//             }
//           },
//         ),
