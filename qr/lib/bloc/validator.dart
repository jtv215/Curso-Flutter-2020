import 'dart:async';

import 'package:qr/models/scan_model.dart';

class Validator {
  
  //<1>  <2>; 
  //priemer tipo es lo que entra y el segundo es el tipo que sale
  final validatorGeo = StreamTransformer<List<ScanModel>,List<ScanModel>>.fromHandlers(
    handleData: (data, sink)  {
      final geoScan = data.where((s)=>s.tipo=='geo').toList();
      sink.add(geoScan);
    },
  );

  final validatorHttp = StreamTransformer<List<ScanModel>,List<ScanModel>>.fromHandlers(
    handleData: (data, sink)  {
      final geoScan = data.where((s)=>s.tipo=='http').toList();
      sink.add(geoScan);
    },
  );


}