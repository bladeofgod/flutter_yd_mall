import 'package:flutter/material.dart';
import 'page/splash_page.dart';
import 'page/main_page.dart';


void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return MaterialApp(
      title: '宜店商户端',
      theme: ThemeData(
        primaryColor:Colors.deepOrange,
        primarySwatch:Colors.orange,
      ),
      initialRoute: "splash_page",
      routes: {
        "splash_page":(context)=> SplashPage(),
        "main_page":(context)=>MainPage()
      },
    );
  }

}