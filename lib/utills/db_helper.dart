// import 'dart:io';
// import 'package:database_flutter/Model/DB_Model.dart';
// import 'package:path/path.dart';
// import 'package:path_provider/path_provider.dart';
// import 'package:sqflite/sqflite.dart';
//
// class DB_helper {
//
//   static DB_helper db_helper = DB_helper();
//   Database? database;
//
//   final String dbPath = "dbase.db";
//   final String dbName = "datatable";
//
//   // String? amount = "Amount";
//   // String? category = "Category";
//   // String? date ="Date";
//   // String? status = "Status";
//
//   Future<Database?> createDB()
//   async {
//     if(database != null)
//     {
//       return database;
//     }
//     else
//     {
//       return await initDB();
//     }
//   }
//
//   Future<Database> initDB()
//   async {
//     Directory dir = await getApplicationDocumentsDirectory();
//     String path = join(dir.path, dbPath);
//
//     return await openDatabase(path,
//       version: 1,
//       onCreate: (db, version) async {
//         String query = 'CREATE TABLE $dbName (id INTEGER PRIMARY KEY AUTOINCREMENT, category TEXT, amount INTEGER)';
//
//          await db.execute(query);
//       },);
//   }
//
//
//   Future<void> insertInDB(DB_Model expenseModel)
//   async {
//     database = await createDB();
//     await database!.insert(dbName, {
//       'amount': expenseModel.amount,
//       'status':expenseModel.status,
//     }
//     );
//   }
//
//
//   Future<List<Map>> readDB()
//   async {
//     database = await createDB();
//     String query = 'SELECT * FROM $dbName';
//     List<Map> list = await database!.rawQuery(query);
//     return list;
//   }
//
//   // Future<void> deleteDB(int selId) async {
//   //   database = await createDB();
//   //   database!.delete(dbName,where: "id=?" ,whereArgs:[selId] );
//   // }
//
//   // Future<void> updateDB(DB_Model expenseModel) async {
//   //   database = await createDB();
//   //
//   //   database!.update(dbName, {
//   //     'amount': expenseModel.amount,
//   //     'status':expenseModel.status,
//   //   },where: "id=?",whereArgs: [expenseModel.id]
//   //   );
//   // }
//
// }
