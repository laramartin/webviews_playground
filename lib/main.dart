import 'package:flutter/material.dart';
import 'package:webview_flutter/webview_flutter.dart';
import 'dart:async';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {

  WebViewController _controller;


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
            WillPopScope(
          child: WebView(
            initialUrl: "https://www.github.com",
            javaScriptMode: JavaScriptMode.unrestricted,
            onWebViewCreated: (WebViewController webViewController) {
              _controller = webViewController;
            },
          ),
          onWillPop: () async {
            print("cuando haces pop");
            _controller.goBack();
            return false;
          },
        ),
        floatingActionButton: FloatingActionButton(onPressed: () {}),
      ),
    );
  }
}
