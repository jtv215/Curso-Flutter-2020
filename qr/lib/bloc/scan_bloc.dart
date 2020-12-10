import 'dart:async';

import 'package:qr/bloc/validator.dart';
import 'package:qr/models/scan_model.dart';
import 'package:qr/providers/db_provider.dart';

class ScansBloc with Validator{
  static final ScansBloc _singleton = new ScansBloc._internal();

  factory ScansBloc() {
    return _singleton;
  }

  ScansBloc._internal() {
    obtenerScans();
  }

  //esta escuchando ,y hay que cerrar la instancia del scancontroller con un dispose
  final _scansController = StreamController<List<ScanModel>>.broadcast();
  //******dentro de streambuilder (stream : llamar a scanStream)
  Stream<List<ScanModel>> get scansStream => _scansController.stream.transform(validatorGeo); //va a notificar
  Stream<List<ScanModel>> get scansStreamHttp => _scansController.stream.transform(validatorHttp); //va a notificar

  dispose() {
    _scansController?.close(); //si no hay objeto falla por eso se pone ?
  }

  agregarScan(ScanModel scan) async {
    await DBProvider.db.nuevoScan(scan);
    obtenerScans();
  }

  obtenerScans() async {
    _scansController.sink.add(await DBProvider.db
        .getScansAll()); //como devuelve un future se pone await
  }

  borrarScan(int id) async {
    await DBProvider.db.deleteScan(id);
    obtenerScans();
  }

  borrarScanTodos() async {
    await DBProvider.db.deleteAllScan();
    obtenerScans();
  }
}
