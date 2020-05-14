
import 'package:simplememo/src/core/Entity/Entity.dart';

abstract class TrashState {
  const TrashState();

  @override
  List<Object> get props => [];
}

class MemosInTrashUnloaded extends TrashState {}

class LoadMemosFromTrashSuccess extends TrashState {
  final List<MemoEntity> memos;

  const LoadMemosFromTrashSuccess({this.memos});
}

class DeleteMemoFromTrashSuccess extends TrashState {}

class DeleteMemosFromTrashSuccess extends TrashState {}

class RecoverMemoFromTrashSuccess extends TrashState {}

class RecoverMemosFromTrashSuccess extends TrashState {}

class EmptyTrashSuccess extends TrashState {}