import 'package:rxdart/rxdart.dart';
import 'package:simplememo/src/core/Entity/MemoEntity.dart';
import 'package:simplememo/src/core/Repository/RepositoryImpl.dart';

import 'package:simplememo/src/core/Service/DBService.dart';

class MemoRepository implements RepositoryImpl {

  DBService _dbService;
  static final MemoRepository _repository = MemoRepository._();
  List<MemoEntity> _cachedMemos;

  MemoRepository._() {
    _dbService = DBService();
  }
  factory MemoRepository() => _repository;

  Future<List<MemoEntity>> loadMemos() async {
    List<Map<String, dynamic>> rawData =  await _dbService.memosDao.getAllMemos();

    List<MemoEntity> memos = rawData.isNotEmpty ? rawData.map(
        (rawMemo) => MemoEntity(
          id: rawMemo["id"],
          writer: rawMemo["writer"],
          title: rawMemo["title"],
          content: rawMemo["content"],
          isBookmarked: rawMemo["is_bookmarked"] == 0 ? false : true,
        )
    ).toList() : [];

    _cachedMemos = memos;
    return _cachedMemos;
  }

  insertMemo(MemoEntity memo) async {
    await _dbService.memosDao.insertMemo(memo);
  }

  updateMemo(MemoEntity memo) async {
    await _dbService.memosDao.updateMemo(memo);
  }

  toggleMemo(MemoEntity memo) async {
    await _dbService.memosDao.toggleMemo(memo);
  }

  List<MemoEntity> getMemos() {
    print("getMemos()");
    return _cachedMemos;
  }

  getIsBookmarked(MemoEntity memo) async {
    return await _dbService.memosDao.getIsBookmarked(memo);
  }
//  DBService _dbService;
//  List<MemoEntity> _memos = [];
//  static PublishSubject<List<MemoEntity>> _subject;
//
//  MemoRepository._() {
//    _dbService = DBService();
//    _subject = PublishSubject<List<MemoEntity>>();
//  }
//
//  factory MemoRepository() => _repository;
//
//  getSubject() {
//    return _subject;
//  }
//
//  loadMemos() async {
//    print("loadMemos()");
//    List<MemoEntity> results = await _dbService.memosDao.getAllMemos();
//    _memos = results;
//    _subject.sink.add(results);
//  }
//
//
//  createMemo(MemoEntity memo) async {
//    print("createMemo()");
//    await _dbService.memosDao.insertMemo(memo);
//    _memos.add(memo);
//    _subject.sink.add(_memos);
//  }
//
//
//  getAllMemos() async {
//    List<MemoEntity> memos = await _dbService.memosDao.getAllMemos();
//    return Stream.fromIterable(memos);
////    stream.sink.add(results);
////    return stream;
//  }
//
//  getMemos(int startIndex, int limit) {
//
//  }
//
//
//  saveMemos(List<MemoEntity> memos) async {
//
//  }
//
//
//  getMemoById(int id) async {
//    List<MemoEntity> memos = await _dbService.memosDao.getMemoById(id);
//
//  }

}