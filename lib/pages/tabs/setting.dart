import 'package:flutter/material.dart';
// import 'package:flutter_study_app/pages/scroll/sliver.dart';
// import 'package:keep_account/pages/demo/index/npc.dart';

class SettingPage extends StatefulWidget {

  @override
  _SettingPageState createState() => _SettingPageState();
}

class _SettingPageState extends State<SettingPage> with AutomaticKeepAliveClientMixin {
  @override
  bool get wantKeepAlive => true;

  @override
  void initState() {
    super.initState();
    // print('init demo');
  }

  // Widget get _renderBody {
  //   return Text('demo');
  // }

  @override
  Widget build(BuildContext context) {
    super.build(context);

    return Material(
      child: Scaffold(
        appBar: AppBar(title: Text('setting'),),
        body: Text('setting'),
      ),
    );
  }
}