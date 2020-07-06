import 'package:auto_route/auto_route.dart';
import 'package:easy_dialog/easy_dialog.dart';
import 'package:flutter/material.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:provider/provider.dart';
import 'package:speech_recognition/speech_recognition.dart';
import 'package:speech_to_text/speech_recognition_result.dart';
import 'package:translator/translator.dart';
import 'package:zzdocflutter/common/apis/apis.dart';
import 'package:zzdocflutter/common/entitys/entitys.dart';
import 'package:zzdocflutter/common/provider/provider.dart';
import 'package:zzdocflutter/common/router/router.gr.dart';
import 'package:zzdocflutter/common/utils/utils.dart';
import 'package:zzdocflutter/common/values/values.dart';
import 'package:zzdocflutter/common/widgets/widgets.dart';
import 'package:zzdocflutter/global.dart';
import 'package:speech_to_text/speech_to_text.dart' as stt;

import 'component/icon_page.dart';

Color primaryColor = Colors.blue[600];

class CategoryPage extends StatefulWidget {
  CategoryPage({Key key}) : super(key: key);

  @override
  _CategoryPageState createState() => _CategoryPageState();
}

class _CategoryPageState extends State<CategoryPage> {
  String _firstLanguage = '英语';
  String _secondLanguage = '中文';
  var textController = TextEditingController();

  final translator = GoogleTranslator();

  AppState appState;
  bool active = false;
  bool recActive = false;
  SpeechRecognition _speechRecognition;

  Future<void> _initSpeechToText() async {
    _speechRecognition = SpeechRecognition();
    _speechRecognition.setRecognitionResultHandler((text) {
      setState(() {
        textController.text = text;
      });
    });
  }

  initState() {
    super.initState();
    _initSpeechToText();
  }

