import 'dart:convert';

import 'package:form_validation/src/preferencias_usuario/preferencias_usuario.dart';
import 'package:http/http.dart' as http;

final String _fireBaseToken = 'AIzaSyBkzqpEUU9lhw1hg4FRNrfWAEE8ej0mFz4';
final _prefs = new PreferenciasUsuario();

class UsuarioProvider {
  Future<Map<String, dynamic>> login(String email, String password) async {
    final authData = {
      'email': email,
      'password': password,
      'returnSecureToken': true
    };

    final url =
        'https://identitytoolkit.googleapis.com/v1/accounts:signInWithPassword?key=$_fireBaseToken';

    final resp = await http.post(url, body: json.encode(authData));

    Map<String, dynamic> decodeResp = json.decode(resp.body);
    //print(decodeResp);

    if (decodeResp.containsKey('idToken')) {
      _prefs.token = decodeResp['idToken'];
      return {'ok': true, 'token': decodeResp['idToken']};
    } else {
      return {'ok': false, 'token': decodeResp['error']['message']};
    }
  }

  Future<Map<String, dynamic>> nuevoUsuario(
      String email, String password) async {
    final authData = {
      'email': email,
      'password': password,
      'returnSecureToken': true
    };

    final url =
        'https://identitytoolkit.googleapis.com/v1/accounts:signUp?key=$_fireBaseToken';

    final resp = await http.post(url, body: json.encode(authData));

    Map<String, dynamic> decodeResp = json.decode(resp.body);
    print(decodeResp);

    if (decodeResp.containsKey('idToken')) {
      // _prefs.token = decodeResp['idToken'];

      return {'ok': true, 'token': decodeResp['idToken']};
    } else {
      return {'ok': false, 'token': decodeResp['error']['message']};
    }
  }
}
