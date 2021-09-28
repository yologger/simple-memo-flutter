// import 'package:bloc/bloc.dart';
import 'dart:async';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:rxdart/rxdart.dart';
import 'package:simplememo/src/core/Bloc/BookmarkState.dart';
import 'package:simplememo/src/core/Entity/MemoEntity.dart';
import 'package:simplememo/src/core/Repository/MemoRepository.dart';

import 'package:simplememo/src/core/Bloc/MemoEvent.dart';
import 'package:simplememo/src/core/Bloc/MemoState.dart';

import 'BookmarkBloc.dart';

class MemoBloc extends Bloc<MemoEvent, MemoState> {

  MemoRepository _repository;

  MemoBloc() {
    _repository = MemoRepository();
  }

  @override
  MemoState get initialState => MemosUnloaded();

  @override
  Stream<MemoState> mapEventToState(MemoEvent event) async* {
    if (event is LoadMemos) {
      yield* _mapLoadMemosToState();
    } else if (event is CreateMemo) {
      yield* _mapCreateMemoToState(event);
    } else if (event is UpdateMemo) {
      yield* _mapUpdateMemoToState(event);
    } else if (event is DeleteMemo) {
      yield* _mapDeleteMemoToState(event);
//    } else if (event is SwapMemos) {
//      yield* _mapSwapMemosToState(event);
    }
  }
//
//  Stream<MemoState> _mapMoveMemoToTrashToState(DeleteMemo event) async*{
//    List<MemoEntity> _memos;
//    await _repository.moveMemoToTrash(event.memo);
//    // await _repository.deleteMemo(event.memo);
//    _memos = await _repository.loadMemos();
//    yield LoadMemosSuccess(memos: _memos);
//  }

  Stream<MemoState> _mapDeleteMemoToState(DeleteMemo event) async* {
    List<MemoEntity> _memos;
    await _repository.deleteMemo(event.memo);
    _memos = await _repository.loadMemos();
    yield LoadMemosSuccess(memos: _memos);
  }

//  Stream<MemoState> _mapSwapMemosToState(SwapMemos event) async* {
//    List<MemoEntity> _memos;
//    _memos = await _repository.loadMemos();
//    yield LoadMemosSuccess(memos: _memos);
//  }

  Stream<MemoState> _mapLoadMemosToState() async* {
    List<MemoEntity> _memos;
    _memos = await _repository.loadMemos();
    yield LoadMemosSuccess(memos: _memos);
  }

  Stream<MemoState> _mapCreateMemoToState(CreateMemo event) async* {
    List<MemoEntity> _memos;
    await _repository.insertMemo(event.memoEntity);
    _memos = await _repository.loadMemos();
    yield LoadMemosSuccess(memos: _memos);
  }

  Stream<MemoState> _mapUpdateMemoToState(UpdateMemo event) async* {
    List<MemoEntity> _memos;
    await _repository.updateMemo(event.memo);
    _memos = await _repository.loadMemos();
    yield LoadMemosSuccess(memos: _memos);
  }


  @override
  Future<void> close() {
    return super.close();
  }
}

