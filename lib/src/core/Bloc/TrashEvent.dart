import 'package:equatable/equatable.dart';
import 'package:simplememo/src/core/Entity/Entity.dart';

abstract class TrashEvent extends Equatable {
  const TrashEvent();

  @override
  List<Object> get props => [];
}

class LoadMemosFromTrash extends TrashEvent {}

class DeleteMemoFromTrash extends TrashEvent {}

class DeleteMemosFromTrash extends TrashEvent {

  final List<MemoEntity> memos;

  const DeleteMemosFromTrash(this.memos);

  @override
  List<Object> get props => [memos];
}

class RestoreMemoFromTrash extends TrashEvent {}

class RestoreMemosFromTrash extends TrashEvent {

  final List<MemoEntity> memos;

  const RestoreMemosFromTrash(this.memos);

  @override
  List<Object> get props => [memos];}

class EmptyTrash extends TrashEvent {}
