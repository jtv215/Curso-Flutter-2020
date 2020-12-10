import 'package:path_provider/path_provider.dart';
import 'package:sqflite/sqflite.dart';
import 'dart:io'; //Directory
import 'package:path/path.dart';
import 'package:qr/models/scan_model.dart';
export 'package:qr/models/scan_model.dart';//para exponer ese modelo en  un archivo que tenga dbprovicer 

class DBProvider {
  static Database _database;
  static final DBProvider db = DBProvider._private();

  DBProvider._private();

  Future<Database> get database async {
    if (_database != null) return _database;
    _database = await initDB();
    return _database;
  }

  initDB() async {
    Directory documentsDirectory = await getApplicationDocumentsDirectory();

    final path = join(documentsDirectory.path,
        'ScansDB.db'); //el documento y el nombre del archivo

    return await openDatabase(path, version: 1, onOpen: (db) {},
        onCreate: (Database db, int version) async {
      await db.execute('CREATE TABLE Scans ('
          'id  INTEGER PRIMARY KEY,'
          'tipo TEXT,'
          'valor TEXT'
          ')');
    });
  }

//CREAR  registros

// nuevoScanRaw(ScanModel nuevoScan)  async{

//   final db= await database;

//   final res = await db.rawInsert(
//     "INSERT into Scans(iD, tipo,valor) "
//     "VALUES (${nuevoScan.id}, '${nuevoScan.tipo}','${nuevoScan.valor}')"
//   );
//   return res;

// }

//CREAR
  nuevoScan(ScanModel nuevoScan) async {
    final db = await database;
    final res = await db.insert('Scans', nuevoScan.toJson());
    return res;
  }

//Select
  Future<ScanModel> getScanId(int id) async {
    final db = await database;
    final res = await db.query('Scan', where: 'id=?', whereArgs: [id]);
    return res.isNotEmpty ? ScanModel.fromJson(res.first) : null;
  }

  Future<List<ScanModel>> getScansAll( ) async {
    final db = await database;
    final res = await db.rawQuery("SELECT * FROM Scans");

    List<ScanModel> list =
        res.isNotEmpty ? res.map((c) => ScanModel.fromJson(c)).toList() : [];

    return list;
  }
  Future<List<ScanModel>> getScansPorTipo(String tipo) async {
    final db = await database;
    final res = await db.rawQuery("SELECT * FROM Scans WHERE tipo='$tipo'");

    List<ScanModel> list =
        res.isNotEmpty ? res.map((c) => ScanModel.fromJson(c)).toList() : [];

    return list;
  }

//Actualizar
  Future<int> updateScan(ScanModel nuevoScan) async {
    final db = await database;
    final res = await db.update('Scans', nuevoScan.toJson(),
        where: 'id=?', whereArgs: [nuevoScan.id]);
    return res;
  }

//Eliminar registros

  Future<int> deleteScan(int id) async {
    final db = await database;
    final res = await db.delete('Scans', where: 'id=?', whereArgs: [id]);
    return res;
  }

  //Eliminar todos

  Future<int> deleteAllScan() async {
    final db = await database;
    // final res = await db.rawQuery("DELETE * FROM Scans");
    final res = await db.delete('Scans');
    return res;
  }
}
