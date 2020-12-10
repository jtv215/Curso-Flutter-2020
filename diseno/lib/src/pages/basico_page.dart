import 'package:flutter/material.dart';

class BasicoPage extends StatelessWidget {
  final estitloTitulo = TextStyle(fontSize: 20.0, fontWeight: FontWeight.bold);
  final estitloSubtitulo = TextStyle(fontSize: 18.0, color: Colors.grey);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            _zone1(),
            _zone2(),
            _zone3(),
            _zone4(),
            _zone4(),
            _zone4(),
            _zone4(),
            _zone4(),
          ],
        ),
      ),
    );
  }

  Widget _zone1() {
    
    return Image(
      width: double.infinity,
      height: 180.0,
      fit: BoxFit.cover,
        image:
            NetworkImage('https://i.ytimg.com/vi/GrGUmax0Cf4/hqdefault.jpg'));
  }

  Widget _zone2() {
    return SafeArea(
      child: Container(
        padding: EdgeInsets.symmetric(horizontal: 30.0, vertical: 20.0),
        child: Row(
          children: <Widget>[
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Text(
                    'Lago con un puente',
                    style: estitloTitulo,
                  ),
                  SizedBox(
                    height: 7.0,
                  ),
                  Text(
                    'Un lago en alemania',
                    style: estitloSubtitulo,
                  ),
                ],
              ),
            ),
            Icon(
              Icons.star,
              color: Colors.red,
            ),
            Text(
              '41',
              style: TextStyle(fontSize: 20.0),
            ),
          ],
        ),
      ),
    );
  }

  Widget _zone3() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: <Widget>[
        _action(Icons.call, 'Call'),
        _action(Icons.near_me, 'Route'),
        _action(Icons.share, 'Share'),
      ],
    );
  }

  Widget _action(IconData icon, String texto) {
    return Column(
      children: <Widget>[
        Icon(
          icon,
          color: Colors.blue,
          size: 40.0,
        ),
        SizedBox(
          height: 5.0,
        ),
        Text(
          texto,
          style: TextStyle(fontSize: 15.0, color: Colors.blue),
        ),
      ],
    );
  }

  Widget _zone4() {
    return SafeArea(
      child: Container(
        padding: EdgeInsets.symmetric(horizontal: 40.0, vertical: 20.0),
        child: Text(
          'Amet non proident duis et aute dolorem. adsfas fad fs ddddda afegf ae e es e eeeeeeeeee hfaieo9gfie iejfoi hew aiofhji aoieñoaw  oaihfoiaw ef aioqhfeoiaw eawejhofia jwe aoi rfjeoiajwe',
          textAlign: TextAlign.justify,
        ),
      ),
    );
  }
}

//  decoration: BoxDecoration(
//           border: Border.all(
//             color: Colors.blue,
//           ),
//           borderRadius: BorderRadius.circular(10.0),
//),
