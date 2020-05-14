import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:simplememo/src/core/Bloc/Bloc.dart';
import 'package:simplememo/src/core/Entity/Entity.dart';
import 'package:simplememo/src/ui/theme/light/color.dart';

import 'detail_screen.dart';

class SearchScreen extends StatefulWidget {
  @override
  _SearchScreenState createState() => _SearchScreenState();
}

class _SearchScreenState extends State<SearchScreen> {

  TextEditingController _searchBarController;
  MemoBloc _memoBloc;

  List<MemoEntity> _memos;
  List<int> indexes = [];
  List<MemoEntity> _targetMemos;

  @override
  void initState() {
    super.initState();
    _memoBloc = BlocProvider.of<MemoBloc>(context);
    _searchBarController = TextEditingController();
    _searchBarController.addListener(_onSearchBarChanged);
    _memos = [];
    _targetMemos = [];
    _memoBloc.add(LoadMemos());
  }

  void _onSearchBarChanged() {
    indexes = [];
    _targetMemos = [];
    _memos.forEach((MemoEntity memo) {
      String target = _searchBarController.text.toLowerCase();
      if (memo.title.toString().toLowerCase().contains(target) ||
          memo.content.toString().toLowerCase().contains(target)) {
        indexes.add(_memos.indexOf(memo));
      }
    });

    indexes.forEach((index) {
      _targetMemos.add(_memos[index]);
      setState(() {
        _targetMemos = _targetMemos;
      });
    });
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    _searchBarController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(appBar: _buildAppBar(), body: _buildBody());
  }

  Widget _buildAppBar() {
    return AppBar(title: _buildSearchBar());
  }

  Widget _buildBody() {
    return BlocListener<MemoBloc, MemoState>(
      bloc: _memoBloc,
      listener: (context, state) {
        if (state is LoadMemosSuccess) {
          setState(() {
            _memos = state.memos;
          });
        }
      },
      child: _targetMemos.length == 0
          ? Center()
          : ListView.separated(
              itemBuilder: (context, index) => ListTile(
                    title: Text("${_targetMemos[index].title}"),
                    subtitle: Text("${_targetMemos[index].content}"),
                    onTap: () async {
                      MemoBloc memoBloc = BlocProvider.of<MemoBloc>(context);
                      await Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => BlocProvider<BookmarkBloc>(
                                    create: (BuildContext context) =>
                                        BookmarkBloc(memoBloc: memoBloc)
                                          ..add(LoadBookmark(
                                              _targetMemos[index])),
                                    child: DetailScreen(_targetMemos[index]),
                                  )));
                      _memoBloc.add(LoadMemos());
                    },
                  ),
              separatorBuilder: (context, index) => Divider(),
              itemCount: _targetMemos.length),
    );
  }

  Widget _buildSearchBar() {
    return TextField(
      controller: _searchBarController,
      cursorColor: AppColor.secondary,
      style: TextStyle(
        color: AppColor.onPrimary,
      ),
      autofocus: true,
      decoration: InputDecoration(
        hintText: "Search",
        border: InputBorder.none,
        hintStyle: TextStyle(color: Colors.white60),
        suffixIcon: IconButton(
          icon: Icon(
            Icons.cancel,
            color: Colors.white60,
          ),
          onPressed: () {
            _searchBarController.text = "";
            setState(() {
              _targetMemos = [];
            });
          },
        ),
      ),
    );
  }
}
