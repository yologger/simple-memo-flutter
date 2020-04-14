import 'package:simplememo/src/core/Entity/EntityImpl.dart';

import './Entity.dart';

class MemoEntity implements EntityImpl {

  int _id;
  String _writer;
  String _title;
  String _content;
  bool _isBookmarked;

  get id => _id;
  set id(value) => _id = value;

  get writer => _writer;
  set writer(value) => _writer = value;

  get title => _title;
  set title(value) => _title = value;

  get content => _content;
  set content(value) => _content = value;

  get isBookmarked => _isBookmarked;
  set isBookmarked(value) => _isBookmarked = value;

  MemoEntity({
    int id,
    String writer,
    String title,
    String content,
    bool isBookmarked = false
  }):
    _id = id,
    _writer = writer,
    _title = title,
    _content = content,
    _isBookmarked = isBookmarked;
}