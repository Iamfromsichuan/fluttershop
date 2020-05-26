import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:shop/config/color.dart';
import 'package:shop/config/iconfont.dart';
import 'package:shop/config/index.dart';
import 'package:shop/pages/account/account.dart';
import 'package:shop/pages/bookmark/bookmark.dart';
import 'package:shop/pages/category/category.dart';
import 'package:shop/pages/main/main.dart';
import 'package:shop/widgets/app_bar.dart';

class ApplicationPage extends StatefulWidget {
  @override
  _ApplicationPageState createState() => _ApplicationPageState();
}

class _ApplicationPageState extends State<ApplicationPage>
    with SingleTickerProviderStateMixin {
  int _page = 0;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _pageController = new PageController(initialPage: this._page);
  }

  @override
  void dispose() {
    _pageController.dispose();

    super.dispose();
  }

  final List<String> _tabList = ["Welcome", "Cagagory", "Bookmarks", "Account"];

  PageController _pageController;
  final List<BottomNavigationBarItem> _bottomTabs = <BottomNavigationBarItem>[
    _buildItem(
      iconData: Iconfont.home,
      title: "main",
    ),
    _buildItem(
      iconData: Iconfont.grid,
      title: "category",
    ),
    _buildItem(
      iconData: Iconfont.tag,
      title: "tag",
    ),
    _buildItem(
      iconData: Iconfont.me,
      title: "my",
    ),
  ];

  static BottomNavigationBarItem _buildItem({
    @required IconData iconData,
    String title,
  }) {
    return BottomNavigationBarItem(
      icon: Icon(
        iconData,
        color: KColor.tabBarElement,
      ),
      activeIcon: Icon(
        iconData,
        color: KColor.secondaryElementText,
      ),
      title: Text(title),
      backgroundColor: KColor.primaryBackground,
    );
  }

  void _handleNavBarTap(int index) {
    _pageController.animateToPage(
      index,
      duration: const Duration(milliseconds: 200),
      curve: Curves.ease,
    );
  }

  void _handlePageChanged(int page) {
    setState(() {
      this._page = page;
    });
  }

  Widget _buildApp() {
    return appBar(
        context: context,
        title: Text(
          _tabList[_page],
          style: TextStyle(
            color: KColor.primaryText,
            fontWeight: FontWeight.w600,
            fontSize: setFont(18.0),
            fontFamily: KFont.Montserrat,
          ),
        ),
        actions: <Widget>[
          IconButton(
            icon: Icon(
              Icons.search,
              color: KColor.primaryText,
            ),
            onPressed: () {},
          ),
        ]);
  }

  Widget _buildPageView() {
    return PageView(
      physics: NeverScrollableScrollPhysics(),
      children: <Widget>[
        MainPage(),
        CategoryPage(),
        Bookmark(),
        AccountPage(),
      ],
      controller: _pageController,
      onPageChanged: _handlePageChanged,
    );
  }

  Widget _buildBottomNavigationBar() {
    return BottomNavigationBar(
      items: _bottomTabs,
      currentIndex: _page,
      type: BottomNavigationBarType.fixed,
      onTap: _handleNavBarTap,
      showSelectedLabels: false,
      showUnselectedLabels: false,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: _buildApp(),
      body: _buildPageView(),
      bottomNavigationBar: _buildBottomNavigationBar(),
    );
  }
}
