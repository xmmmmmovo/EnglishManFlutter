// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// AutoRouteGenerator
// **************************************************************************

import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:auto_route/auto_route.dart';
import 'package:zzdocflutter/pages/index/index.dart';
import 'package:zzdocflutter/pages/welcome/welcome.dart';
import 'package:zzdocflutter/pages/sign_in/sign_in.dart';
import 'package:zzdocflutter/pages/sign_up/sign_up.dart';
import 'package:zzdocflutter/pages/application/application.dart';
import 'package:zzdocflutter/common/router/auth_grard.dart';
import 'package:zzdocflutter/pages/search/search_result.dart';
import 'package:zzdocflutter/pages/application/bookmarks/bookmark_details.dart';
import 'package:zzdocflutter/common/entitys/article.dart';
import 'package:zzdocflutter/pages/application/account/star_detail.dart';
import 'package:zzdocflutter/pages/application/account/remebered_word_detail.dart';
import 'package:zzdocflutter/pages/application/bookmarks/new_bookmark.dart';
import 'package:zzdocflutter/pages/application/account/mybookmark.dart';
import 'package:zzdocflutter/pages/application/category/ocr/camera_page.dart';
import 'package:zzdocflutter/pages/application/category/ocr/image_page.dart';
import 'dart:ui';
import 'dart:ui' as ui;
import 'package:zzdocflutter/pages/application/category/ocr/result_page.dart';

abstract class Routes {
  static const indexPageRoute = '/';
  static const welcomePageRoute = '/welcome-page-route';
  static const signInPageRoute = '/sign-in-page-route';
  static const signUpPageRoute = '/sign-up-page-route';
  static const applicationPageRoute = '/application-page-route';
  static const searchResultRoute = '/search-result-route';
  static const bookMarkDetailRoute = '/book-mark-detail-route';
  static const starDetailsRoute = '/star-details-route';
  static const remeberedWordDetailRoute = '/remebered-word-detail-route';
  static const newBookMarkRoute = '/new-book-mark-route';
  static const myBookMarkRoute = '/my-book-mark-route';
  static const cameraPageRoute = '/camera-page-route';
  static const cropPageRoute = '/crop-page-route';
  static const resultPageRoute = '/result-page-route';
  static const all = {
    indexPageRoute,
    welcomePageRoute,
    signInPageRoute,
    signUpPageRoute,
    applicationPageRoute,
    searchResultRoute,
    bookMarkDetailRoute,
    starDetailsRoute,
    remeberedWordDetailRoute,
    newBookMarkRoute,
    myBookMarkRoute,
    cameraPageRoute,
    cropPageRoute,
    resultPageRoute,
  };
}

class AppRouter extends RouterBase {
  @override
  Set<String> get allRoutes => Routes.all;

  @override
  Map<String, List<Type>> get guardedRoutes => {
        Routes.applicationPageRoute: [AuthGuard],
        Routes.searchResultRoute: [AuthGuard],
        Routes.bookMarkDetailRoute: [AuthGuard],
        Routes.starDetailsRoute: [AuthGuard],
        Routes.remeberedWordDetailRoute: [AuthGuard],
        Routes.newBookMarkRoute: [AuthGuard],
        Routes.myBookMarkRoute: [AuthGuard],
      };

  @Deprecated('call ExtendedNavigator.ofRouter<Router>() directly')
  static ExtendedNavigatorState get navigator =>
      ExtendedNavigator.ofRouter<AppRouter>();

