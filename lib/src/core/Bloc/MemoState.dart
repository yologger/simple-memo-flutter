import 'package:simplememo/src/core/Entity/MemoEntity.dart';

abstract class MemoState {
  const MemoState();

  @override
  List<Object> get props => [];
}

class MemosUnloaded extends MemoState {}

class LoadMemosSuccess extends MemoState {
  final List<MemoEntity> memos;

  const LoadMemosSuccess({
    this.memos,
  });
}
class LoadMemosFailure extends MemoState {}

class LoadMemosInProgress extends MemoState {}

class CreateMemoSuccess extends MemoState {
  final List<MemoEntity> memos;

  const CreateMemoSuccess({
    this.memos,
  });
}