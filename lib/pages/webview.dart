import 'package:flutter/material.dart';
import 'package:webview_flutter/webview_flutter.dart';
import 'package:fluro/fluro.dart';
import 'package:keep_account/common/fn.dart';

class WebviewPage extends StatefulWidget {
  // static final routerName = '/web';
  static handler() {
    return Handler(
      handlerFunc: (BuildContext context, Map<String, List<String>> params) {
        return WebviewPage();
      },
    );
  }

  @override
  _WebviewPageState createState() => _WebviewPageState();
}

class _WebviewPageState extends State<WebviewPage> {
  // final Completer<WebViewController> _controller =
  //     Completer<WebViewController>();
  WebViewController _webViewController;

  @override
  void initState() {
    super.initState();
  }

  Future<bool> back() async {
    bool canBack = await _webViewController?.canGoBack();
    if (canBack) {
      _webViewController.goBack();
    } else {
      Navigator.of(context).pop();
    }

    return false;
  }

  @override
  Widget build(BuildContext context) {
    // WebViewParams info =
    String url = getParams(context, 'url');
    String title = getParams(context, 'title');

    return Scaffold(
        appBar: AppBar(
          title: Text(title ?? 'webview'),
          actions: <Widget>[
            IconButton(
              icon: Icon(Icons.close),
              onPressed: () {
                Navigator.of(context).pop();
              },
            )
          ],
        ),
        body: WillPopScope(
          onWillPop: back,
          child: WebView(
            // webview的url
            initialUrl: url ?? 'https://www.baidu.com/',
            // 监听页面url的变化，根据返回值决定跳转还是阻止
            navigationDelegate: (request) {
              if (request.url.startsWith('https://www.youtube.com/')) {
                print('blocking navigation to $request}');
                return NavigationDecision.prevent;
              }

              return NavigationDecision.navigate;
            },
            // flutter向js注入全局变量，然后js就可以调用flutter的方法
            // 例子中js的window会多出一个 Print 对象，js调用Print.postMessage('我是js')时，在flutter中则会打印 js传过来的值: 我是js
            javascriptChannels: {
              JavascriptChannel(
                  name: 'Print',
                  onMessageReceived: (JavascriptMessage msg) {
                    print('js传过来的值: ' + msg.message);
                  }),
            },
            // 是否允许运行js
            javascriptMode: JavascriptMode.unrestricted,
            // webview 创建后肤将控制器赋值给实例变量，方便控制
            onWebViewCreated: (webViewController) {
              // _controller.complete(webViewController);
              _webViewController = webViewController;
            },
            // 页面加载完成
            onPageFinished: (String msg) {
              // print('加载完成');
            },
          ),
        ));
  }
}
