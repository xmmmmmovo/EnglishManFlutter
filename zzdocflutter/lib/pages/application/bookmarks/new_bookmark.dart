import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:zzdocflutter/common/apis/article.dart';
import 'package:zzdocflutter/common/entitys/article.dart';
import 'package:zzdocflutter/common/utils/utils.dart';
import 'package:zzdocflutter/common/values/values.dart';
import 'package:zzdocflutter/common/widgets/widgets.dart';
import 'package:zzdocflutter/global.dart';

class NewBookMark extends StatefulWidget {
  @override
  _NewBookMarkState createState() => _NewBookMarkState();
}

class _NewBookMarkState extends State<NewBookMark> {
  TextEditingController _titleController = TextEditingController();
  TextEditingController _contentController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: transparentAppBar(
        context: context,
        leading: IconButton(
          icon: Icon(
            Icons.arrow_back,
            color: AppColors.primaryText,
          ),
          onPressed: () {
            ExtendedNavigator.rootNavigator.pop();
          },
        ),
        actions: <Widget>[
          FlatButton(
            onPressed: () {
              uploadArticle(
                  context: context,
                  params: UploadArticleRequest(
                      title: _titleController.value.text,
                      userName: Global.profile.displayName,
                      content: _contentController.value.text));
              ExtendedNavigator.rootNavigator.pop();
            },
            child: Text("发布",
                style: TextStyle(fontFamily: "gengsha", fontSize: 18)),
          )
        ],
      ),
      body: Center(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            inputTextEdit(controller: _titleController, hintText: "标题"),
            Expanded(
              child: TextField(
                autofocus: false,
                controller: _contentController,
                keyboardType: TextInputType.text,
                decoration: InputDecoration(
                  hintText: "内容",
                  contentPadding: EdgeInsets.fromLTRB(20, 10, 0, 9),
                  border: InputBorder.none,
                ),
                style: TextStyle(
                  color: AppColors.primaryText,
                  fontFamily: "Avenir",
                  fontWeight: FontWeight.w400,
                  fontSize: duSetFontSize(18),
                ),
                maxLines: 999,
                autocorrect: false,
                // 自动纠正
                textInputAction: TextInputAction.newline,
              ),
            )
          ],
        ),
      ),
    );
  }
}
