

import 'package:flutter/material.dart';


class ChooseCouponPage extends StatefulWidget{
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return ChooseCouponPageState();
  }

}

class ChooseCouponPageState extends State<ChooseCouponPage> with AutomaticKeepAliveClientMixin {

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Center(
      child: Text("choose coupon"),
    );
  }

  @override
  // TODO: implement wantKeepAlive
  bool get wantKeepAlive => true;
}