  @override
  Route<dynamic> onGenerateRoute(RouteSettings settings) {
    final args = settings.arguments;
    switch (settings.name) {
      case Routes.indexPageRoute:
        if (hasInvalidArgs<IndexPageArguments>(args)) {
          return misTypedArgsRoute<IndexPageArguments>(args);
        }
        final typedArgs = args as IndexPageArguments ?? IndexPageArguments();
        return MaterialPageRoute<dynamic>(
          builder: (context) => IndexPage(key: typedArgs.key),
          settings: settings,
        );
      case Routes.welcomePageRoute:
        if (hasInvalidArgs<WelcomePageArguments>(args)) {
          return misTypedArgsRoute<WelcomePageArguments>(args);
        }
        final typedArgs =
            args as WelcomePageArguments ?? WelcomePageArguments();
        return MaterialPageRoute<dynamic>(
          builder: (context) => WelcomePage(key: typedArgs.key),
          settings: settings,
        );
      case Routes.signInPageRoute:
        if (hasInvalidArgs<SignInPageArguments>(args)) {
          return misTypedArgsRoute<SignInPageArguments>(args);
        }
        final typedArgs = args as SignInPageArguments ?? SignInPageArguments();
        return MaterialPageRoute<dynamic>(
          builder: (context) => SignInPage(key: typedArgs.key),
          settings: settings,
        );
      case Routes.signUpPageRoute:
        if (hasInvalidArgs<SignUpPageArguments>(args)) {
          return misTypedArgsRoute<SignUpPageArguments>(args);
        }
        final typedArgs = args as SignUpPageArguments ?? SignUpPageArguments();
        return MaterialPageRoute<dynamic>(
          builder: (context) => SignUpPage(key: typedArgs.key),
          settings: settings,
        );
      case Routes.applicationPageRoute:
        if (hasInvalidArgs<ApplicationPageArguments>(args)) {
          return misTypedArgsRoute<ApplicationPageArguments>(args);
        }
        final typedArgs =
            args as ApplicationPageArguments ?? ApplicationPageArguments();
        return MaterialPageRoute<dynamic>(
          builder: (context) =>
              ApplicationPage(key: typedArgs.key, idx: typedArgs.idx),
          settings: settings,
        );
      case Routes.searchResultRoute:
        return MaterialPageRoute<dynamic>(
          builder: (context) => SearchResult(),
          settings: settings,
        );
      case Routes.bookMarkDetailRoute:
        if (hasInvalidArgs<BookMarkDetailArguments>(args, isRequired: true)) {
          return misTypedArgsRoute<BookMarkDetailArguments>(args);
        }
        final typedArgs = args as BookMarkDetailArguments;
        return MaterialPageRoute<dynamic>(
          builder: (context) => BookMarkDetail(typedArgs.author),
          settings: settings,
        );
      case Routes.starDetailsRoute:
        return MaterialPageRoute<dynamic>(
          builder: (context) => StarDetails(),
          settings: settings,
        );
      case Routes.remeberedWordDetailRoute:
        return MaterialPageRoute<dynamic>(
          builder: (context) => RemeberedWordDetail(),
          settings: settings,
        );
      case Routes.newBookMarkRoute:
        return MaterialPageRoute<dynamic>(
          builder: (context) => NewBookMark(),
          settings: settings,
        );
      case Routes.myBookMarkRoute:
        return MaterialPageRoute<dynamic>(
          builder: (context) => MyBookMark(),
          settings: settings,
        );
      case Routes.cameraPageRoute:
        if (hasInvalidArgs<CameraPageArguments>(args)) {
          return misTypedArgsRoute<CameraPageArguments>(args);
        }
        final typedArgs = args as CameraPageArguments ?? CameraPageArguments();
        return MaterialPageRoute<dynamic>(
          builder: (context) =>
              CameraPage(key: typedArgs.key, title: typedArgs.title),
          settings: settings,
        );
      case Routes.cropPageRoute:
        if (hasInvalidArgs<CropPageArguments>(args)) {
          return misTypedArgsRoute<CropPageArguments>(args);
        }
        final typedArgs = args as CropPageArguments ?? CropPageArguments();
        return MaterialPageRoute<dynamic>(
          builder: (context) => CropPage(
              key: typedArgs.key,
              title: typedArgs.title,
              image: typedArgs.image,
              imageInfo: typedArgs.imageInfo),
          settings: settings,
        );
      case Routes.resultPageRoute:
        if (hasInvalidArgs<ResultPageArguments>(args)) {
          return misTypedArgsRoute<ResultPageArguments>(args);
        }
        final typedArgs = args as ResultPageArguments ?? ResultPageArguments();
        return MaterialPageRoute<dynamic>(
          builder: (context) => ResultPage(
              key: typedArgs.key,
              title: typedArgs.title,
              image: typedArgs.image,
              ocrContent: typedArgs.ocrContent),
          settings: settings,
        );
      default:
        return unknownRoutePage(settings.name);
    }
  }
}

