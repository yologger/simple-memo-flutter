import './Entity.dart';

class MemoEntity implements Entity {

  int _id;
  String _writer;
  String _title;
  String _content;
  bool _isBookMarked;

  get id => _id;
  set id(value) => _id = value;

  get writer => _writer;
  set writer(value) => _writer = value;

  get title => _title;
  set title(value) => _title = value;

  get content => _content;
  set content(value) => _content = value;

  get isBookMarked => _isBookMarked;
  set isBookMarked(value) => _isBookMarked = value;


  MemoEntity(this._id, this._writer, this._title, this._content, this._isBookMarked): super();
}