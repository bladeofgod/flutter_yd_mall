import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';


class TestPage extends StatefulWidget{

  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return TestPageState();
  }

}

class TestPageState extends State<TestPage> {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      body: Container(
        height: ScreenUtil.getInstance().setHeight(800),
        decoration: BoxDecoration(
          image: DecorationImage(image: AssetImage("assets/icon_bg_vip.png"),
              fit: BoxFit.cover),
        ),
        child: Column(
          children: <Widget>[
            //app bar
            Container(
              height: 50,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget>[
                  IconButton(icon: Icon(Icons.arrow_back_ios),onPressed: ()
                  =>{Navigator.of(context).pop()},color: Colors.white,),
                  Text("收款订单",style: TextStyle(color: Colors.white,fontSize:
                  ScreenUtil.getInstance().setSp(40)),),
                  IconButton(icon: Icon(Icons.dashboard),color: Colors.white,
                    onPressed: ()=>{Scaffold.of(context).openEndDrawer()},),
                ],
              ),
            ),
            //本日
            Container(
              height: ScreenUtil.getInstance().setHeight(200),
              padding: EdgeInsets.only(top: 10,bottom: 10),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget>[
                  Text(
                    "今日收入/共0笔",style: TextStyle(color: Colors.white,fontSize:
                  ScreenUtil.getInstance().setSp(40)),
                  ),
                  Text(
                    "0.00",style: TextStyle(color: Colors.white,fontSize:
                  ScreenUtil.getInstance().setSp(70)),
                  ),
                ],
              ),
            ),
            //本周 本月
            Container(

              height: ScreenUtil.getInstance().setHeight(120),
              padding: EdgeInsets.only(top: 4),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget>[
                  _buildAppBarColumn("本周", "175.00"),
                  Container(
                    color: Colors.white,
                    width: 1,
                    height: ScreenUtil.getInstance().setHeight(80),
                  ),
                  _buildAppBarColumn("本月", "2565.00"),
                ],
              ),
            ),
            //search
            Container(

              color: Colors.white,
              padding: EdgeInsets.all(4),
              child: buildSearchWidget(),
            ),

          ],
        ),
      ),
    );
  }

  Widget buildSearchWidget() {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(5),
        border: Border.all(color: Colors.black12, width: 1),),
      margin: EdgeInsets.all(10),
      child: TextField(
        //controller: searchController,
        decoration: InputDecoration(
            icon:Icon(Icons.search) ,
            border: InputBorder.none,
            hintText: "搜索会员手机号或备注信息"),
      ),
    );
  }

  Widget _buildAppBarColumn(String title,String info){
    return Column(
      children: <Widget>[
        Text(
          title,style: TextStyle(fontSize: ScreenUtil.getInstance().setSp(40)
            ,color: Colors.white),
        ),
        Text(
          info,style: TextStyle(fontSize: ScreenUtil.getInstance().setSp(40)
            ,color: Colors.white),
        ),
      ],
    );
  }
}












