import 'package:flutter/material.dart';
import 'package:webview_flutter/webview_flutter.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  _onWillPop() {}

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
          ),
          onWillPop: () async {
            print("cuando haces pop");

            return false;
          },
        ),
        floatingActionButton: FloatingActionButton(onPressed: () {}),
      ),
    );
  }
}
