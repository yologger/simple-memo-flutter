import 'package:equatable/equatable.dart';
import 'package:simplememo/src/core/Bloc/Bloc.dart';
import 'package:simplememo/src/core/Entity/MemoEntity.dart';

abstract class MemoEvent extends Equatable {
  const MemoEvent();

  @override
  List<Object> get props => [];
}

class LoadMemos extends MemoEvent {}

class CreateMemo extends MemoEvent {
  final MemoEntity memoEntity;

  const CreateMemo(this.memoEntity);

  @override
  List<Object> get props => [memoEntity];
}

class DeleteMemo extends MemoEvent {
  final MemoEntity memo;

  const DeleteMemo(this.memo);

  @override
  List<Object> get props => [memo];
}

class DeleteMemos extends MemoEvent {
  final List<MemoEntity> memos;

  const DeleteMemos(this.memos);

  @override
  List<Object> get props => [memos];
}

class UpdateMemo extends MemoEvent {
  final MemoEntity memo;

  const UpdateMemo(this.memo);

  @override
  List<Object> get props => [memo];
}

class ToggleBookmark extends MemoEvent {
  final MemoEntity memo;

  const ToggleBookmark(this.memo);

  @override
  List<Object> get props => [memo];
}

//
//class SwapMemos extends MemoEvent {
//  final MemoEntity memo1;
//  final MemoEntity memo2;
//
//  SwapMemos(this.memo1, this.memo2);
//
//  @override
//  List<Object> get props => [memo1, memo2];
//}
