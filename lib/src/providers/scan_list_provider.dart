import 'package:flutter/material.dart';
import 'package:flutter_curso_05_qr_scanner_app/src/models/scan_model.dart';
import 'package:flutter_curso_05_qr_scanner_app/src/providers/db_provider.dart';

class ScanListProvider extends ChangeNotifier {

  List<ScanModel> _scans = [];
  String _selectedType = 'http';


  List<ScanModel> get scans => _scans;

  initialLoad() async {
    final scans = await DBProvider.db.getDataList();
    _scans = [...?scans];
    notifyListeners();
  }

  initialLoadByType(String type) async {
    _selectedType = type;
    final scans = await DBProvider.db.getDataByType(type);
    _scans = [...?scans];
    notifyListeners();
  }
  
  insertScan (String value) async {
    ScanModel scanModel = await DBProvider.db.insert(ScanModel(value: value));
    if (scanModel.type==_selectedType) {
      _scans.add(scanModel);
      notifyListeners();
    }
  }

  deleteById (int id) async {
    await DBProvider.db.delete(id);
    _scans.removeWhere((element) => element.id==id);
    notifyListeners();
  }

  deleteAll () async {
    await DBProvider.db.deleteAll();
    _scans = [];
    notifyListeners();
  }


}