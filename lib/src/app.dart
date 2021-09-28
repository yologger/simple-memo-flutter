import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:simplememo/src/core/Bloc/Bloc.dart';
import 'package:simplememo/src/core/Bloc/EditBloc.dart';
import 'package:simplememo/src/core/Bloc/EditEvent.dart';
import 'package:simplememo/src/ui/screen/edit_screen.dart';
import 'package:simplememo/src/ui/screen/secret_screen.dart';
import 'package:simplememo/src/ui/screen/trash_screen.dart';
import 'package:simplememo/src/ui/screen/remove_screen.dart';
import 'ui/screen/main_screen.dart';
import 'ui/screen/bookmark_screen.dart';
import 'ui/screen/search_screen.dart';
import 'ui/theme/light/theme.dart';

class App extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocProvider<MemoBloc>(
        create: (context) => MemoBloc()..add(LoadMemos()),
        child: MaterialApp(
          title: 'Simple Memo',
          theme: buildTheme(),
          home: TabBarController(),
        ));
  }
}

class TabBarController extends StatelessWidget {
  const TabBarController({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
        length: 2,
        child: Scaffold(
          appBar: _buildAppBar(context),
          body: _buildBody(context),
        ));
  }

  Widget _buildAppBar(BuildContext context) {
    return AppBar(
      leading: IconButton(
        icon: Icon(Icons.search, color: Colors.white),
        onPressed: () {
          Navigator.push(
              context, MaterialPageRoute(builder: (context) => SearchScreen()));
        },
      ),
      actions: <Widget>[
        IconButton(
          icon: Icon(Icons.reorder, color: Colors.white),
          onPressed: () {
            MemoBloc memoBloc = BlocProvider.of<MemoBloc>(context);
            Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => BlocProvider<EditBloc>(
                    create: (BuildContext context) => EditBloc(memoBloc: memoBloc)..add(LoadAllMemos()),
                    child: EditScreen()
                ))
            );
          },
        ),
        IconButton(
          icon: Icon(Icons.delete, color: Colors.white),
          onPressed: () {
            MemoBloc memoBloc = BlocProvider.of<MemoBloc>(context);
            Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => BlocProvider<TrashBloc>(
                  create: (BuildContext context) => TrashBloc(memoBloc: memoBloc)..add(LoadMemosFromTrash()),
                  child: TrashScreen()
                ))
            );
          },
        ),
      ],
      bottom: TabBar(tabs: <Widget>[
        Tab(icon: Icon(Icons.home), text: 'Home'),
        Tab(icon: Icon(Icons.lock), text: 'Secret'),
      ]),
    );
  }

  Widget _buildBody(BuildContext context) {
    return TabBarView(
      children: <Widget>[
        MainScreen(),
        SecretScreen(),
      ],
    );
  }
}
