import 'package:equatable/equatable.dart';
import 'package:rxdart/rxdart.dart';
import 'package:simplememo/src/core/Entity/MemoEntity.dart';

abstract class MemoState  {
  const MemoState();

  @override
  List<Object> get props => [];
}

class MemosUnloaded extends MemoState {}

class LoadingState  extends MemoState {

}

class MemosLoadSuccess extends MemoState {
  final List<MemoEntity> memos;

  const MemosLoadSuccess({
    this.memos,
  });
}

class MemoCreateSuccess extends MemoState {
  final List<MemoEntity> memos;

  const MemoCreateSuccess({
    this.memos,
  });
}

class MemosLoadFailure extends MemoState {

}

class MemosReloadSuccess extends MemoState {
  final List<MemoEntity> memos;

  const MemosReloadSuccess({
    this.memos,
  });
}
class CreatedState extends MemoState {}

class ErrorState extends MemoState {}

// [State]
// MemoUninitialized
// MemoLoadInitial
// MemoLoadInProgress
// MemoLoadSuccess
// MemoLoadFailure

// MemoCreateInitial
// MemoCreateInProgress
// MemoCreateSuccess
// MemoCreateFailure
