import 'package:simplememo/src/core/Entity/Entity.dart';

abstract class EditState {
  const EditState();

  @override
  List<Object> get props => [];
}

class AllMemosUnloaded extends EditState {}

class LoadAllMemosSuccess extends EditState {
  final List<MemoEntity> memos;

  const LoadAllMemosSuccess({
    this.memos,
  });
}

class SwapMemosSuccess extends EditState {}

class DeleteMemosSuccess extends EditState {}
