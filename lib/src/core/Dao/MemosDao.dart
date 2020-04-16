
import 'package:simplememo/src/core/Dao/DaoImpl.dart';
import 'package:sqflite/sqflite.dart';
import 'dart:io';

import 'package:path/path.dart';
import 'package:path_provider/path_provider.dart';
import 'package:simplememo/src/core/Entity/MemoEntity.dart';
import 'package:sqflite/sqflite.dart';
import 'package:simplememo/src/core/Service/IService.dart';

const String MEMOS_TABLE = "Memos";

class MemosDao implements DaoImpl {

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
            is_bookmarked INTEGER NOT NULL DEFAULT 0,
            ordering INTEGER
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
    var id = await db.rawInsert(sql, [memo.writer, memo.title, memo.content]);
  }

  updateMemo(MemoEntity memo) async {
    try {
      final db = await database;
      String sql =
          'UPDATE ${MEMOS_TABLE} SET title = ?, content = ? WHERE  id = ?';
      var res = await db.rawUpdate(sql, [memo.title, memo.content, memo.id]);
      print("RESULT: ${res}");
      return res;
    } catch (error) {
      print(error);
    }
  }

  deleteMemo(MemoEntity memo) async {
    try {
      final db = await database;
      String sql = 'DELETE FROM ${MEMOS_TABLE} WHERE id = ?';
      var res = await db.rawDelete(sql, [memo.id]);
    } catch(error) {
      print(error);
    }
  }

  getIsBookmarked(MemoEntity memo) async {
    try {
      final db = await database;
      String sql = "SELECT is_bookmarked FROM ${MEMOS_TABLE} WHERE id = ?";
      var rawData = await db.rawQuery(sql, [memo.id]);
      return rawData.first["is_bookmarked"] == 1 ? true : false;
    } catch (error) {
      print(error);
    }
  }

  toggleMemo(MemoEntity memo) async {
    try {
      final db = await database;
      String sql = 'UPDATE ${MEMOS_TABLE} SET is_bookmarked = ? WHERE id = ?';
      await db.rawUpdate(sql, [memo.isBookmarked == true ? 0 : 1, memo.id]);
    } catch (error) {
      print(error);
    }
  }

  Future<MemoEntity> getMemoById(int id) async {
    final db = await database;

    String sql = "SELECT * FROM ${MEMOS_TABLE} WHERE id = ?";
    var result = await db.rawQuery(sql, [id]);
  }
}