  Widget _buildIndexBody() {
    return Container(
      height: 55.0,
      decoration: BoxDecoration(
          color: Colors.white,
          border: Border(
            bottom: BorderSide(
              width: 0.5,
              color: Colors.grey[500],
            ),
          )),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.start,
        children: <Widget>[
          Expanded(
            child: Material(
              color: Colors.white,
              child: InkWell(
                onTap: () {},
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Text(
                      this._firstLanguage,
                      style: TextStyle(color: primaryColor, fontSize: 20.0),
                    ),
                  ],
                ),
              ),
            ),
          ),
          Material(
              color: Colors.white,
              child: IconButton(
                icon: Icon(Icons.swap_horiz, color: primaryColor),
                onPressed: () {
                  // 切换数据
                  setState(() {
                    var tmp = _firstLanguage;
                    _firstLanguage = _secondLanguage;
                    _secondLanguage = tmp;
                  });
                },
              )),
          Expanded(
            child: Material(
              color: Colors.white,
              child: InkWell(
                onTap: () {},
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Text(
                      this._secondLanguage,
                      style: TextStyle(color: primaryColor, fontSize: 20.0),
                    ),
                  ],
                ),
              ),
            ),
          )
        ],
      ),
    );
  }

  Widget _buildText() {
    return Expanded(
      child: Container(
        height: MediaQuery.of(context).size.height - 20,
        padding:
            EdgeInsets.only(left: 18.0, right: 18.0, bottom: 20.0, top: 2.0),
        child: TextField(
          controller: textController,
          decoration:
              InputDecoration(border: InputBorder.none, hintText: '点击输入文本'),
          style: TextStyle(color: Colors.black, fontSize: 25.0),
          maxLines: 999,
          cursorColor: Colors.blue[500],
          cursorWidth: 2.0,
          textInputAction: TextInputAction.done,
        ),
      ),
    );
  }

  Widget _buildIcon() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: <Widget>[
        Container(
          width: 10,
        ),
        ActionButton(
          title: '相机',
          icon: Icons.camera_enhance,
          image: null,
          onPressed: () async {
            // TODO: OCR识别
            if (Global.isIOS == false &&
                await Permission.camera.isGranted == false) {
              await [Permission.camera].request();
            }
            if (await Permission.camera.isGranted == true) {
              ExtendedNavigator.rootNavigator
                  .pushNamed(Routes.cameraPageRoute)
                  .then((value) {
                final tmp = value as List;
                setState(() {
                  textController.text = tmp[1];
                });
              });
            }
          },
        ),
        ActionButton(
            title: '翻译',
            icon: Icons.play_arrow,
            image: null,
            onPressed: () async {
              if (textController.value.text.trim().length == 0) {
                toastInfo(msg: "请不要传入空值!");
                return;
              }
              final area = textController.value.text;
              final from = _firstLanguage == "英语" ? "en" : "zh-cn";
              final to = _secondLanguage == "中文" ? "zh-cn" : "en";
              var res = await translator.translate(area, from: from, to: to);
              setState(() {
                var t = Translate();
                t.title = area;
                t.subTitle = res;
                t.isCollection = false;
                appState.items.add(t);
                if (appState.items.length > 10) {
                  appState.items.removeAt(0);
                }
                var tt = TranslateListObject();
                tt.translateList = appState.items;
                StorageUtil().setJSON(STORAGE_TRANSLATION_RES_KEY, tt);
              });
            }),
        ActionButton(
          title: '语音',
          icon: Icons.keyboard_voice,
          image: null,
          onPressed: () async {
            if (Global.isIOS == false &&
                await Permission.microphone.isGranted == false) {
              await [Permission.microphone].request();
            }
            if (await Permission.microphone.isGranted == true) {
              setState(() {
                active = !active;
              });
            }
          },
        ),
        Container(
          width: 10,
        ),
      ],
    );
  }

  void stt(bool isActive) {
    if (isActive) {
      _speechRecognition.listen(locale: "en-US").then((value) => print(value));
    } else {
      _speechRecognition.stop();
    }
  }

  Widget _buildRecordWidget() {
    return RecordButton(
      isActive: recActive,
      onClick: (bool isActive) {
        setState(() {
          recActive = !isActive;
        });
        stt(!isActive);
      },
    );
  }

  void resultListener(SpeechRecognitionResult result) {
    print("${result.recognizedWords} - ${result.finalResult}");
  }

  Widget _buildTextField() {
    return Container(
        child: Card(
      elevation: 3,
      margin: EdgeInsets.all(0.0),
      child: Container(
        height: 200.0,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            _buildText(),
            _buildIcon(),
          ],
        ),
      ),
    ));
  }

  Widget _buildRecordPage() {
    return Expanded(
      child: ListView.builder(
        itemCount: appState.items.length,
        itemBuilder: (context, index) {
          return _displayList(index);
        },
      ),
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
            child: Container(
              padding: EdgeInsets.only(left: 15.0, top: 15.0, bottom: 15.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[_Flexible(index), _collection(index)],
              ),
            ),
          ),
          SizedBox(height: duSetHeight(5)),
        ]));
  }

  Widget _Flexible(int index) {
    return Flexible(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: <Widget>[
          Text(
            appState.items[index].title,
            style: Theme.of(context).textTheme.headline6,
          ),
          Text(appState.items[index].subTitle,
              style: TextStyle(color: Colors.grey[600], fontSize: 18.0)),
        ],
      ),
    );
  }

  Widget _collection(int index) {
    return IconButton(
      onPressed: () async {
        var id = 0;

        if (appState.items[index].isCollection) {
          deleteTranslateData(context: context, id: appState.items[index].id);
        } else {
          id = await uploadTranslateData(
              context: context,
              params: TranslateRequest(
                  username: Global.profile.displayName,
                  from: appState.items[index].title,
                  to: appState.items[index].subTitle));
        }
        appState.items[index].id = id;
        setState(() {
          appState.items[index].isCollection =
              !appState.items[index].isCollection;
          var tt = TranslateListObject();
          tt.translateList = appState.items;
          StorageUtil().setJSON(STORAGE_TRANSLATION_RES_KEY, tt);
        });
      },
      icon: Icon(
        appState.items[index].isCollection ? Icons.star : Icons.star_border,
        size: 25.0,
        color: appState.items[index].isCollection
            ? Colors.yellow[600]
            : Colors.grey,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    appState = Provider.of<AppState>(context);

    return Container(
      child: Column(
        children: <Widget>[
          _buildIndexBody(),
          _buildTextField(),
          active ? _buildRecordWidget() : Container(),
          Container(
            height: 10,
          ),
          _buildRecordPage(),
        ],
      ),
    );
  }
}
