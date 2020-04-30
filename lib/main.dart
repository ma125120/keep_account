import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:keep_account/components/const.dart';
import 'dart:io';
import 'router/index.dart';
import 'router/watch.dart';
import 'package:bot_toast/bot_toast.dart';
import 'common/index.dart';

void main() {
  runApp(MyApp());
  // 如果是Android设备，就执行下面的代码实现沉浸式状态栏
  if (Platform.isAndroid) {
    // 设置系统的沉浸式UI效果--把状态栏变成透明
    SystemUiOverlayStyle systemUiOverlayStyle = SystemUiOverlayStyle(
      statusBarColor: Colors.transparent,
    );
    // 应用这个效果
    SystemChrome.setSystemUIOverlayStyle(systemUiOverlayStyle);
  }
}

class MyApp extends StatefulWidget {
  // MyApp() {
  //   final router = MyRouter();
  //   Routes.configRoutes(router);

  //   App.init();
  //   App.router = router;

  //   API.init();
  // }

  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  void initState() {
    super.initState();
    init();
  }

  init() {
    final router = MyRouter();
    Routes.configRoutes(router);

    App.init();
    App.router = router;

    API.init();
  }

  @override
  Widget build(BuildContext context) {
    final primary = MyConst.primary;

    Widget app = MaterialApp(
      navigatorObservers: [
        BotToastNavigatorObserver(),
        MyWatchRoute(),
      ],
      onGenerateRoute: App.router.generator,
      initialRoute: Routes.index,
      title: 'Flutter Demo',
      theme: ThemeData(
          cupertinoOverrideTheme: CupertinoThemeData(
              primaryColor: primary, textTheme: CupertinoTextThemeData()),
          tabBarTheme: TabBarTheme(
            labelColor: primary,
            // indicator: BoxDecoration(
            //     border: Border(bottom: BorderSide(color: primary))),
            indicatorSize: TabBarIndicatorSize.label,
            unselectedLabelColor: MyConst.highTextColor,
          ),
          iconTheme: IconThemeData(
              color: Theme.of(context).primaryColor, size: MyConst.fontSize),

          /// [TextField] decoration 配置
          inputDecorationTheme: InputDecorationTheme(
            errorStyle: TextStyle(),
            hintStyle: TextStyle(
                fontSize: MyConst.fontSize,
                color: Theme.of(context).disabledColor),
            border: InputBorder.none,
            contentPadding: EdgeInsets.only(
              right: MyConst.fontSize,
              left: MyConst.fontSize,
            ),
          ),
          buttonColor: primary,
          primaryColor: primary,
          textTheme: TextTheme(
            /// 各种 [Button] [Text]
            button: TextStyle(
                fontSize: MyConst.fontSize,
                color: MyConst.highTextColor,
                fontWeight: FontWeight.w400),

            /// [TextField]
            subhead: TextStyle(
                fontSize: MyConst.fontSize, color: MyConst.highTextColor),
          ),
          backgroundColor: Color(0XFFF9F9F9),
          cardTheme: CardTheme()
          // pageTransitionsTheme: PageTransitionsTheme(builders: {TargetPlatform.android: CupertinoPageTransitionsBuilder(),}),
          ),
    );

    // return app;
    return BotToastInit(
      child: DefaultTextStyle(
        child: app,
        style: TextStyle(fontSize: Adapt.px(48)),
      ),
    );
  }
}
