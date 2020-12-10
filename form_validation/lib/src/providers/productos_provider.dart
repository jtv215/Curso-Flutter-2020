import 'dart:convert';
import 'dart:io';

import 'package:form_validation/src/models/producto_model.dart';
import 'package:form_validation/src/preferencias_usuario/preferencias_usuario.dart';
import 'package:http/http.dart' as http;
import 'package:mime_type/mime_type.dart';
import 'package:http_parser/http_parser.dart';

class ProductosProvider {
  final String _url = 'https://flutter-varios-a2d43.firebaseio.com';
  final _prefs = new PreferenciasUsuario();

  //Cuando se envia datos a firebase se envia de tipo string
  Future<bool> crearProducto(ProductoModel producto) async {
    final url = '$_url/productos.json?auth=${_prefs.token}';

    final resp = await http.post(url, body: productoModelToJson(producto));

    final decodeData = json.decode(resp.body);

    print(decodeData);
    return true;
  }

  Future<List<ProductoModel>> cargarProductos() async {
    final url = '$_url/productos.json?auth=${_prefs.token}';
    final resp = await http.get(url);

    final Map<String, dynamic> decodedData = json.decode(resp.body);
    if (decodedData == null) return [];

    //Devolver una list
    final List<ProductoModel> productos = new List();

    decodedData.forEach((id, data) {
      final producto = ProductoModel.fromJson(data);
      producto.id = id;

      productos.add(producto);
    });

    print(productos);
    return productos;
  }

  Future<bool> actualizarProducto(ProductoModel producto) async {
    final url = '$_url/productos/${producto.id}.json?auth=${_prefs.token}';

    final resp = await http.put(url, body: productoModelToJson(producto));

    final decodeData = json.decode(resp.body);

    print(decodeData);
    return true;
  }

  Future<int> borrarProductos(String id) async {
    final url = '$_url/productos/$id.json?auth=${_prefs.token}';
    final resp = await http.delete(url);

    print(json.decode(resp.body));

    return 1;
  }

  Future<String> subirImage(File imagen) async {
    final url = Uri.parse(
        'https://api.cloudinary.com/v1_1/dzjmghsck/image/upload?upload_preset=rbcked5i');

    final mimeType = mime(imagen.path).split('/'); //image/jpeg

    final imageUploadRequest = http.MultipartRequest('POST', url);

    final file = await http.MultipartFile.fromPath('file', imagen.path,
        contentType: MediaType(mimeType[0], mimeType[1]));

    imageUploadRequest.files.add(file);

    final streamResponse = await imageUploadRequest.send();
    final resp = await http.Response.fromStream(streamResponse);

    if (resp.statusCode != 200 && resp.statusCode != 201) {
      print('algo salio mal');
      print(resp.body);
      return null;
    }

    final respData = json.decode(resp.body);
    print(resp.body);
    return respData['secure_url'];
  }

  
}
