

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class StoreSettingPage extends StatefulWidget{
  
  
  
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return StoreSettingPageState();
  }
  
}

class StoreSettingPageState extends State<StoreSettingPage> {

  String storeUrl = "http://img05.jdzj"
      ".com/oledit/uploadfile/news2014/image/20140401/20140401122016801680.jpg";

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.white,
        leading: IconButton(icon: Icon(Icons
            .arrow_back_ios,color: Colors.black,), onPressed: ()=>Navigator
            .of(context).pop()),
        title: Text("门店配置"),
        centerTitle: true,
      ),
      body: Container(
        padding: EdgeInsets.only(top: 4,bottom: 4,left: 10,right: 10),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            //header
            Container(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: <Widget>[
                  Container(
                    height: ScreenUtil.getInstance().setHeight(180),
                    width:ScreenUtil.getInstance().setWidth(180) ,
                    margin: EdgeInsets.only(right: 12),
                    child: CircleAvatar(
                      backgroundImage: NetworkImage(storeUrl),
                    ),
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      Text(
                        "测试账号",style: TextStyle(color: Colors.black,
                          fontWeight:FontWeight.bold  ,fontSize:
                          ScreenUtil.getInstance().setSp(50)),
                      ),
                      Container(
                        height: ScreenUtil.getInstance().setHeight(40),
                      ),
                      Text(
                        "休闲娱乐",style: TextStyle(color: Colors.black,fontSize:
                      ScreenUtil.getInstance().setSp(35)),
                      ),
                    ],
                  ),
                ],
              ),
            ),
            Container(
              margin: EdgeInsets.only(bottom: 10,top: 30),
              child: Text("服务有效期",style: TextStyle(color: Colors.black,
                  fontWeight: FontWeight.bold),),
            ),
            Container(
              margin: EdgeInsets.only(bottom: 10,top: 10),
              child: Text("-",style: TextStyle(color: Colors.black),),
            ),
            Container(
              margin: EdgeInsets.only(bottom: 10,top: 10),
              child: Text("门店地址",style: TextStyle(color: Colors.black,
                  fontWeight: FontWeight.bold),),
            ),
            Container(
              margin: EdgeInsets.only(bottom: 10,top: 10),
              child: Text("北京北京市朝阳区柳芳北里8号",style: TextStyle(color: Colors
                  .black),),
            ),
            Container(
              margin: EdgeInsets.only(bottom: 10,top: 10),
              child: Text("固定电话",style: TextStyle(color: Colors.black,
                  fontWeight: FontWeight.bold),),
            ),
            Container(
              margin: EdgeInsets.only(bottom: 10,top: 10),
              child: Text("654321654",style: TextStyle(color: Colors
                  .black),),
            ),
            Container(
              margin: EdgeInsets.only(bottom: 10,top: 10),
              child: Text("手机号码",style: TextStyle(color: Colors.black,
                  fontWeight: FontWeight.bold),),
            ),
            Container(
              margin: EdgeInsets.only(bottom: 10,top: 10),
              child: Text("123456789789",style: TextStyle(color: Colors
                  .black),),
            ),
          ],
        ),
      ),
    );
  }
}






















