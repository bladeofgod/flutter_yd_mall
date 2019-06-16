import 'package:flutter/material.dart';


class ScanGoodsPage extends StatefulWidget{

  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return ScanGoodsPageState();
  }

}

class ScanGoodsPageState extends State<ScanGoodsPage> with AutomaticKeepAliveClientMixin {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Center(
      child: Text("scan goods"),
    );
  }

  @override
  // TODO: implement wantKeepAlive
  bool get wantKeepAlive => true;
}