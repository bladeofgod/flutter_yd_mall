import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';


class StorePage extends StatefulWidget{

  String storeName = "测试一号店铺";
  String storeUrl = "http://img05.jdzj"
      ".com/oledit/uploadfile/news2014/image/20140401/20140401122016801680.jpg";

  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return StorePageState();
  }

}

class StorePageState extends State<StorePage> {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      body: Container(
        child: Column(
          children: <Widget>[
            buildHeader(),
            //store manager
            Container(
              padding: EdgeInsets.only(left: 10,top: 10,bottom: 10),
              child: Row(
                children: <Widget>[
                  Icon(Icons.store,color: Colors.black,),
                  Text(
                    "店铺管理",
                    style: TextStyle(color: Colors.black,fontSize: ScreenUtil
                        .getInstance().setSp(50)),
                  ),
                ],
              ),
            ),
            //body
            buildBody(),
          ],
        ),
      ),
    );
  }

  Widget buildBody(){
    return Column(
      children: <Widget>[
        //blue bg
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
            buildEmptyContainer()
          ],
        ),
      ],
    );
  }

  Widget buildHeader(){
    return Container(
      height: ScreenUtil.getInstance().setHeight(400),
      padding: EdgeInsets.only(top: 20,bottom: 20,right: 10,left: 10),
      color: Colors.blueAccent,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          Row(
            children: <Widget>[
              Container(
                height: ScreenUtil.getInstance().setHeight(200),
                width:ScreenUtil.getInstance().setWidth(200) ,
                child: CircleAvatar(
                  backgroundImage: NetworkImage(widget.storeUrl),
                ),
              ),
              Container(
                margin: EdgeInsets.only(left: 10),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Text(
                      widget.storeName,
                      style: TextStyle(color: Colors.white,fontSize:
                      ScreenUtil.getInstance().setSp(60)),
                    ),
                    Text(
                      "查看店铺信息",
                      style: TextStyle(
                          color: Colors.white70,
                          fontSize: ScreenUtil.getInstance().setSp(44)
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
          Icon(
            Icons.arrow_forward_ios,
            color: Colors.white,
          )
        ],
      ),
    );
  }

}

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









