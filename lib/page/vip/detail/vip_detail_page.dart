import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_yd_mall/temp_data/temp_vip_data.dart';
import 'package:flutter_yd_mall/model/purchase_entity.dart';



class VipDetailPage extends StatefulWidget{

  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return VipDetailPageState();
  }

}

class VipDetailPageState extends State<VipDetailPage> {

  final double headerEmptyHeight = 30;
  final double smallHEmptyHeight = 20;

  List<PurchaseEntity> purchaseRecordList = new List();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    purchaseRecordList.addAll( VipPageTestData.getPurchaseRecord());
  }


  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
//      appBar: AppBar(
//        leading: Icon(Icons.arrow_back_ios,color: Colors.white,),
//        backgroundColor: Colors.lightBlue,
//        title: Text("会员详情",style: TextStyle(color: Colors.white),),
//        centerTitle: true,
//        actions: <Widget>[
//          Icon(Icons.edit,color: Colors.white,),
//        ],
//      ),
      body: Container(
        padding: EdgeInsets.only(top: MediaQuery.of(context).padding.top-1),
        child: Column(
          children: <Widget>[
            //app bar + header  bg: blue area
            Container(
              decoration: BoxDecoration(
                image: DecorationImage(image: AssetImage("assets/icon_bg_vip.png"),fit: BoxFit.fill)
              ),
              padding: EdgeInsets.only(left: 4,right: 4),
              height: ScreenUtil.getInstance().setHeight(500),
              child: Column(
                children: <Widget>[
                  //app bar
                  Container(
                    margin:EdgeInsets.only(bottom: 8,top: 8),
                    height: ScreenUtil.getInstance().setHeight(90),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: <Widget>[
                        GestureDetector(
                          onTap: (){
                            Navigator.of(context).pop();
                          },
                          child: Icon(Icons.arrow_back_ios,color: Colors.white,),
                        ),
                        Text("会员详情",style: TextStyle(color: Colors.white
                            ,fontSize: ScreenUtil.getInstance().setSp(60)),),
                        Icon(Icons.edit,color: Colors.white,),
                      ],
                    ),
                  ),
                  //header
                  Container(
                    padding: EdgeInsets.only(bottom: 4),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        Text("李佳奇 2019-6-7",style: TextStyle(color:Colors.white,)),
                        Container(
                          height: ScreenUtil.getInstance().setHeight(smallHEmptyHeight),
                        ),
                        Row(
                          children: <Widget>[
                            Text("1****1245687",style: TextStyle(color:Colors.white
                            ,fontSize: ScreenUtil.getInstance().setSp(50)),),
                            Icon(Icons.star,color: Colors.red,)
                          ],
                        ),
                        Container(
                          height: ScreenUtil.getInstance().setHeight(headerEmptyHeight),
                        ),
                        //
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: <Widget>[
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: <Widget>[
                                _buildHeaderTag("交易总额（元）"),
                                Container(
                                  height: ScreenUtil.getInstance().setHeight(smallHEmptyHeight),
                                ),
                                _buildResultForTag("￥8888.63")
                              ],
                            ),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: <Widget>[
                                _buildHeaderTag("交易次数"),
                                Container(
                                  height: ScreenUtil.getInstance().setHeight(smallHEmptyHeight),
                                ),
                                _buildResultForTag("311")
                              ],
                            ),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: <Widget>[
                                _buildHeaderTag("上次距今(天)"),
                                Container(
                                  height: ScreenUtil.getInstance().setHeight(smallHEmptyHeight),
                                ),
                                _buildResultForTag("65")
                              ],
                            ),
                            Icon(
                              Icons.arrow_forward_ios,color: Colors.white,
                            ),
                          ],
                        ),
                        Container(
                          height: ScreenUtil.getInstance().setHeight(headerEmptyHeight),
                        ),
                        _buildHeaderTag("备注：打个大冬瓜")
                      ],
                    ),
                  ),
                ],
              ),
            ),
            SingleChildScrollView(
              child: Column(
                children: <Widget>[
                  //body area : remains,discount ...
                  Container(
                    child: Column(
                      children: <Widget>[
                        Row(
                          children: <Widget>[
                            _buildBlockInfo("储值余额", "5524"),
                            Container(
                              margin: EdgeInsets.only(left: 6),
                              width: 1,
                              height: 20,
                              color: Colors.black12,
                            ),
                            _buildBlockInfo("立减金余额", "54.4")
                          ],
                        ),
                        Divider(
                          color: Colors.black12,
                          height: 1,
                        ),
                        Row(
                          children: <Widget>[
                            _buildBlockInfo("会员折扣", "9.5折"),
                            Container(
                              margin: EdgeInsets.only(left: 6),
                              width: 1,
                              height: 20,
                              color: Colors.black12,
                            ),
                            _buildBlockInfo("可用券", "3张")
                          ],
                        ),
                      ],
                    ),
                  ),
                  // divider container bg: black12
                  Container(
                    height: ScreenUtil.getInstance().setHeight(30),
                    color: Colors.black12,
                  ),
                  //title marketing
                  Container(
                    padding: EdgeInsets.all(8),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: <Widget>[
                        Container(
                          margin: EdgeInsets.only(left: 8,right: 4),
                          height: ScreenUtil.getInstance().setHeight(40),
                          width: 3,
                          color: Colors.blue,
                        ),
                        Text(
                          "可针对他做以下营销",
                          style: TextStyle(color: Colors.black,
                              fontSize: ScreenUtil.getInstance().setSp(40)),
                        ),
                      ],
                    ),
                  ),
                  // marketing content
                  Container(
                    margin: EdgeInsets.only(bottom: 5),
                    padding: EdgeInsets.all(8),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: <Widget>[
                        // 1 : 消费立减 2 :折扣优惠 3 :礼券馈赠
                        _buildShadowRect(1),
                        _buildShadowRect(2),
                        _buildShadowRect(3),
                      ],
                    ),
                  ),
                  // divider container bg: black12
                  Container(
                    height: ScreenUtil.getInstance().setHeight(30),
                    color: Colors.black12,
                  ),

                  //title purchase record
                  Container(
                    padding: EdgeInsets.all(8),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: <Widget>[
                        Container(
                          margin: EdgeInsets.only(left: 8,right: 4),
                          height: ScreenUtil.getInstance().setHeight(40),
                          width: 3,
                          color: Colors.blue,
                        ),
                        Text(
                          "消费记录",
                          style: TextStyle(color: Colors.black,
                              fontSize: ScreenUtil.getInstance().setSp(40)),
                        ),
                        Icon(
                          Icons.arrow_forward_ios,
                          color: Colors.grey,
                        ),
                      ],
                    ),
                  ),
                  Divider(
                    height: 1,
                    color: Colors.black12,
                  ),
                  // body : purchase record
                  Container(
                    child:ListView.builder(
                      itemCount: purchaseRecordList.length,
                      itemBuilder: (BuildContext context,int index){
                        return _buildRecordItem(context , index);
                      },
                    ),
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
  // todo   list

  Widget _buildRecordItem(BuildContext context,int index){}

  Widget _buildShadowRect(int type){
    return Container(
      decoration: BoxDecoration(
        border: Border.all(color: Colors.black12),
        borderRadius: BorderRadius.circular(2),
        boxShadow: [
          BoxShadow(color: Colors.black12,offset: Offset(0.1, 0.1),blurRadius: 5.0)
        ]
      ),
      child: Container(
        width: ScreenUtil.getInstance().setWidth(300),
        height: ScreenUtil.getInstance().setHeight(300),
        padding: EdgeInsets.all(10),
        color: Colors.white,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: <Widget>[
            Container(
              width: ScreenUtil.getInstance().setWidth(150),
              height: ScreenUtil.getInstance().setHeight(150),
              decoration: BoxDecoration(
                //todo  可能由于缓存问题，图片无法正确加载 重启软件后 重新设置图片 试试
                image: chooseImage(type),
              ),
            ),
            Container(
              child: chooseText(type),
            ),
          ],
        ),
      ),
    );
  }
  
  DecorationImage chooseImage(int type){
    switch(type){
      case 1 :
        return DecorationImage(image: AssetImage("assets/icon_bg_vip.png",),fit: BoxFit.cover,);
      case 2:
        return DecorationImage(image: AssetImage("assets/icon_bg_vip.png"),fit: BoxFit.cover,);
      case 3:
        return DecorationImage(image: AssetImage("assets/icon_bg_vip.png"),fit: BoxFit.cover,);
    }
  }
  
  Widget chooseText(int type){
    switch(type){
      case 1 :
        return Text("消费立减",);
      case 2:
        return Text("折扣优惠",);
      case 3:
        return Text("礼券馈赠",);
    }
  }
  


  Widget _buildBlockInfo(String leftStr,String rightStr){
    return Expanded(
      flex: 49,
      child: Container(
        padding: EdgeInsets.only(top: 8,bottom: 8,left: 8),
        child: Stack(
          children: <Widget>[
            Align(
              alignment: Alignment.centerLeft,
              child: Text(
                "$leftStr",style: TextStyle(color: Colors.black),
              ),
            ),
            Align(
              alignment: Alignment.centerRight,
              child: Text(
                "$rightStr",
                style: TextStyle(color: Colors.lightBlueAccent),
              ),
            ),
          ],
        ),
      ),
    );
  }


  //header text
  Text _buildHeaderTag(String str){
    return Text(
      "$str"
      ,style: TextStyle(color: Colors.white70,fontSize: ScreenUtil.getInstance().setSp(40)),
    );
  }

  //header result
  Text _buildResultForTag(String result){
    return Text("$result",style: TextStyle(color:Colors.white,fontSize: ScreenUtil.getInstance().setSp(50)),);
  }

}


















