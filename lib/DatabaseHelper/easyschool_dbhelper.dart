import 'dart:io';

import 'package:all_about_api/Model/easyschool_model.dart';
import 'package:path/path.dart';
import 'package:path_provider/path_provider.dart';
import 'package:sqflite/sqflite.dart';

class EasySchoolDBHelper {
  static const _dbVersion = 1;
  static const _dbName = "EasySchool.db";
  static const tableName = "schooldata";

  static const idd = "id";
  static const ImgID = "ImgID";
  static const AlbumID = "AlbumID";
  static const AlbumName = "AlbumName";
  static const ImageName = "ImageName";
  static const ImageSource = "ImageSource";
  static const FileType = "FileType";

  EasySchoolDBHelper._privateConstructor();
  static final EasySchoolDBHelper instance =
      EasySchoolDBHelper._privateConstructor();
  static Database? _database;
  Future<Database?> get db async {
    if (_database != null) {
      return _database;
    }
    _database = await initDatabase();
    return _database;
  }

  initDatabase() async {
    //create a directory for input
    Directory directory = await getApplicationDocumentsDirectory();

    String path = join(directory.path, _dbName);
    var db = await openDatabase(path, version: _dbVersion, onCreate: onCreate);
    return db;
  }

  Future<void> onCreate(Database db, int version) async {
    await db.execute('''CREATE TABLE $tableName (
          $idd INTEGER PRIMARY KEY , $ImgID TEXT,$AlbumID TEXT, $AlbumName,$ImageName TEXT,$ImageSource TEXT, $FileType TEXT)''');
  }

  Future<void> insertData(Map<String, dynamic> row) async {
    final dbClient = await instance.db;
    await dbClient!.insert(tableName, row);
  }

  Future<List<LstAlbumDetail>> getData() async {
    final dbClient = await instance.db;
    final List<Map<String, dynamic>> data = await dbClient!.query(tableName);
    print(data);
    return data.map((e) => LstAlbumDetail.fromJson(e)).toList();
  }

  Future<dynamic> deleteAllDataFromEasySchoolDb() async {
    Database? dbClient = await instance.db;
    return await dbClient!.delete(tableName);
  }
}
