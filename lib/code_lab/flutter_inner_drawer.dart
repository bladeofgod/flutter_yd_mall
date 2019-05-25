
import 'package:flutter/material.dart';



void main() => runApp(MyApp());


class MyApp extends StatelessWidget
{

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Inner Drawer',
      theme: ThemeData(
        primarySwatch: Colors.grey,
      ),
      home: MyHomePage(title: 'Flutter Inner Drawer'),
    );
  }
}


class MyHomePage extends StatefulWidget
{
  MyHomePage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}


class _MyHomePageState extends State<MyHomePage>
{


  @override
  void initState()
  {
    super.initState();
  }







  @override
  Widget build(BuildContext context)
  {

    return Scaffold();
  }

}
