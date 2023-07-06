import 'dart:io';

import 'package:path/path.dart';
import 'package:path_provider/path_provider.dart';
import 'package:sqflite/sqflite.dart';

class DB_Helper
{
  final String Dbpath="database.db";
  Database? database;
  Future<Database?> createDB()
  async {
    if(database!=null)
      {
        return database;
      }
    else
      {
return await intDB();
      }
  }
  Future<Database> intDB() async {
    Directory dir = await getApplicationDocumentsDirectory();
    String path =  join(dir.path,Dbpath);
    return await openDatabase(path,version: 1,onCreate: (db, version) async {
      return await db.execute('CREATE TABLE datatable(id INTEGER PRIMARY KEY AUTOINCREMATE ,amount INTEGER ,note TEXT)');
    },);
  }
  Future<int> insertDB({note,amount})
  async {
    database = await createDB();
    return await  database!.insert('datatable', {"note":note,"amount":amount});
  }
}