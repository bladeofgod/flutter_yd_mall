import 'package:flutter/material.dart';


class ShortcutPage extends StatefulWidget{
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return ShortcutPageState();
  }

}

class ShortcutPageState extends State<ShortcutPage> with AutomaticKeepAliveClientMixin {


  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Center(
      child: Text("short cut"),
    );
  }

  @override
  // TODO: implement wantKeepAlive
  bool get wantKeepAlive => true;
}














