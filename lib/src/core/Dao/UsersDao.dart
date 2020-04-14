import 'package:simplememo/src/core/Dao/DaoImpl.dart';

class UsersDao implements DaoImpl {

  UsersDao._();
  static final UsersDao _db = UsersDao._();
  factory UsersDao() => _db;
}