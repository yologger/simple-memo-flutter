import './Bloc.dart';
import '../Entity/MemoEntity.dart';
import 'package:rxdart/rxdart.dart';

class MemosBloc implements Bloc {

  static List<MemoEntity> _memos = [
    MemoEntity(1, "Ronaldo", "title1", "content1", true),
    MemoEntity(2, "Benzema", "title2", "content2", false),
    MemoEntity(3, "Bale", "title3", "content3", true)
  ];

  BehaviorSubject<List<MemoEntity>> _streamController = BehaviorSubject<List<MemoEntity>>.seeded(_memos);

  get stream => _streamController.stream;

  addMemo(String title, String content) {
    MemoEntity new_memo = MemoEntity(
      4,
      "ronaldo",
      title,
      content,
      false,
    );
    _memos.add(new_memo);
    _streamController.sink.add(_memos);
  }

  removeMemo(int id) {
    int idx = _memos.indexWhere((memo) => memo.id == id);
    _memos.removeAt(idx);
    _streamController.sink.add(_memos);
  }

  updateMemo(int id, String title, String content) {
    int idx = _memos.indexWhere((memo) => memo.id == id);
    _memos[idx].title = title;
    _memos[idx].content = content;
    _streamController.sink.add(_memos);
  }

  reorderMemo(int oldIndex, int newIndex) {
    if (newIndex > oldIndex) {
      newIndex -= 1;
    }
    final MemoEntity memo = _memos.removeAt(oldIndex);
    _memos.insert(newIndex, memo);
    _streamController.sink.add(_memos);
  }

  toggleBookmark(int id) {
    int idx = _memos.indexWhere((memo) => memo.id == id);
    _memos[idx].isBookMarked = !_memos[idx].isBookMarked;
    _streamController.sink.add(_memos);
  }

  @override
  void dispose() {
    // TODO: implement dispose
    _streamController.close();
  }
}

var memosBloc = MemosBloc();