import 'package:sqflite/sqflite.dart';

import 'alart_info.dart';

final String tableAlarm = 'alarm';
final String id = 'id';
final String title = 'title';
final String time = 'alarmDataTime';
final String pending = 'isPending';
final String colorIndex = 'gradientColorIndex';

class AlarmHelper {
  static Database? _database;
  static AlarmHelper? _alarmHelper;

  Future<Database?> get database async {
    _database ?? await initializaeDatabase();
    return _database;
  }

  Future<Database> initializaeDatabase() async {
    var dir = await getDatabasesPath();
    var path = dir + "alarm.db";

    var database = await openDatabase(
      path,
      version: 1,
      onCreate: (db, version) {
        db.execute('''
        create table $tableAlarm(
        $id integer primary key autoincrement,
        $title text not null,
        $time text not null,
        $pending integer,
        $colorIndex integer
        )
        ''');
      },
    );
    return database;
  }

  void insertAlarm(AlarmInfo alarmInfo) async {
    var db = await this.database;
    var result = await db?.insert(tableAlarm, alarmInfo.toJson());
  }
}
