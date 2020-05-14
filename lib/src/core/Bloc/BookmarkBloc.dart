
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:simplememo/src/core/Bloc/BookmarkEvent.dart';
import 'package:simplememo/src/core/Bloc/BookmarkState.dart';
import 'package:simplememo/src/core/Entity/Entity.dart';
import 'package:simplememo/src/core/Repository/MemoRepository.dart';

import 'Bloc.dart';

class BookmarkBloc extends Bloc<BookmarkEvent, BookmarkState> {

  MemoRepository _repository;
  MemoBloc memoBloc;
 
  BookmarkBloc({this.memoBloc}) {
    _repository = MemoRepository();
  }

  @override
  BookmarkState get initialState => BookmarkUnloaded();

  @override
  Stream<BookmarkState> mapEventToState(BookmarkEvent event) async*{
    if (event is LoadBookmark) {
      yield* _mapLoadBookmarkToState(event);
    } else if (event is ToogleBookmark) {
      yield* _mapToggleBookmarkToState(event);
    }
  }

  Stream<BookmarkState> _mapLoadBookmarkToState(LoadBookmark event) async* {
    bool isBookmarked = await _repository.getIsBookmarked(event.memo);
    yield BookmarkLoadSuccess(isBookmarked: isBookmarked);
  }

  Stream<BookmarkState> _mapToggleBookmarkToState(ToogleBookmark event) async* {
    await _repository.toggleMemo(event.memo);
    bool isBookmarked = await _repository.getIsBookmarked(event.memo);
    yield BookmarkToggleSuccess(isBookmarked: isBookmarked);
    memoBloc.add(LoadMemos());
  }
}