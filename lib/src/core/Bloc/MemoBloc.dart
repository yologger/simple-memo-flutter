// import 'package:bloc/bloc.dart';
import 'dart:async';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:rxdart/rxdart.dart';
import 'package:simplememo/src/core/Entity/MemoEntity.dart';
import 'package:simplememo/src/core/Repository/MemoRepository.dart';

import 'package:simplememo/src/core/Bloc/MemoEvent.dart';
import 'package:simplememo/src/core/Bloc/MemoState.dart';

class MemoBloc extends Bloc<MemoEvent, MemoState> {
  MemoRepository _repository;
  PublishSubject<List<MemoEntity>> _subject;
  StreamSubscription<List<MemoEntity>> _subscription;

  MemoBloc() {
    _repository = MemoRepository();
  }

  List<MemoEntity> _memos = [];

  @override
  MemoState get initialState => MemosUnloaded();

  @override
  Stream<MemoState> mapEventToState(MemoEvent event) async* {
    if (event is LoadMemos) {
      yield* _mapLoadMemosToState();
    } else if (event is ReloadMemos) {
      yield* _mapReloadMemosToState(event);
    } else if (event is CreateMemo) {
      yield* _mapCreateMemoToState(event);
    } else if (event is DeleteMemo) {
      yield* _mapDeleteMemoToState(event);
    } else if (event is UpdateMemo) {
      yield* _mapUpdateMemoToState(event);
    }
  }

  Stream<MemoState> _mapLoadMemosToState() async* {
    List<MemoEntity> _memos;
    _memos = await _repository.loadMemos();
    yield MemosLoadSuccess(memos: _memos);
  }

  Stream<MemoState> _mapCreateMemoToState(CreateMemo event) async* {
    List<MemoEntity> _memos;
    await _repository.insertMemo(event.memoEntity);
    _memos = await _repository.loadMemos();
    print("LAST TITLE: ${_memos.last.title}"); // OK
    // yield MemoCreateSuccess(memoEntities: _memos);
    yield MemosLoadSuccess(memos: _memos);
  }

  Stream<MemoState> _mapReloadMemosToState(ReloadMemos event) async* {
    yield MemosLoadSuccess(memos: event.memos);
  }

  Stream<MemoState> _mapDeleteMemoToState(DeleteMemo event) async* {
    if (state is MemosLoadSuccess) {
      final updatedMemos = (state as MemosLoadSuccess)
          .memos
          .where((memo) => memo.id != event.memo.id)
          .toList();
      yield MemosLoadSuccess(memos: updatedMemos);
      _saveMemos(updatedMemos);
    }
  }

  Stream<MemoState> _mapUpdateMemoToState(UpdateMemo event) async* {
    if (state is MemosLoadSuccess) {
      final updatedMemos = (state as MemosLoadSuccess).memos.map((memo) {
        return memo.id == event.memo.id ? event.memo : memo;
      }).toList();
      yield MemosLoadSuccess(memos: updatedMemos);
      _saveMemos(updatedMemos);
    }
  }

  _saveMemos(List<MemoEntity> memos) {
    // return _repository.saveMemos(memos);
  }

  @override
  Future<void> close() {
    _subscription?.cancel();
    return super.close();
  }
}

//import 'package:simplememo/src/core/Repository/MemosRepository.dart';
//
//import './IBloc.dart';
//import '../Entity/MemoEntity.dart';
//import 'package:rxdart/rxdart.dart';
//

//
//class MemosBloc implements IBloc {
//
//  static MemosRepository _memosRepository = MemosRepository();
//
//  static List<MemoEntity> _memos = [
//    MemoEntity(id: 1, writer: "Ronaldo", title: "Title1", content: "Content1"),
//    MemoEntity(id: 2, writer: "Benzema", title: "Title2", content: "Content2", isBookmarked: true),
//    MemoEntity(id: 3, writer: "Kane", title: "Title3", content: "Content3", isBookmarked: true)
//  ];
//
//  static List<MemoEntity> _deletedMemos = [
//    MemoEntity(id: 1, writer: "Ronaldo", title: "Title1", content: "Content1"),
//    MemoEntity(id: 2, writer: "Benzema", title: "Title2", content: "Content2", isBookmarked: true),
//    MemoEntity(id: 3, writer: "Kane", title: "Title3", content: "Content3")
//  ];
//
//  static BehaviorSubject<List<MemoEntity>> _memoStreamController = BehaviorSubject<List<MemoEntity>>.seeded(_memos);
//  static BehaviorSubject<List<MemoEntity>> _deletedMemoStreamController = BehaviorSubject<List<MemoEntity>>.seeded(_deletedMemos);
//
//  get stream => _memoStreamController.stream;
//  get deletedStream => _deletedMemoStreamController.stream;
//
//  static Future<List<MemoEntity>> getAllMemos() async {
//    var results = await _memosRepository.getAllMemos();
//    _memoStreamController.sink.add(results);
//  }
//
//  createMemo(MemoEntity memo) {
//    _memosRepository.insertMemo(memo);
//    // _memos.add(new_memo);
//    // _memoStreamController.sink.add(_memos);
//  }
//
//  removeMemo(int id) {
//    int idx = _memos.indexWhere((memo) => memo.id == id);
//    MemoEntity deletedMemo = _memos.removeAt(idx);
//    _deletedMemos.add(deletedMemo);
//    _memoStreamController.sink.add(_memos);
//    _deletedMemoStreamController.sink.add(_deletedMemos);
//  }
//
//  removeMemoFromTrash(int id) {
//    int idx = _memos.indexWhere((memo) => memo.id == id);
//    MemoEntity deletedMemo = _memos.removeAt(idx);
//    _deletedMemos.add(deletedMemo);
//    _memoStreamController.sink.add(_memos);
//    _deletedMemoStreamController.sink.add(_deletedMemos);
//  }
//
//  updateMemo(int id, String title, String content) {
//    int idx = _memos.indexWhere((memo) => memo.id == id);
//    _memos[idx].title = title;
//    _memos[idx].content = content;
//    _memoStreamController.sink.add(_memos);
//  }
//
//  reorderMemo(int oldIndex, int newIndex) {
//    if (newIndex > oldIndex) {
//      newIndex -= 1;
//    }
//    final MemoEntity memo = _memos.removeAt(oldIndex);
//    _memos.insert(newIndex, memo);
//    _memoStreamController.sink.add(_memos);
//  }
//
//  toggleBookmark(int id) {
//    int idx = _memos.indexWhere((memo) => memo.id == id);
//    _memos[idx].isBookmarked = !_memos[idx].isBookmarked;
//    _memoStreamController.sink.add(_memos);
//  }
//
//  @override
//  void dispose() {
//    // TODO: implement dispose
//    _memoStreamController.close();
//    _deletedMemoStreamController.close();
//  }
//}
//
//var memosBloc = MemosBloc();
