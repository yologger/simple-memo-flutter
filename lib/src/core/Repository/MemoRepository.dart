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
    List<Map<String, dynamic>> rawData =
        await _dbService.memosDao.getAllMemos();

    List<MemoEntity> memos = rawData.isNotEmpty
        ? rawData
            .map((rawMemo) => MemoEntity(
                  id: rawMemo["id"],
                  writer: rawMemo["writer"],
                  title: rawMemo["title"],
                  content: rawMemo["content"],
                  isBookmarked: rawMemo["is_bookmarked"] == 0 ? false : true,
                ))
            .toList()
        : [];

    _cachedMemos = memos;
    return _cachedMemos;
  }

  Future<List<MemoEntity>> loadMemosFromTrash() async {
    List<Map<String, dynamic>> rawData =
        await _dbService.memosDao.getAllMemosFromTrash();

    List<MemoEntity> memos = rawData.isNotEmpty
        ? rawData
            .map((rawMemo) => MemoEntity(
                  id: rawMemo["id"],
                  writer: rawMemo["writer"],
                  title: rawMemo["title"],
                  content: rawMemo["content"],
                  isBookmarked: rawMemo["is_bookmarked"] == 0 ? false : true,
                ))
            .toList()
        : [];

    return memos;
  }

  insertMemo(MemoEntity memo) async {
    await _dbService.memosDao.insertMemo(memo);
  }

  updateMemo(MemoEntity memo) async {
    await _dbService.memosDao.updateMemo(memo);
  }

  deleteMemo(MemoEntity memo) async {
    await _dbService.memosDao.deleteMemo(memo);
  }

  deleteMemoFromTrash(MemoEntity memo) async {
    await _dbService.memosDao.deleteMemoFromTrash(memo);
  }

  toggleMemo(MemoEntity memo) async {
    await _dbService.memosDao.toggleMemo(memo);
  }

  List<MemoEntity> getMemos() {
    return _cachedMemos;
  }

  getIsBookmarked(MemoEntity memo) async {
    return await _dbService.memosDao.getIsBookmarked(memo);
  }

  moveMemoToTrash(MemoEntity memo) async {
    await _dbService.memosDao.moveMemoToTrash(memo);
  }

  moveMemosToTrash(List<MemoEntity> memos) async {
    for (MemoEntity memo in memos) {
      await _dbService.memosDao.moveMemoToTrash(memo);
    }
  }

  restoreMemoFromTrash(MemoEntity memo) async {
    await _dbService.memosDao.restoreMemoFromTrash(memo);
  }

  restoreMemosFromTrash(List<MemoEntity> memos) async {
    for (MemoEntity memo in memos) {
      await _dbService.memosDao.restoreMemosFromTrash(memo);
    }
  }
}
