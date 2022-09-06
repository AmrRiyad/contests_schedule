import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';

class SqlDb {
  static Database? _db;

  Future<Database?> get db async {
    if (_db == null) {
      _db = await intialDb();
      return _db;
    } else {
      return _db;
    }
  }

  intialDb() async {
    String databasepath = await getDatabasesPath();
    String path = join(databasepath, 'wael.db');
    Database mydb = await openDatabase(path,
        onCreate: _onCreate, version: 7, onUpgrade: _onUpgrade);
    return mydb;
  }

  _onUpgrade(Database db, int oldversion, int newversion) async {
    print("onUpgrade =====================================");
  }

  _onCreate(Database db, int version) async {
    await db.execute('''
  CREATE TABLE ContestsTable (
    "id" INTEGER  NOT NULL PRIMARY KEY  AUTOINCREMENT, 
    "platform" TEXT NOT NULL,
    "contestName" TEXT NOT NULL,
    "contestDate" TEXT NOT NULL,
   	"contestStartTime" TEXT NOT NULL,
  	"contestDuration" TEXT NOT NULL,
    "key" datetime NOT NULL
  )
 ''');

    //select * from Tests order by 'key' desc limit 1

    // INSERT INTO Tests ('key') VALUES('2022-01-01 10:00:00');

    /*
    select *  from Tests order BY "key" DESC

    select *  from Tests WHERE "key" >('2022-01-02 10:00:00')
    DELETE FROM Tests WHERE "key" >('2022-01-02 10:00:00')

    INSERT INTO Tests ('key') VALUES('2022-01-01 10:00:00');

    */
    print(" onCreate =====================================");
  }

  readData(String sql) async {
    Database? mydb = await db;
    List<Map> response = await mydb!.rawQuery(sql);
    return response;
  }

  insertData(String sql) async {
    Database? mydb = await db;
    int response = await mydb!.rawInsert(sql);
    return response;
  }

  updateData(String sql) async {
    Database? mydb = await db;
    int response = await mydb!.rawUpdate(sql);
    return response;
  }

  deleteData(String sql) async {
    Database? mydb = await db;
    int response = await mydb!.rawDelete(sql);
    return response;
  }

  mydeleteDatebase() async {
    String databasepath = await getDatabasesPath();
    String path = join(databasepath, 'wael.db');
    await deleteDatabase(path);
  }

// SELECT
// DELETE
// UPDATE
// INSERT

  read(String table) async {
    Database? mydb = await db;
    List<Map> response = await mydb!.query(table);
    return response;
  }

  insert(String table, Map<String, Object?> values) async {
    Database? mydb = await db;
    int response = await mydb!.insert(table, values);
    return response;
  }

  update(String table, Map<String, Object?> values, String? mywhere) async {
    Database? mydb = await db;
    int response = await mydb!.update(table, values, where: mywhere);
    return response;
  }

  delete(String table, String? mywhere) async {
    Database? mydb = await db;
    int response = await mydb!.delete(table, where: mywhere);
    return response;
  }
}
