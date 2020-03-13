import 'package:flutter/material.dart';
import 'package:bot_toast/bot_toast.dart';
import 'package:keep_account/config/index.dart';

class MyLoading {
  static Set dict = Set();
  static bool _status = false;

  static show(String uri, [String text]) {
    dict.add(uri);

    if (_status == true || dict.length >= 2) {
      return ;
    }
    _status = true;

    BotToast.showCustomLoading(
      toastBuilder: (_) => MyCustomLoadingDialog(text)
    );
    Future.delayed(Duration(milliseconds: MyConfig.timeout), () {
      hide();
    });
  }

  static complete(String uri) {
    dict.remove(uri);
    if (dict.length == 0 && _status == true) {
      _status = false;
      hide();
    }
  }

  static hide([String text]) {
    BotToast.closeAllLoading();
    if (text != null) {
      err(text);
    }
  }

  static err([String text = '请求失败']) {
    BotToast.showText(text: text);
  }
}

showMyCustomLoadingDialog(BuildContext context, { int milliseconds = 100, String text, }) {
  showDialog(
    context: context,
    barrierDismissible: true,
    builder: (context) {
      return MyCustomLoadingDialog(text, milliseconds);
    }
  );
}

class MyCustomLoadingDialog extends StatelessWidget {
  final int milliseconds;
  final String text;
  MyCustomLoadingDialog([this.text = "加载中...", this.milliseconds = 100]);

  @override
  Widget build(BuildContext context) {
    Duration insetAnimationDuration = Duration(milliseconds: milliseconds);
    Curve insetAnimationCurve = Curves.decelerate;

    RoundedRectangleBorder _defaultDialogShape = RoundedRectangleBorder(
        borderRadius: BorderRadius.all(Radius.circular(2.0)));

    return AnimatedPadding(
      padding: MediaQuery.of(context).viewInsets +
          const EdgeInsets.symmetric(horizontal: 40.0, vertical: 24.0),
      duration: insetAnimationDuration,
      curve: insetAnimationCurve,
      child: MediaQuery.removeViewInsets(
        removeLeft: true,
        removeTop: true,
        removeRight: true,
        removeBottom: true,
        context: context,
        child: Center(
          child: SizedBox(
            width: 120,
            height: 120,
            child: Material(
              elevation: 24.0,
              color: Theme.of(context).dialogBackgroundColor,
              type: MaterialType.card,
              //在这里修改成我们想要显示的widget就行了，外部的属性跟其他Dialog保持一致
              child: new Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  CircularProgressIndicator(),
                  Padding(
                    padding: const EdgeInsets.only(top: 20),
                    child: Text(text ?? "加载中"),
                  ),
                ],
              ),
              shape: _defaultDialogShape,
            ),
          ),
        ),
      ),
    );
  }
}