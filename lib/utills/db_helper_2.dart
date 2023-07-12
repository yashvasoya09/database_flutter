import 'dart:io';

import 'package:database_flutter/Model/DB_Model.dart';
import 'package:path/path.dart';

import 'package:path_provider/path_provider.dart';
import 'package:sqflite/sqflite.dart';

class DB_Helper_2
{
  Database? database;
  final String dbPath = "dbase.db";
  final String dbName = "datatable";

  Future<Database?> createDB()
  async {
    if(database == null)
      {
        return database;
      }
    else{
      return  await initDB();
    }
  }
Future<Database> initDB() async {
  Directory dir =await getApplicationDocumentsDirectory();
  String path = join(dir.path,dbPath);
  return await openDatabase(path,version: 1,onCreate: (db, version) {
    String query = 'CREATE TABLE $dbName (id INTEGER PRIMARY KEY AUTOINCREMENT, category TEXT, amount INTEGER)';
    db.execute(query);
  },);
}
Future<void> insertDB(DB_Model db_model)
async {
  database = await createDB();
  String query = 'SELECT * FROM $dbName';
  await database?.insert(dbName, {
    'amount': db_model.amount,
    'status': db_model.status,
  });
  print("${db_model.amount}***************************************************************************************************************");
}

  Future<List<Map>> readDB()
  async {
    database = await createDB();
    String query = 'SELECT * FROM $dbName';
    List<Map> list = await database!.rawQuery(query);
    return list;
  }
}