import 'dart:math';

import 'package:flutter/material.dart';
import 'package:keep_account/data/todo.dart';
import 'package:keep_account/store/index.dart';
import 'package:bot_toast/bot_toast.dart';

final todoStore = new TodoStore();

class SqfDemoPage extends StatefulWidget {
  @override
  _SqfDemoPageState createState() => _SqfDemoPageState();
}

class _SqfDemoPageState extends State<SqfDemoPage> {
  List<Todo> list = [];

  add() async {
    await todoProvider.open(todoPath);
    await todoProvider.insert(Todo.fromMap({ '$columnTitle': '测试' + Random().nextInt(100).toString(), '$columnDone': 0, }));
    getTodos();
  }
  empty() async {
    await todoProvider.open(todoPath);
    await todoProvider.empty();
    BotToast.showText(text: "删除成功");
    getTodos();
  }
  getTodos() async {
    await todoProvider.open(todoPath);
    List newList = await todoProvider.getTodos();
    setState(() {
      list = newList;
    });
    print(newList);
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        RaisedButton(child: Text('增加数据库'), onPressed: add,),
        RaisedButton(child: Text('查看数据'), onPressed: getTodos,),
        RaisedButton(child: Text('清空数据'), onPressed: empty,),
        if (list == null || list.length == 0) Text('数据库的数据为空'),
        ...(list ?? [])?.map((v) => Text(v.id.toString() + '. ' + v.title)),
      ],
    );
  }
}