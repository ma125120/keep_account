import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
export './form.dart';

class MyInk extends StatelessWidget {
  final Widget child;
  final Function() onTap;
  final VoidCallback onLongPress;

  MyInk({
    this.child,
    this.onTap,
    this.onLongPress,
  }) : assert(child != null);

  @override
  Widget build(BuildContext context) {
    return Material(
      type: MaterialType.transparency,
      child: InkWell(
        child: child,
        onTap: onTap,
        onLongPress: onLongPress,
      ),
    );
  }
}

class FixedStack extends StatelessWidget {
  final Widget body;
  final List<Widget> children;
  FixedStack({this.body, this.children = const []}) : assert(body != null);

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: <Widget>[
        body,
        ...children,
      ],
    );
  }
}

showSheet({
  @required BuildContext context,
  @required child,
}) {
  showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      backgroundColor: Colors.white,
      shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.only(
        topLeft: const Radius.circular(12),
        topRight: const Radius.circular(12),
      )),
      clipBehavior: Clip.antiAlias,
      // isScrollControlled: true,
      builder: (_) => child);
}

showConfirm({
  @required BuildContext context,
  Future<bool> Function() onOk,
}) {
  showCupertinoDialog(
      context: context,
      builder: (context) {
        return CupertinoAlertDialog(
          title: Text('提示'),
          content: Text('确认删除吗？'),
          actions: <Widget>[
            CupertinoDialogAction(
              child: Text('取消'),
              onPressed: () {
                Navigator.pop(context);
              },
            ),
            CupertinoDialogAction(
              child: Text('确认'),
              onPressed: () async {
                bool back = await onOk();
                if (back) {
                  Navigator.pop(context);
                }
              },
            ),
          ],
        );
      });
}
