import 'package:flutter/material.dart';

class InputPage extends StatefulWidget {
  @override
  _InputPageState createState() => _InputPageState();
}

class _InputPageState extends State<InputPage> {
  String _nombre = '';
  String _email = '';
  String _password = '';
  String _fecha = '';
  String _opcionSeleccionada = 'volar';
  List _poderes = ['volar', 'Rayos x', 'cruzar paredes'];

  TextEditingController _inputFielDateController = new TextEditingController();
  //Nos permite eidtar el campo fecha
  //para la fecha

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Input de texto'),
      ),
      body: ListView(
        padding: EdgeInsets.symmetric(horizontal: 10.0, vertical: 20.0),
        children: <Widget>[
          _crearInput(),
          Divider(),
          _crearEmail(),
          Divider(),
          _crearPassword(),
          Divider(),
          _crearFecha(context, _inputFielDateController),
          Divider(),
          _crearDropdown(),
          Divider(),
          _crearPersona(),
        ],
      ),
    );
  }

  Widget _crearInput() {
    return TextField(
      autofocus: true,
      textCapitalization:
          TextCapitalization.sentences, //mayuscula en el primer caracter
      decoration: InputDecoration(
        border: OutlineInputBorder(borderRadius: BorderRadius.circular(20.0)),
        counter: Text('Letra ${_nombre.length}'),
        hintText: 'Nombre de la persona',
        labelText: 'Nombre',
        helperText: 'Solo es el nombre',
        suffixIcon: Icon(Icons.accessibility), //icono dentro del input
        icon: Icon(Icons.account_circle), //icono alprincipio del input
      ),
      onChanged: (valor) {
        setState(() {
          _nombre = valor;
        });
        print(_nombre);
      },
    );
  }

  Widget _crearPersona() {
    return ListTile(
      title: Text('nombre es $_nombre'),
      subtitle: Text('Email $_email'),
    );
  }

  Widget _crearEmail() {
    return TextField(
      keyboardType: TextInputType.emailAddress,
      decoration: InputDecoration(
        border: OutlineInputBorder(borderRadius: BorderRadius.circular(20.0)),
        hintText: 'Email',
        labelText: 'Email',
        suffixIcon: Icon(Icons.alternate_email), //icono dentro del input
        icon: Icon(Icons.email), //icono alprincipio del input
      ),
      onChanged: (valor) {
        setState(() {
          _email = valor;
        });
        print(_email);
      },
    );
  }

  Widget _crearPassword() {
    return TextField(
      obscureText: true,
      keyboardType: TextInputType.emailAddress,
      decoration: InputDecoration(
        border: OutlineInputBorder(borderRadius: BorderRadius.circular(20.0)),
        hintText: 'Contraseña',
        labelText: 'Contraseña',
        suffixIcon: Icon(Icons.lock_open), //icono dentro del input
        icon: Icon(Icons.lock), //icono alprincipio del input
      ),
      onChanged: (valor) {
        setState(() {
          _password = valor;
        });
        print(_password);
      },
    );
  }

  _crearFecha(
      BuildContext context, TextEditingController _inputFielDateController) {
    return TextField(
      enableInteractiveSelection: false,
      controller: _inputFielDateController,
      decoration: InputDecoration(
        border: OutlineInputBorder(borderRadius: BorderRadius.circular(20.0)),
        hintText: 'Fecha',
        labelText: 'Fecha',
        suffixIcon: Icon(Icons.perm_contact_calendar), //icono dentro del input
        icon: Icon(Icons.calendar_today), //icono alprincipio del input
      ),
      onTap: () {
        FocusScope.of(context).requestFocus(new FocusNode());
        _selectDate(context);
      },
    );
  }

  _selectDate(BuildContext context) async {
    DateTime picked = await showDatePicker(
        context: context,
        initialDate: new DateTime.now(),
        firstDate: DateTime(2018),
        lastDate: DateTime(2025),
        locale: Locale('es', 'ES'));

    if (picked != null) {
      setState(() {
        _fecha = picked.toString();
        var array = _fecha.split(' ');
        _fecha = array[0];
        _inputFielDateController.text = _fecha;
      });
    }
  }

  _crearDropdown() {
    List<DropdownMenuItem<String>> getOpcionnes() {
      List<DropdownMenuItem<String>> lista = new List();

      _poderes.forEach((element) {
        lista.add(DropdownMenuItem(
          child: Text(element),
          value: element,
        ));
      });

      return lista;
    }

    // return Row(
    //   children: <Widget>[
    //     Icon(Icons.select_all),
    //     // SizedBox(
    //     //   width: 30.0,
    //     // ),
    //     Expanded(
    //       child: DropdownButtonFormField(
    //         decoration: InputDecoration(
    //           border:
    //               OutlineInputBorder(borderRadius: BorderRadius.circular(20.0)),
    //         ),
    //         isExpanded: true,
    //         value: _opcionSeleccionada,
    //         icon: Icon(Icons.calendar_today), //icono alprincipio del input

    //         items: getOpcionnes(),
    //         onChanged: (opt) {
    //           setState(() {
    //             // print(opt);
    //             _opcionSeleccionada = opt;
    //           });
    //         },
    //       ),
    //     ),
    //   ],
    // );

    return DropdownButtonFormField(
      decoration: InputDecoration(
        border: OutlineInputBorder(borderRadius: BorderRadius.circular(20.0)),
        icon: Icon(Icons.select_all), //icono alprincipio del input
      ),
      isExpanded: true,
      value: _opcionSeleccionada,
      items: getOpcionnes(),
      onChanged: (opt) {
        setState(() {
          // print(opt);
          _opcionSeleccionada = opt;
        });
      },
    );
  }
}
