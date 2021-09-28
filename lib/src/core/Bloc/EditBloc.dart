import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:simplememo/src/core/Bloc/EditEvent.dart';
import 'package:simplememo/src/core/Bloc/EditState.dart';
import 'package:simplememo/src/core/Entity/Entity.dart';
import 'package:simplememo/src/core/Repository/MemoRepository.dart';

import 'Bloc.dart';

class EditBloc extends Bloc<EditEvent, EditState> {

  MemoRepository _repository;
  MemoBloc memoBloc;

  EditBloc({this.memoBloc}) {
    _repository = MemoRepository();
  }

  @override
  EditState get initialState => AllMemosUnloaded();

  @override
  Stream<EditState> mapEventToState(EditEvent event) async* {
    if (event is LoadAllMemos) {
      yield* _mapLoadAllMemosToState();
    } else if (event is SwapMemos) {
      yield* _mapSwapMemosToState(event);
    }
  }

  Stream<EditState> _mapLoadAllMemosToState() async* {
    List<MemoEntity> _memos;
    _memos = await _repository.loadMemos();
    yield LoadAllMemosSuccess(memos: _memos);
  }

  Stream<EditState> _mapSwapMemosToState(SwapMemos event) async* {
    await _repository.swapMemos(event.memo1, event.memo2);
    List<MemoEntity> _memos;
    _memos = await _repository.loadMemos();
    yield LoadAllMemosSuccess(memos: _memos);
    memoBloc.add(LoadMemos());
  }
}