import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:zzdocflutter/common/router/router.gr.dart';
import 'package:zzdocflutter/common/utils/utils.dart';
import 'package:zzdocflutter/common/values/values.dart';
import 'package:zzdocflutter/common/widgets/widgets.dart';

import 'account/account.dart';
import 'bookmarks/bookmarks.dart';
import 'category/category.dart';
import 'main/main.dart';

class ApplicationPage extends StatefulWidget {
  final idx;

  ApplicationPage({Key key, this.idx = 0}) : super(key: key);

  @override
  _ApplicationPageState createState() => _ApplicationPageState();
}

class _ApplicationPageState extends State<ApplicationPage>
    with SingleTickerProviderStateMixin {
  // 当前 tab 页码
  int _page = 0;

  // tab 页标题
  final List<String> _tabTitles = ['主页面', '翻译', '动态', '我的'];

  // 页控制器
  PageController _pageController;

  // 底部导航项目
  final List<BottomNavigationBarItem> _bottomTabs = <BottomNavigationBarItem>[
    new BottomNavigationBarItem(
      icon: Icon(
        Iconfont.home,
        color: AppColors.tabBarElement,
      ),
      activeIcon: Icon(
        Iconfont.home,
        color: AppColors.secondaryElementText,
      ),
      title: Text('主页'),
      backgroundColor: AppColors.primaryBackground,
    ),
    new BottomNavigationBarItem(
      icon: Icon(
        Iconfont.grid,
        color: AppColors.tabBarElement,
      ),
      activeIcon: Icon(
        Iconfont.grid,
        color: AppColors.secondaryElementText,
      ),
      title: Text('翻译'),
      backgroundColor: AppColors.primaryBackground,
    ),
    new BottomNavigationBarItem(
      icon: Icon(
        Iconfont.tag,
        color: AppColors.tabBarElement,
      ),
      activeIcon: Icon(
        Iconfont.tag,
        color: AppColors.secondaryElementText,
      ),
      title: Text('动态'),
      backgroundColor: AppColors.primaryBackground,
    ),
    new BottomNavigationBarItem(
      icon: Icon(
        Iconfont.me,
        color: AppColors.tabBarElement,
      ),
      activeIcon: Icon(
        Iconfont.me,
        color: AppColors.secondaryElementText,
      ),
      title: Text('我的'),
      backgroundColor: AppColors.primaryBackground,
    ),
  ];

  // tab栏动画
  void _handleNavBarTap(int index) {
    _pageController.animateToPage(index,
        duration: const Duration(milliseconds: 200), curve: Curves.ease);
  }

  // tab栏页码切换
  void _handlePageChanged(int page) {
    setState(() {
      this._page = page;
    });
  }

  @override
  void initState() {
    super.initState();
    if (widget.idx != null) {
      this._page = widget.idx;
    }
    _pageController = new PageController(initialPage: this._page);
  }

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  // 顶部导航
  Widget _buildAppBar() {
    return transparentAppBar(
        context: context,
        title: Text(
          _tabTitles[_page],
          style: TextStyle(
            color: AppColors.primaryText,
            fontFamily: 'gengsha',
            fontSize: duSetFontSize(18.0),
            fontWeight: FontWeight.w600,
          ),
        ),
        actions: <Widget>[
          IconButton(
            icon: Icon(
              Icons.search,
              color: AppColors.primaryText,
            ),
            onPressed: () {
              ExtendedNavigator.rootNavigator
                  .pushNamed(Routes.searchResultRoute);
            },
          )
        ]);
  }

  // 内容页
  Widget _buildPageView() {
    return PageView(
      physics: NeverScrollableScrollPhysics(),
      children: <Widget>[
        MainPage(),
        CategoryPage(),
        BookmarksPage(),
        AccountPage(),
      ],
      controller: _pageController,
      onPageChanged: _handlePageChanged,
    );
  }

  // 底部导航
  Widget _buildBottomNavigationBar() {
    return BottomNavigationBar(
      items: _bottomTabs,
      currentIndex: _page,
      // fixedColor: AppColors.primaryElement,
      type: BottomNavigationBarType.fixed,
      onTap: _handleNavBarTap,
      showSelectedLabels: true,
      showUnselectedLabels: true,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: _buildAppBar(),
      body: _buildPageView(),
      bottomNavigationBar: _buildBottomNavigationBar(),
      floatingActionButton: _page == 2
          ? FloatingActionButton(
              onPressed: () {
                ExtendedNavigator.rootNavigator
                    .pushNamed(Routes.newBookMarkRoute);
              },
              backgroundColor: AppColors.primaryBackground,
              child: Icon(Icons.add, color: Colors.black),
            )
          : null,
    );
  }
}
