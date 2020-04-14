abstract class BookmarkState {
  const BookmarkState();

  @override
  List<Object> get props => [];
}

class BookmarkUnloaded extends BookmarkState {

}

class BookmarkLoadSuccess extends BookmarkState {
  final bool isBookmarked;

  const BookmarkLoadSuccess({
    this.isBookmarked
});
}

class BookmarkLoaded extends BookmarkState {

}

class BookmarkToggleSuccess extends BookmarkState {
  final bool isBookmarked;

  const BookmarkToggleSuccess({
    this.isBookmarked
  });

}
