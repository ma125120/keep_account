// import 'package:flutter/material.dart';
import './http_request.dart';
// import 'package:keep_account/models/index.dart';

typedef RequestCallBack<T> = void Function(T value);

class UrlPrefix {
  static bool isMock = true;
  static String activity = (isMock ? '/14' : '') + '/activity';
}

class API {
  static init() {
    HttpRequest.init();
  }

  static String storyList = UrlPrefix.activity + '/activity/story/content';

  // static _getRes(String uri, { Map<String, String> params, Map<String, String> headers }) async {
  //   if (UrlPrefix.isMock == true) {
  //     return HttpRequest.get(uri, params: params, headers: headers);
  //   }
  //   return HttpRequest.get(uri, params: params, headers: headers);
  // }
  // static _postRes(String uri,
  //     {Map<String, String> params,
  //     Map<String, String> data,
  //     Map<String, String> headers,
  //     Map<String, dynamic> extra,
  //     bool needLoading = true}) async {
  //   // if (UrlPrefix.isMock == true) {
  //   //   return HttpRequest.post(uri,
  //   //       data: data,
  //   //       params: params,
  //   //       headers: headers,
  //   //       extra: extra,
  //   //       needLoading: needLoading);
  //   // }
  //   return HttpRequest.post(uri,
  //       data: data,
  //       params: params,
  //       headers: headers,
  //       extra: extra,
  //       needLoading: needLoading);
  // }

  // static Future<StoryListRes> getStoryList() async {
  //   dynamic res = await _postRes(storyList, needLoading: true);
  //   return StoryListRes.fromJson(res == null ? {} : res);
  // }
}
