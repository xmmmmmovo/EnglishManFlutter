import 'package:auto_route/auto_route_annotations.dart';
import 'package:flutter/material.dart';
import 'package:zzdocflutter/pages/application/account/mybookmark.dart';
import 'package:zzdocflutter/pages/application/account/remebered_word_detail.dart';
import 'package:zzdocflutter/pages/application/account/star_detail.dart';
import 'package:zzdocflutter/pages/application/application.dart';
import 'package:zzdocflutter/pages/application/bookmarks/bookmark_details.dart';
import 'package:zzdocflutter/pages/application/bookmarks/new_bookmark.dart';
import 'package:zzdocflutter/pages/application/category/ocr/camera_page.dart';
import 'package:zzdocflutter/pages/application/category/ocr/image_page.dart';
import 'package:zzdocflutter/pages/application/category/ocr/result_page.dart';
import 'package:zzdocflutter/pages/index/index.dart';
import 'package:zzdocflutter/pages/search/search_result.dart';
import 'package:zzdocflutter/pages/sign_in/sign_in.dart';
import 'package:zzdocflutter/pages/sign_up/sign_up.dart';
import 'package:zzdocflutter/pages/welcome/welcome.dart';

import 'auth_grard.dart';

Widget zoomInTransition(BuildContext context, Animation<double> animation,
    Animation<double> secondaryAnimation, Widget child) {
  // you get an animation object and a widget
  // make your own transition
  return ScaleTransition(scale: animation, child: child);
}

@MaterialAutoRouter(generateNavigationHelperExtension: true)
class $AppRouter {
  @initial
  IndexPage indexPageRoute;

  WelcomePage welcomePageRoute;

  SignInPage signInPageRoute;

  SignUpPage signUpPageRoute;

  @GuardedBy([AuthGuard])
  ApplicationPage applicationPageRoute;

  @GuardedBy([AuthGuard])
  SearchResult searchResultRoute;

  @GuardedBy([AuthGuard])
  BookMarkDetail bookMarkDetailRoute;

  @GuardedBy([AuthGuard])
  StarDetails starDetailsRoute;

  @GuardedBy([AuthGuard])
  RemeberedWordDetail remeberedWordDetailRoute;

  @GuardedBy([AuthGuard])
  NewBookMark newBookMarkRoute;

  @GuardedBy([AuthGuard])
  MyBookMark myBookMarkRoute;

  CameraPage cameraPageRoute;
  CropPage cropPageRoute;
  ResultPage resultPageRoute;
}
