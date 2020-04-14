import 'package:equatable/equatable.dart';
import 'package:simplememo/src/core/Bloc/Bloc.dart';
import 'package:simplememo/src/core/Entity/MemoEntity.dart';

abstract class MemoEvent extends Equatable {
  const MemoEvent();

  @override
  List<Object> get props => [];
}

class LoadMemos extends MemoEvent {

}

class CreateMemo extends MemoEvent {
  final MemoEntity memoEntity;

  const CreateMemo(this.memoEntity);

  @override
  List<Object> get props => [memoEntity];
}

class RemoveEvent extends MemoEvent {

}

class ReloadMemos extends MemoEvent {

  final List<MemoEntity> memos;

  const ReloadMemos(this.memos);

  @override
  List<Object> get props => [memos];
}

class DeleteMemo extends MemoEvent {
  final MemoEntity memo;

  const DeleteMemo(this.memo);

  @override
  List<Object> get props => [memo];

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

// {EVENT}
// LoadMemos
// UpdateMemos
//