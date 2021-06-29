import 'dart:async';

import 'package:okul_giris/model/sql_model.dart';
import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';

class DbHelper {
  static Database _db;
  String gelen_metin=" ";
  Future<Database> get db async {
    if (_db != null) return _db;
    _db = await initDb();
    return _db;
  }

  initDb() async {
    var dbFolder = await getDatabasesPath();
    String path = join(dbFolder, "hakkinda.db");
    return await openDatabase(path, onCreate: _onCreate, version: 1);
  }

  FutureOr<void> _onCreate(Database db, int version) async {
    return await db.execute(
        "CREATE TABLE hakkinda_metni(id INTEGER PRIMARY KEY, metin TEXT)"
    );
  }

  Future<String> getMetin() async {
    var dbClient = await db;
    var result = await dbClient.query("hakkinda_metni");
    // return result.map((data) => Hakkinda_Metni.fromMap(data)).toList();

    result.forEach((element) { gelen_metin=element.values.elementAt(1);});
    return gelen_metin;
  }

  Future<int> insertMetin(Hakkinda_Metni contact) async{
    var dbClient = await db;
    return await dbClient.insert("hakkinda_metni", contact.toMap());
  }

  Future<int> updateCollecCar(Hakkinda_Metni contact) async{
    var dbClient = await db;
    return await dbClient.update("hakkinda_metni", contact.toMap(), where: "id=?", whereArgs: [contact.id]);
  }

  // Future<void> removeCollecCar(int id) async{
  //   var dbClient = await db;
  //   return await dbClient.delete("hakkinda_metni", where: "id=?", whereArgs: [id]);
  // }
}