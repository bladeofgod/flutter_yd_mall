
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'record/trade_record_page.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'dart:async';
import 'package:qrscan/qrscan.dart' as scanner;
import 'package:flutter/services.dart';
import 'take_money_page.dart';

class HomePage extends StatefulWidget{
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return HomePageState();
  }

}

class HomePageState extends State<HomePage> with AutomaticKeepAliveClientMixin {

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }


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
                buildSquareContainer("收款", "assets/cashier_disable.png", takeMoney,
                    Colors.blueAccent, false),
                buildSquareContainer("售卡", "assets/charge_disable.png",
                    pressTest,
                    Colors.blueAccent, false),
                buildSquareContainer("券回收", "assets/reclaim_token_disable.png",
                    recycleCoupon,
                    Colors.blueAccent, false),
                buildSquareContainer("账目", "assets/first_discount_disable.png",
                    checkTradeRecord,
                    Colors.blueAccent, false),
              ],
            ),
            //white bg
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: <Widget>[
                buildSquareContainer("首单优惠", "assets/lkl_icon_order_cash.png",
                    pressTest,
                    Colors.white, true),
                buildSquareContainer("消费立减", "assets/icon_cash_back.png",
                    pressTest,
                    Colors.white, true),
                buildSquareContainer("折扣优惠", "assets/icon_marketing_config.png",
                    pressTest,
                    Colors.white, true),
                buildSquareContainer("礼券馈赠", "assets/lkl_icon_send_gift.png",
                    pressTest,
                    Colors.white, true),
              ],
            ),
            //row 2
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: <Widget>[
                buildSquareContainer("收款码", "assets/icon_pay_code.png",
                    pressTest,
                    Colors.white, true),
                buildSquareContainer("PC端登录", "assets/icon_scan_login.png",
                    pressTest,
                    Colors.white, true),
                buildSquareContainer("分享", "assets/icon_share_app.png",
                    pressTest,
                    Colors.white, true),
                buildSquareContainer("退款管理", "assets/icon_bill_refund.png",
                    pressTest,
                    Colors.white, true),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: <Widget>[
                buildSquareContainer("配送", "assets/lkl_icon_deliver.png",
                    pressTest,
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


  //just for test  do nothing
  pressTest(){}

  //收款
  takeMoney() {
    handlePermissions();
//    Navigator.of(context).push(MaterialPageRoute(builder: (context){
//      return TakeMoneyPage();
//    }));
  }

  handlePermissions () async{
    await PermissionHandler().requestPermissions([PermissionGroup.camera,]);

    await PermissionHandler()
        .checkPermissionStatus(PermissionGroup.camera).then((PermissionStatus
    status){
      if(status == PermissionStatus.granted){
        //todo jump scan
        Navigator.of(context).push(MaterialPageRoute(builder: (context){
          return TakeMoneyPage();
        }));

      }else{

        Fluttertoast.showToast(msg: "需要相机权限");

      }
    });
  }


  //券回收
  recycleCoupon() async{

    await PermissionHandler().requestPermissions([PermissionGroup.camera,]);

    await PermissionHandler()
        .checkPermissionStatus(PermissionGroup.camera).then((PermissionStatus
        status){
          if(status == PermissionStatus.granted){
            //todo jump scan
            toScan();

          }else{

            Fluttertoast.showToast(msg: "需要相机权限");

          }
    });


  }

  toScan()async{

    try {
      String barcode = await scanner.scan();
      Fluttertoast.showToast(msg: "scanner result : $barcode");
    } on Exception catch (e) {
      if (e == scanner.CameraAccessDenied) {
        Fluttertoast.showToast(msg: "The user did not grant the camera permission!");
//        setState(() {
//          this.barcode = 'The user did not grant the camera permission!';
//        });
      } else {
        Fluttertoast.showToast(msg: "unknow error $e");
//        setState(() => this.barcode = 'Unknown error: $e');
      }
    } on FormatException {
//      setState(() => this.barcode = 'null (User returned using the "back"-button before scanning anything. Result)');
    } catch (e) {
//      setState(() => this.barcode = 'Unknown error: $e');
    }


  }


  //查账
  checkTradeRecord(){
    Navigator.of(context).push(MaterialPageRoute(builder: (context){
      return new TradeRecordPage();
    }));

  }

//占位widget
  Widget buildEmptyContainer(){
    return Expanded(
      flex: 1,
      child: Container(),
    );
  }


  Widget buildSquareContainer(String title,String imgUrl,Function press,Color bg,
      bool hasBorder,){
    return Expanded(
      flex: 1,
      child: AspectRatio(
        aspectRatio: 1/1,
        child: GestureDetector(
          onTap: press,
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
                Container(
                  margin: EdgeInsets.only(bottom: 10),
                  width: ScreenUtil.getInstance().setWidth(80),
                  height: ScreenUtil.getInstance().setHeight(80),
                  child: Image.asset(imgUrl,fit: BoxFit.fill,),
                ),
                Text(
                    title
                ),
              ],
            ),
          ),
        ),),
    );
  }

  @override
  // TODO: implement wantKeepAlive
  bool get wantKeepAlive => true;


}














