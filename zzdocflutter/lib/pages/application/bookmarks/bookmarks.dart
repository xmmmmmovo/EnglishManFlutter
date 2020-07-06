import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_easyrefresh/easy_refresh.dart';
import 'package:flutter_easyrefresh/material_footer.dart';
import 'package:flutter_easyrefresh/material_header.dart';
import 'package:zzdocflutter/common/apis/article.dart';
import 'package:zzdocflutter/common/entitys/article.dart';
import 'package:zzdocflutter/common/router/router.gr.dart';
import 'package:zzdocflutter/common/utils/utils.dart';

class BookmarksPage extends StatefulWidget {
  BookmarksPage({Key key}) : super(key: key);

  @override
  _BookmarksPageState createState() => _BookmarksPageState();
}

class _BookmarksPageState extends State<BookmarksPage> {
  bool isPerformingRequest = false;
  List<Author> _items = [];
  int page = 1;
  int pages = 1;

  void fetchData() async {
    if (!isPerformingRequest && page <= pages) {
      setState(() {
        isPerformingRequest = true;
      });
      var tmp = await getArticleData(
          context: context, params: ArticlePageRequest(page: page, size: 20));

      setState(() {
        pages = tmp.pages;
        page = tmp.pageNum + 1;
        _items.addAll(tmp.list);
        isPerformingRequest = false;
      });
    }
  }

  initState() {
    super.initState();
    fetchData();
  }

  @override
  Widget build(BuildContext context) {
    return EasyRefresh.custom(
      header: MaterialHeader(),
      footer: MaterialFooter(),
      onRefresh: () async {
        page = 1;
        pages = 1;
        _items.clear();
        fetchData();
      },
      onLoad: () async {
        fetchData();
      },
      slivers: [
        SliverList(
          delegate: SliverChildBuilderDelegate(
            (content, index) {
              return _displayList(index);
            },
            childCount: _items.length,
          ),
        )
      ],
    );
  }

  Widget _displayList(int index) {
    return Container(
        padding: EdgeInsets.only(left: 2.0, bottom: 2.0, right: 2.0),
        child: Column(children: [
          Card(
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.all(Radius.circular(0.0))),
            margin: EdgeInsets.only(left: 8.0, right: 8.0),
            child: ListTile(
              leading: CircleAvatar(
                backgroundImage: NetworkImage(_items[index].avatar),
              ),
              title: Text(
                "主题:${_items[index].title}",
                style: TextStyle(fontFamily: "gengsha"),
              ),
              subtitle: Text(
                "发布者:${_items[index].name}",
                style: TextStyle(fontFamily: "gengsha"),
              ),
              onTap: () {
                ExtendedNavigator.rootNavigator.pushNamed(
                    Routes.bookMarkDetailRoute,
                    arguments: BookMarkDetailArguments(author: _items[index]));
              },
            ),
          ),
          SizedBox(height: duSetHeight(5)),
        ]));
  }
}
