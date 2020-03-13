import 'package:fluro/fluro.dart';
import 'package:flutter/material.dart';
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

  static void configRoutes(MyRouter router) {
    _router = router;

    defineRoute(index, handler: IndexPage.handler());
    defineRoute(webview, handler: WebviewPage.handler());
  }

  static defineRoute(
    String routePath,
    {
      Handler handler,
      TransitionType transitionType = TransitionType.native
    }
  ) {
    _router.define(routePath, handler: handler, transitionType: transitionType);
  }
}
