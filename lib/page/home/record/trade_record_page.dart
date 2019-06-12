
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'offline_page.dart';
import 'package:flutter_yd_mall/page/test_page.dart';


class TradeRecordPage extends StatefulWidget{
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return TradeRecordPageState();
  }

}

class TradeRecordPageState extends State<TradeRecordPage> {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        title: Text("订单管理",style: TextStyle(color: Colors.black),),
        elevation: 0,
        centerTitle: true,
        leading: IconButton(icon: Icon(Icons.arrow_back_ios,color: Colors
        .black,), onPressed: (){Navigator.of(context).pop();}),
      ),
      body: Container(
        padding: EdgeInsets.all(4),
        child: Column(
          children: <Widget>[
            _buildContainerCategory("assets/icon_bill_cash.png","收款订单","线下收款订"
                "单",_jump2OfflineOrderPage),
            _buildContainerCategory("assets/icon_bill_e_store.png","商城订单","商品"
                "券、礼品券订单",_emptyPress),
            _buildContainerCategory("assets/icon_bill_charge.png","售卡订单","线下储"
                "值卡订单",_emptyPress),
            _buildContainerCategory("assets/icon_bill_refund.png","退款订单","消费退"
                "款订单",_emptyPress),
          ],
        ),
      ),
    );
  }

  _jump2OfflineOrderPage(){
    //goto test page

    Navigator.of(context).push(MaterialPageRoute(builder: (context){
      return OfflinePage();
    }));

//    Navigator.of(context).push(MaterialPageRoute(builder: (context){
//      return OfflinePage();
//    }));
  }

  _emptyPress(){}


  Widget _buildContainerCategory(String imgUrl,String title,String subTitle,
      Function press){
    return Expanded(
      child: GestureDetector(
        onTap: press,
        child: Container(
          width: double.infinity,
          margin: EdgeInsets.only(top: 5,bottom: 5),
          padding: EdgeInsets.only(top: 20,bottom: 20),
          decoration: BoxDecoration(
              border: Border.all(color: Colors.black12,width: 1),
              borderRadius: BorderRadius.circular(4)
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              Image.asset(imgUrl),
              Text(
                title,
                style: TextStyle(color: Colors.black,fontSize: ScreenUtil
                    .getInstance().setSp(40)),
              ),
              Text(
                subTitle,
                style: TextStyle(color: Colors.black54,fontSize: ScreenUtil
                    .getInstance().setSp(40)),
              ),
            ],
          ),
        ),
      ),
    );
  }


}






















