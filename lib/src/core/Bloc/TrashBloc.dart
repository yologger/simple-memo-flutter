import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:simplememo/src/core/Bloc/bloc.dart';
import 'package:simplememo/src/core/Entity/Entity.dart';
import 'package:simplememo/src/core/Repository/MemoRepository.dart';

class TrashBloc extends Bloc<TrashEvent, TrashState> {

  MemoRepository _repository;
  MemoBloc memoBloc;

  TrashBloc({this.memoBloc}) {
    _repository = MemoRepository();
  }

  Future<List<MemoEntity>> get memos async {
    return await _repository.loadMemosFromTrash();
  }

  @override
  // TODO: implement initialState
  TrashState get initialState => MemosInTrashUnloaded();

  @override
  Stream<TrashState> mapEventToState(TrashEvent event) async* {
    if (event is LoadMemosFromTrash) {
      yield* _mapLoadMemosFromTrashToState();
    } else if (event is DeleteMemosFromTrash) {
      yield* _mapDeleteMemosFromTrashToState(event);
    } else if (event is RestoreMemosFromTrash) {
      yield* _mapRestoreMemosFromTrashToState(event);
    }
  }

  Stream<TrashState> _mapLoadMemosFromTrashToState() async* {
    List<MemoEntity> _memos;
    _memos = await _repository.loadMemosFromTrash();
    yield LoadMemosFromTrashSuccess(memos: _memos);
  }

  Stream<TrashState> _mapDeleteMemosFromTrashToState(DeleteMemosFromTrash event) async* {
    List<MemoEntity> _memos;
    _memos = event.memos;
    _memos.forEach((memo) async {
      await _repository.deleteMemoFromTrash(memo);
    });
    yield LoadMemosFromTrashSuccess(memos: _memos);
    memoBloc.add(LoadMemos());
  }

  Stream<TrashState> _mapRestoreMemosFromTrashToState(RestoreMemosFromTrash event) async* {
    List<MemoEntity> _memos;
    _memos = event.memos;
    _memos.forEach((memo) async {
      await _repository.restoreMemoFromTrash(memo);
    });
    yield LoadMemosFromTrashSuccess(memos: _memos);
    memoBloc.add(LoadMemos());
  }
}


