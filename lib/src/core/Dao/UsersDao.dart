import 'package:simplememo/src/core/Dao/IDao.dart';

class UsersDao implements IDao {

  UsersDao._();
  static final UsersDao _db = UsersDao._();
  factory UsersDao() => _db;
}