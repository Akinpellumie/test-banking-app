import 'package:mobile_banking_app/model/delegate/delegate.dart';
import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';

import '../model/delegate/delegate_fields.dart';

class DelegateDatabase {
  static final DelegateDatabase instance = DelegateDatabase._init();
  static Database? _database;
  DelegateDatabase._init();
  Future<Database> get database async {
    if (_database != null) {
      return _database!;
    } else {
      _database = await _initDB('delegates.db');
      return _database!;
    }
  }

  Future<Database> _initDB(String filePath) async {
    final dbPath = await getDatabasesPath();
    final path = join(dbPath, filePath);

    return await openDatabase(path, version: 1, onCreate: _createDB);
  }

  Future _createDB(Database db, int version) async {
    const idType = 'INTEGER PRIMARY KEY AUTOINCREMENT';
    const textType = 'TEXT NOT NULL';
    //const boolType = 'BOOLEAN NOT NULL';
    //const integerType = 'INTEGER NOT NULL';

    await db.execute('''
CREATE TABLE $tableDelegates ( 
  ${DelegateFields.id} $idType, 
  ${DelegateFields.delegateOwner} $textType,
  ${DelegateFields.fullname} $textType,
  ${DelegateFields.username} $textType,
  ${DelegateFields.email} $textType,
  ${DelegateFields.phoneNumber} $textType,
  ${DelegateFields.acctname} $textType,
  ${DelegateFields.acctnumber} $textType,
  ${DelegateFields.bankname} $textType,
  ${DelegateFields.maxAmount} $textType,
  ${DelegateFields.password} $textType,
  ${DelegateFields.createdAt} $textType
  )
''');
  }

  Future<Delegate> create(Delegate delegate) async {
    final db = await instance.database;

    // final json = note.toJson();
    // final columns =
    //     '${NoteFields.title}, ${NoteFields.description}, ${NoteFields.time}';
    // final values =
    //     '${json[NoteFields.title]}, ${json[NoteFields.description]}, ${json[NoteFields.time]}';
    // final id = await db
    //     .rawInsert('INSERT INTO table_name ($columns) VALUES ($values)');

    final id = await db.insert(tableDelegates, delegate.toJson());
    return delegate.copy(id: id);
  }

  Future<Delegate> readDelegate(int id) async {
    final db = await instance.database;

    final maps = await db.query(
      tableDelegates,
      columns: DelegateFields.values,
      where: '${DelegateFields.id} = ?',
      whereArgs: [id],
    );

    if (maps.isNotEmpty) {
      return Delegate.fromJson(maps.first);
    } else {
      throw Exception('ID $id not found');
    }
  }

  Future<List<Delegate>> readAllDelegates(String delegateOwner) async {
    final db = await instance.database;

    const orderBy = '${DelegateFields.createdAt} ASC';
    // final result =
    //     await db.rawQuery('SELECT * FROM $tableNotes ORDER BY $orderBy');

    final result = await db.query(
      tableDelegates,
      orderBy: orderBy,
      where: '${DelegateFields.delegateOwner} = ?',
      whereArgs: [delegateOwner],
    );

    return result.map((json) => Delegate.fromJson(json)).toList();
  }

  Future<int> update(Delegate delegate) async {
    final db = await instance.database;

    return db.update(
      tableDelegates,
      delegate.toJson(),
      where: '${DelegateFields.id} = ?',
      whereArgs: [delegate.id],
    );
  }

  Future<int> delete(int id) async {
    final db = await instance.database;

    return await db.delete(
      tableDelegates,
      where: '${DelegateFields.id} = ?',
      whereArgs: [id],
    );
  }

  Future close() async {
    final db = await instance.database;
    db.close();
  }
}
