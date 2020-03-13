import 'package:flutter/material.dart';

getParams(BuildContext context, [String key = '']) {
  dynamic params = ModalRoute.of(context).settings.arguments;
  if (params == null) {
    return null;
  }
  if (key == '') {
    return params;
  }
  var value = params[key];

  return value;
}