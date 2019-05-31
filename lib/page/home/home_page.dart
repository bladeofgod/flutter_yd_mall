
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class HomePage extends StatefulWidget{
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return HomePageState();
  }

}

class HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      body: Container(
        child: Column(
          children: <Widget>[
            //blue bg
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: <Widget>[
                buildSquareContainer("收款", Icon(Icons.monetization_on), pressTest(),
                    Colors.blueAccent, false),
                buildSquareContainer("收款", Icon(Icons.monetization_on), pressTest(),
                    Colors.blueAccent, false),
                buildSquareContainer("收款", Icon(Icons.monetization_on), pressTest(),
                    Colors.blueAccent, false),
                buildSquareContainer("收款", Icon(Icons.monetization_on), pressTest(),
                    Colors.blueAccent, false),
              ],
            ),
            //white bg
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: <Widget>[
                buildSquareContainer("收款", Icon(Icons.monetization_on), pressTest(),
                    Colors.white, true),
                buildSquareContainer("收款", Icon(Icons.monetization_on), pressTest(),
                    Colors.white, true),
                buildSquareContainer("收款", Icon(Icons.monetization_on), pressTest(),
                    Colors.white, true),
                buildSquareContainer("收款", Icon(Icons.monetization_on), pressTest(),
                    Colors.white, true),
              ],
            ),
            //row 2
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: <Widget>[
                buildSquareContainer("收款", Icon(Icons.monetization_on), pressTest(),
                    Colors.white, true),
                buildSquareContainer("收款", Icon(Icons.monetization_on), pressTest(),
                    Colors.white, true),
                buildSquareContainer("收款", Icon(Icons.monetization_on), pressTest(),
                    Colors.white, true),
                buildSquareContainer("收款", Icon(Icons.monetization_on), pressTest(),
                    Colors.white, true),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: <Widget>[
                buildSquareContainer("收款", Icon(Icons.monetization_on), pressTest(),
                    Colors.white, true),
                buildEmptyContainer(),
                buildEmptyContainer(),
                buildEmptyContainer(),
              ],
            )
          ],
        ),
      ),
    );
  }
}
//just for test  do nothing
pressTest(){}

//占位widget
Widget buildEmptyContainer(){
  return Expanded(
    flex: 1,
    child: Container(),
  );
}


Widget buildSquareContainer(String title,Icon icon,Function press,Color bg,
    bool hasBorder){
  return Expanded(
    flex: 1,
    child: AspectRatio(
      aspectRatio: 1/1,
    child: Container(
      decoration: hasBorder ?
      BoxDecoration(
        color: bg,
          border: Border.all(color: Colors.black12,width: 1)
      ):BoxDecoration(
        color: bg,
          border: Border.all(color: Colors.transparent,width: 0)),
      alignment: Alignment.center,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisSize: MainAxisSize.max,
        children: <Widget>[
          icon,
          Text(
              title
          ),
        ],
      ),
    ),),
  );
}













