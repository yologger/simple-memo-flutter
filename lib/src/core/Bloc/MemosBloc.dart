import 'dart:async';
import './Bloc.dart';
import '../Entity/MemoEntity.dart';
import 'package:rxdart/rxdart.dart';

class MemoBloc implements Bloc {

  static List<MemoEntity> _memos = [
    MemoEntity(1, "Ronaldo", "title1", "content1", true),
    MemoEntity(2, "Benzema", "title2", "content2", false),
    MemoEntity(3, "Bale", "title3", "content3", true)
  ];

  BehaviorSubject<List<MemoEntity>> _streamController = BehaviorSubject<List<MemoEntity>>.seeded(_memos);

  get stream => _streamController.stream;

  addMemo(String title, String content) {
    MemoEntity new_memo = MemoEntity(
      1,
      "ronaldo",
      title,
      content,
      false,
    );
    _memos.add(new_memo);
    _streamController.sink.add(_memos);
  }

  @override
  void dispose() {
    // TODO: implement dispose
    _streamController.close();
  }
}

var memoBloc = MemoBloc();