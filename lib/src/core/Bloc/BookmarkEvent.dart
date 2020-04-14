import 'package:equatable/equatable.dart';
import 'package:simplememo/src/core/Entity/Entity.dart';

abstract class BookmarkEvent extends Equatable {
  const BookmarkEvent() ;

  @override
  List<Object> get props => [];
}

class LoadBookmark extends BookmarkEvent {
  final MemoEntity memo;

  const LoadBookmark(this.memo);

  @override
  List<Object> get props => [memo];
}

class ToogleBookmark extends BookmarkEvent {
  final MemoEntity memo;

  const ToogleBookmark(this.memo);

  @override
  List<Object> get props => [memo];
}