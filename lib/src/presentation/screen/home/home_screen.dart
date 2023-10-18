import 'dart:developer';

import 'package:app_demo/src/presentation/screen/new_feed_screen/news_feed_screen.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen>
    with SingleTickerProviderStateMixin {
  late final TabController _tabController;
  late final ScrollController _scrollController;
  late final PageController _pageViewController;
  double? _expandedHeight;
  int _currentIndex = 0;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(
      initialIndex: _currentIndex,
      length: 5,
      vsync: this,
    );
    _scrollController = ScrollController();
    _pageViewController = PageController();
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  final pages = [
    const Page1(),
    const Page2(),
    const Page3(),
    const Page4(),
    const Page4(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white10,
      body: NestedScrollView(
        controller: _scrollController,
        headerSliverBuilder: (BuildContext context, bool innerBoxIsScrolled) {
          return <Widget>[
            SliverAppBar(
              backgroundColor: Colors.black,
              actions: _appBarAction(),
              title: _appBarTitle(),
              centerTitle: false,
              pinned: true,
              floating: true,
              forceElevated: innerBoxIsScrolled,
              stretch: false,
              bottom: TabBar(
                dividerColor: Colors.white,
                indicatorColor: Colors.white,
                onTap: (index) {
                  _currentIndex = index;
                  log('Current tab: $index');
                  log('Current index: $index');
                  _pageViewController.jumpToPage(index);
                  _onChangeTab();
                },
                tabs: _listTab(),
                controller: _tabController,
              ),
              expandedHeight: _expandedHeight,
            ),
          ];
        },
        body: PageView(
          controller: _pageViewController,
          onPageChanged: (index) {
            _currentIndex = index;
            log('Current page: $index');
            log('Current index: $index');
            _tabController.index = index;
            _onChangeTab();
          },
          children: [
            const NewsFeedScreen(),
            pages[1],
            pages[2],
            pages[3],
            pages[4],
          ],
        ),
      ),
    );
  }

  List<Widget> _listTab() {
    return const [
      Tab(icon: Icon(Icons.home_filled)),
      Tab(icon: Icon(Icons.work_rounded)),
      Tab(icon: Icon(Icons.widgets_rounded)),
      Tab(icon: Icon(Icons.person)),
      Tab(icon: Icon(Icons.menu)),
    ];
  }

  void _onChangeTab() {
    if (_currentIndex == 0) {
      setState(() {
        _expandedHeight = null;
        _scrollController.position.animateTo(0,
            duration: const Duration(milliseconds: 1), curve: Curves.linear);
      });
    } else {
      setState(() {
        _expandedHeight = 0;
      });
    }
  }

  List<Widget> _appBarAction() {
    return const [
      Padding(
        padding: EdgeInsets.only(right: 4.0),
        child: Icon(
          Icons.add_circle_outline,
        ),
      ),
      Padding(
        padding: EdgeInsets.only(right: 4.0),
        child: Icon(
          Icons.search,
        ),
      ),
      Padding(
        padding: EdgeInsets.only(right: 8.0),
        child: Icon(
          Icons.message_outlined,
        ),
      )
    ];
  }

  Text _appBarTitle() {
    return const Text(
      "FookBace",
      style: TextStyle(
        fontSize: 25,
        fontWeight: FontWeight.w600,
      ),
    );
  }
}

class Page1 extends StatelessWidget {
  const Page1({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      color: const Color(0xffC4DFCB),
      child: Center(
        child: Text(
          "Page Number 1",
          style: TextStyle(
            color: Colors.green[900],
            fontSize: 45,
            fontWeight: FontWeight.w500,
          ),
        ),
      ),
    );
  }
}

class Page2 extends StatelessWidget {
  const Page2({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      color: const Color(0xffC4DFCB),
      child: Center(
        child: Text(
          "Page Number 2",
          style: TextStyle(
            color: Colors.green[900],
            fontSize: 45,
            fontWeight: FontWeight.w500,
          ),
        ),
      ),
    );
  }
}

class Page3 extends StatelessWidget {
  const Page3({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      color: const Color(0xffC4DFCB),
      child: Center(
        child: Text(
          "Page Number 3",
          style: TextStyle(
            color: Colors.green[900],
            fontSize: 45,
            fontWeight: FontWeight.w500,
          ),
        ),
      ),
    );
  }
}

class Page4 extends StatelessWidget {
  const Page4({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      color: const Color(0xffC4DFCB),
      child: Center(
        child: Text(
          "Page Number 4",
          style: TextStyle(
            color: Colors.green[900],
            fontSize: 45,
            fontWeight: FontWeight.w500,
          ),
        ),
      ),
    );
  }
}
