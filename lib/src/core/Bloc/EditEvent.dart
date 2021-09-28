

import 'package:equatable/equatable.dart';
import 'package:simplememo/src/core/Entity/Entity.dart';

abstract class EditEvent extends Equatable {
  const EditEvent();

  @override
  List<Object> get props => [];
}

class LoadAllMemos extends EditEvent {}

class SwapMemos extends EditEvent {
  final MemoEntity memo1;
  final MemoEntity memo2;

  SwapMemos(this.memo1, this.memo2);

  @override
  List<Object> get props => [memo1, memo2];
}

class DeleteMemos extends EditEvent {
  final List<MemoEntity> memos;

  DeleteMemos(this.memos);

  @override
  List<Object> get props => [memos];
}
