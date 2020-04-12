import 'package:simplememo/src/core/Dao/IDao.dart';
import 'package:sqflite/sqflite.dart';
import 'dart:io';

import 'package:path/path.dart';
import 'package:path_provider/path_provider.dart';
import 'package:simplememo/src/core/Entity/MemoEntity.dart';
import 'package:sqflite/sqflite.dart';
import 'package:simplememo/src/core/Service/IService.dart';

const String MEMOS_TABLE = "Memos";

class MemosDao implements IDao {

  MemosDao._();
  static final MemosDao _db = MemosDao._();
  factory MemosDao() => _db;

  static Database _database;

  Future<Database> get database async {
    if (_database != null) return _database;
    _database = await initDB();
    return _database;
  }

  initDB() async {
    Directory documentDirectory = await getApplicationDocumentsDirectory();
    String path = join(documentDirectory.path, "simple_memo.db");

    return await openDatabase(path, version: 1, onCreate: (db, version) async {
      await db.execute('''
          CREATE TABLE ${MEMOS_TABLE}(
            id INTEGER PRIMARY KEY AUTOINCREMENT,
            writer TEXT,
            title TEXT,
            content TEXT,
            is_bookmarked INTEGER NOT NULL DEFAULT 0
          )
        ''');
    }, onUpgrade: (db, oldVersion, newVersion) {});
  }

  getAllMemos() async {
    final db = await database;
    String sql = "SELECT * FROM ${MEMOS_TABLE}";
    var rawData = await db.rawQuery(sql);
    return rawData;
  }

  insertMemo(MemoEntity memo) async {
    final db = await database;
    String sql = '''
      INSERT INTO ${MEMOS_TABLE} (writer, title, content)
      VALUES(?, ?, ?)
    ''';
    var id = await db.rawInsert(
        sql,
        [memo.writer, memo.title, memo.content]
    );
  }

  Future<MemoEntity> getMemoById(int id) async {
    final db = await database;

    String sql = "SELECT * FROM ${MEMOS_TABLE} WHERE id = ?" ;
    var result = await db.rawQuery(sql, [id]);
  }

}