// *************************************************************************
// Arguments holder classes
// **************************************************************************

//IndexPage arguments holder class
class IndexPageArguments {
  final Key key;

  IndexPageArguments({this.key});
}

//WelcomePage arguments holder class
class WelcomePageArguments {
  final Key key;

  WelcomePageArguments({this.key});
}

//SignInPage arguments holder class
class SignInPageArguments {
  final Key key;

  SignInPageArguments({this.key});
}

//SignUpPage arguments holder class
class SignUpPageArguments {
  final Key key;

  SignUpPageArguments({this.key});
}

//ApplicationPage arguments holder class
class ApplicationPageArguments {
  final Key key;
  final dynamic idx;

  ApplicationPageArguments({this.key, this.idx = 0});
}

//BookMarkDetail arguments holder class
class BookMarkDetailArguments {
  final Author author;

  BookMarkDetailArguments({@required this.author});
}

//CameraPage arguments holder class
class CameraPageArguments {
  final Key key;
  final String title;

  CameraPageArguments({this.key, this.title});
}

//CropPage arguments holder class
class CropPageArguments {
  final Key key;
  final String title;
  final ui.Image image;
  final ImageInfo imageInfo;

  CropPageArguments({this.key, this.title, this.image, this.imageInfo});
}

//ResultPage arguments holder class
class ResultPageArguments {
  final Key key;
  final String title;
  final ui.Image image;
  final List<String> ocrContent;

  ResultPageArguments({this.key, this.title, this.image, this.ocrContent});
}

// *************************************************************************
// Navigation helper methods extension
// **************************************************************************

extension AppRouterNavigationHelperMethods on ExtendedNavigatorState {
  Future pushIndexPageRoute({
    Key key,
  }) =>
      pushNamed(
        Routes.indexPageRoute,
        arguments: IndexPageArguments(key: key),
      );

  Future pushWelcomePageRoute({
    Key key,
  }) =>
      pushNamed(
        Routes.welcomePageRoute,
        arguments: WelcomePageArguments(key: key),
      );

  Future pushSignInPageRoute({
    Key key,
  }) =>
      pushNamed(
        Routes.signInPageRoute,
        arguments: SignInPageArguments(key: key),
      );

  Future pushSignUpPageRoute({
    Key key,
  }) =>
      pushNamed(
        Routes.signUpPageRoute,
        arguments: SignUpPageArguments(key: key),
      );

  Future pushApplicationPageRoute(
          {Key key, dynamic idx = 0, OnNavigationRejected onReject}) =>
      pushNamed(
        Routes.applicationPageRoute,
        arguments: ApplicationPageArguments(key: key, idx: idx),
        onReject: onReject,
      );

  Future pushSearchResultRoute() => pushNamed(Routes.searchResultRoute);

  Future pushBookMarkDetailRoute(
          {@required Author author, OnNavigationRejected onReject}) =>
      pushNamed(
        Routes.bookMarkDetailRoute,
        arguments: BookMarkDetailArguments(author: author),
        onReject: onReject,
      );

  Future pushStarDetailsRoute() => pushNamed(Routes.starDetailsRoute);

  Future pushRemeberedWordDetailRoute() =>
      pushNamed(Routes.remeberedWordDetailRoute);

  Future pushNewBookMarkRoute() => pushNamed(Routes.newBookMarkRoute);

  Future pushMyBookMarkRoute() => pushNamed(Routes.myBookMarkRoute);

  Future pushCameraPageRoute({
    Key key,
    String title,
  }) =>
      pushNamed(
        Routes.cameraPageRoute,
        arguments: CameraPageArguments(key: key, title: title),
      );

  Future pushCropPageRoute({
    Key key,
    String title,
    ui.Image image,
    ImageInfo imageInfo,
  }) =>
      pushNamed(
        Routes.cropPageRoute,
        arguments: CropPageArguments(
            key: key, title: title, image: image, imageInfo: imageInfo),
      );

  Future pushResultPageRoute({
    Key key,
    String title,
    ui.Image image,
    List<String> ocrContent,
  }) =>
      pushNamed(
        Routes.resultPageRoute,
        arguments: ResultPageArguments(
            key: key, title: title, image: image, ocrContent: ocrContent),
      );
}
