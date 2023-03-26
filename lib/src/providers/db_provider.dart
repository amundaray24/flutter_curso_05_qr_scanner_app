import 'dart:io';

import 'package:path/path.dart' as Path;
import 'package:path_provider/path_provider.dart';
import 'package:sqflite/sqflite.dart';

import 'package:flutter_curso_05_qr_scanner_app/src/models/scan_model.dart';

class DBProvider {

  static Database? _database;

  static final DBProvider db = DBProvider._();

  DBProvider._();

  Future<Database?> get database async {
    if (_database==null) return _database = await initDatabase();
    return _database;
  }

  Future<Database> initDatabase() async {
    
    Directory documentDirectory = await getApplicationDocumentsDirectory();
    final path = Path.join(documentDirectory.path, 'scansDB.db');
    return await openDatabase(
      path,
      version: 1,
      onCreate: (db, version) async {
        await db.execute('''
          CREATE TABLE Scans(
            id INTEGER PRIMARY KEY,
            type TEXT,
            value TEXT
          );
        ''');
      },
    );
  }

  Future<ScanModel> insert(ScanModel scanModel) async {
    final db = await database;
    final id = await db?.insert('Scans', scanModel.toJson());
    scanModel.id = id!;
    return scanModel;
  }

  Future<List<ScanModel>?> getDataList() async {
    final db = await database;
    final response = await db?.query('Scans');
    return response!.isNotEmpty ? response.map((e) => ScanModel.fromJson(e)).toList() : [];
  }

  Future<ScanModel?> getDataById(int id) async {
    final db = await database;
    final response = await db?.query('Scans',where: 'id = ?',whereArgs: [id]);
    return response!.isNotEmpty ? ScanModel.fromJson(response.first) : null;
  }

  Future<List<ScanModel>?> getDataByType(String type) async {
    final db = await database;
    final response = await db?.query('Scans',where: 'type = ?',whereArgs: [type]);
    return response!.isNotEmpty ? response.map((e) => ScanModel.fromJson(e)).toList() : [];
  }

  Future<int?> update(ScanModel scanModel) async {
    final db = await database;
    final response = await db?.update('Scans', scanModel.toJson(), where: 'id = ?',whereArgs: [scanModel.id]);
    return response;
  }

  Future<int?> delete(int id) async {
    final db = await database;
    final response = await db?.delete('Scans', where: 'id = ?',whereArgs: [id]);
    return response;
  }

  Future<int?> deleteAll() async {
    final db = await database;
    final response = await db?.delete('Scans');
    return response;
  }
}