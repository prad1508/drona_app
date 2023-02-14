import 'package:flutter/material.dart';
import 'package:flutter_localization/flutter_localization.dart';
import '../res/language/language.dart';
import '../res/widget/drawer_widget.dart';


class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  late ScrollController _scrollController;
  Color _textColor = Colors.white;
  static const kExpandedHeight = 100.0;
  //multi language support
  final FlutterLocalization _localization = FlutterLocalization.instance;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    _scrollController = ScrollController()
      ..addListener(() {
        setState(() {
          _textColor = _isSliverAppBarExpanded ? Colors.white : Colors.black;
        });
      });
  }

  bool get _isSliverAppBarExpanded {
    return _scrollController.hasClients &&
        _scrollController.offset > kExpandedHeight - kToolbarHeight;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: const DrawerWidget(),
      body: MaterialApp(
          supportedLocales: _localization.supportedLocales,
          localizationsDelegates: _localization.localizationsDelegates,
          debugShowCheckedModeBanner: false,
          home: SafeArea(
            child: CustomScrollView(
              controller: _scrollController,
              slivers: <Widget>[
                SliverAppBar(
                  snap: false,
                  pinned: true,
                  floating: false,
                  centerTitle: true,
                  title: _isSliverAppBarExpanded
                      ? Text("Neoenergy ⚡",
                          style: TextStyle(
                            color: Color.fromARGB(255, 255, 255, 255),
                            fontSize: 16.0,
                          ))
                      : null,
                  flexibleSpace: _isSliverAppBarExpanded
                      ? null
                      : FlexibleSpaceBar(
                          background: Image.asset(
                          "assets/images/login2.png",
                          fit: BoxFit.contain,
                        )),
                  expandedHeight: 120,
                  backgroundColor: Colors.black,
                  actions: <Widget>[
                    IconButton(
                      icon: const Icon(Icons.share),
                      tooltip: 'Share',
                      onPressed: () {},
                    ),
                  ],
                ),
                SliverList(
                  delegate: SliverChildBuilderDelegate(
                    (context, index) => Material(
                      child: Container(
                                    height: 700,
                                    decoration: const BoxDecoration(
                                       
                                                ),
                                    child:  Text('Current language is: ${_localization.getLanguageName()} ${AppLocale.title.getString(context)}', style: Theme.of(context).textTheme.titleLarge,),
                                  ),
                    ),
                    childCount: 1,
                  ),
                )
              ],
            ),
          )),
    );
  }
}
