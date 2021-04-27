import 'package:agenda_flutter/components/contact.dart';
import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';

class ScheduleRepository {
  static final ScheduleRepository _singleton = new ScheduleRepository();

  factory ScheduleRepository() {
    return _singleton;
  }

  static _dataBaseManager() async {
    final int versionDb = 1;
    final pathDatabase = await getDatabasesPath();
    final localDatabase = join(pathDatabase, "schedule.db");
    var database = await openDatabase(localDatabase, version: versionDb,
        onCreate: (db, versionDb) {
      String commands =
          "create table contacts(id integer primary key, name varchar, phoneNumber integer)";
      db.execute(commands);
    });
    return database;
  }

  static insert(Contact contact) async {
    Database db = await _dataBaseManager();
    Map<String, dynamic> mapContact = {
      "name": contact.name,
      "phoneNumber": contact.phoneNumber
    };

    int id = await db.insert("contacts", mapContact);
    print("salvou $id");
  }

  static Future list() async {
    Database db = await _dataBaseManager();
    List rows = await db.rawQuery("select * from contacts");

    var _items = new List();
    for (var item in rows) {
      _items.add(new Contact(item['name'], item['phoneNumber'], item['id']));
    }

    return _items;
  }

  static update(Contact contact) async {
    Database db = await _dataBaseManager();

    Map<String, dynamic> mapContact = {
      "name": contact.name,
      "phoneNumber": contact.phoneNumber
    };

    int id = await db.update("contacts", mapContact,
        where: 'id = ?', whereArgs: [contact.id]);
  }

  static delete(Contact contact) async {
    Database db = await _dataBaseManager();

    int id =
        await db.delete("contacts", where: ' id = ?', whereArgs: [contact.id]);
  }
}
