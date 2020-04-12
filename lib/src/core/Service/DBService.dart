import 'dart:io';

import 'package:path/path.dart';
import 'package:path_provider/path_provider.dart';
import 'package:simplememo/src/core/Dao/MemosDao.dart';
import 'package:simplememo/src/core/Dao/UsersDao.dart';
import 'package:simplememo/src/core/Entity/MemoEntity.dart';
import 'package:sqflite/sqflite.dart';
import 'package:simplememo/src/core/Service/IService.dart';

const String MEMOS_TABLE = "Memos";

// Service is a sum of DAOs.
class DBService implements IService {

  DBService._();
  static final DBService _dbService = DBService._();
  factory DBService() => _dbService;

  get memosDao => MemosDao();
  get usersDao => UsersDao();
}