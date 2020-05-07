import 'package:fluro/fluro.dart';
import 'package:flutter/material.dart';
import 'package:keep_account/pages/detail/index.dart';
import 'package:keep_account/pages/index.dart';
import 'package:keep_account/pages/webview.dart';

class MyRouter extends Router {
  @override
  bool pop(BuildContext context) {
    if (Navigator.of(context).canPop()) {
      return this.pop(context);
    }
    return false;
  }
}

class Routes {
  static MyRouter _router;
  static String index = '/';
  static String webview = '/web';
  static String detail = '/detail';

  static void configRoutes(MyRouter router) {
    _router = router;

    defineRoute(index, handler: IndexPage.handler());
    defineRoute(webview, handler: WebviewPage.handler());
    defineRoute(detail, handler: BillDetailPage.handler());
  }

  static defineRoute(String routePath,
      {Handler handler,
      TransitionType transitionType = TransitionType.cupertino}) {
    _router.define(routePath, handler: handler, transitionType: transitionType);
  }
}
