import 'package:keep_account/router/index.dart';
import 'package:flutter/material.dart';

class App {
  static MyRouter router;
  static pop(BuildContext context) {
    if (Navigator.of(context).canPop()) {
      Navigator.of(context).pop();
    }
  }

  static init() async {
    // Future.delayed(Duration(seconds: 1), () async {
    //   final _path = await initDeleteDb(MyConst.dbPath);
    //   App.dbPath = _path;
    // });
  }
}
