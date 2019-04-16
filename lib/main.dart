import 'package:flutter/material.dart';
import 'package:webview_flutter/webview_flutter.dart';
import 'dart:async';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  WebViewController _controller;

  var _channel = JavascriptChannel(
      name: 'Print',
      onMessageReceived: (JavascriptMessage message) {
        print(message);
      });

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.deepPurple,
      ),
      home: Scaffold(
        appBar: AppBar(
          title: Text("WebViews playground"),
        ),
        body:
//        Container(
//          color: Colors.orange,
//        ),
            WebView(
          initialUrl: "http://192.168.0.55:8000",
          javascriptMode: JavascriptMode.unrestricted,
          onWebViewCreated: (WebViewController webViewController) {
            _controller = webViewController;
          },
          javascriptChannels: {_channel},
        ),
        floatingActionButton: FloatingActionButton(onPressed: () {
          _controller.reload();
        }),
      ),
    );
  }
}
