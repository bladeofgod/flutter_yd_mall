import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:qrscan/qrscan.dart' as scanner;
import 'package:fluttertoast/fluttertoast.dart';
import 'package:permission_handler/permission_handler.dart';

class ShortcutPage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return ShortcutPageState();
  }
}

class ShortcutPageState extends State<ShortcutPage>
    with AutomaticKeepAliveClientMixin {
  String totalNumber = "0";

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Container(
      child: Column(
        children: <Widget>[
          //number area
          Container(
            width: double.infinity,
            height: ScreenUtil.getInstance().setHeight(250),
            padding: EdgeInsets.all(20),
            color: Colors.black12,
            child: Text(
              totalNumber,
              style: TextStyle(
                  color: Colors.orange,
                  fontSize: ScreenUtil.getInstance().setSp(120)),
            ),
          ),
          //number button area
          Expanded(
            flex: 1,
            child: Container(
              child: Column(
                children: <Widget>[
                  // 7 8 9
                  Expanded(
                    child: Row(
                      children: <Widget>[
                        _buildNumBtn(7),
                        _buildNumBtn(8),
                        _buildNumBtn(9),
                      ],
                    ),
                  ),

                  //4 5 6
                  Expanded(
                    child: Row(
                      children: <Widget>[
                        _buildNumBtn(4),
                        _buildNumBtn(5),
                        _buildNumBtn(6),
                      ],
                    ),
                  ),

                  // 1 2 3
                  Expanded(
                    child: Row(
                      children: <Widget>[
                        _buildNumBtn(1),
                        _buildNumBtn(2),
                        _buildNumBtn(3),
                      ],
                    ),
                  ),

                  //. 0 <-
                  Expanded(
                    child: Row(
                      children: <Widget>[
                        _buildFunctionBtn(Text("."), 10),
                        _buildNumBtn(0),
                        _buildFunctionBtn(Icon(Icons.arrow_back,color:
                        Colors.grey,), 11),
                      ],
                    ),
                  ),

                  //settle / scan settle
                  Expanded(
                    child: Row(
                      children: <Widget>[
                        Expanded(
                          child: GestureDetector(
                            onTap: () {
                              _settle();
                            },
                            child: Container(
                              alignment: Alignment.center,
                              color: Colors.green,
                              child: Text(
                                "结账",
                                style: TextStyle(
                                    color: Colors.white,
                                    fontSize:
                                        ScreenUtil.getInstance().setSp(80)),
                              ),
                            ),
                          ),
                        ),
                        Expanded(
                          child: GestureDetector(
                            onTap: () {
                              _gotoScanSettle();
                            },
                            child: Container(
                              alignment: Alignment.center,
                              color: Colors.orange,
                              child: Text(
                                "扫码结账",
                                style: TextStyle(
                                    color: Colors.white,
                                    fontSize:
                                        ScreenUtil.getInstance().setSp(80)),
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  _settle() {
    Fluttertoast.showToast(msg: "结账金额 $totalNumber");
  }

  _gotoScanSettle() async {
    await PermissionHandler().requestPermissions([PermissionGroup.camera]);

    await PermissionHandler()
        .checkPermissionStatus(PermissionGroup.camera)
        .then((status) {
      if (status == PermissionStatus.granted) {
        _toScan();
      } else {
        Fluttertoast.showToast(msg: "需要相机权限");
      }
    });
  }

  _toScan() async {
    try {
      String barcode = await scanner.scan();
      Fluttertoast.showToast(msg: "scanner result : $barcode");
    } on Exception catch (e) {
      if (e == scanner.CameraAccessDenied) {
        Fluttertoast.showToast(
            msg: "The user did not grant the camera permission!");
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

  _numberBtnPress(int number) {
    if (number == 10) {
      //.
      _clickDotBtn();
    } else if (number == 11) {
      // <-
      _clickBackBtn();
    } else {
      //number
      _clickNumberBtn(number);
    }
  }

  _clickDotBtn() {
    if (_containsDot()) {
      return;
    }
    setState(() {
      totalNumber = "${totalNumber}.";
    });
  }

  bool _containsDot() {
    String temp = totalNumber.toString();
    return temp.contains(".");
  }

  bool _tailIsDot() {
    String temp = totalNumber.toString();
    return temp.endsWith(".");
  }

  bool _singleDigit() {
    return totalNumber.length == 1;
  }

  _clickBackBtn() {
    if (_tailIsDot()) {
      setState(() {
        totalNumber = totalNumber.substring(0, totalNumber.length - 1);
      });
      return;
    }
    if (double.parse(totalNumber) == 0) {
      setState(() {
        totalNumber = "0";
      });
      return;
    } else {
      if (_singleDigit()) {
        setState(() {
          totalNumber = "0";
        });
      } else {
        setState(() {
          totalNumber = totalNumber.substring(0, totalNumber.length - 1);
        });
      }
    }
  }

  _clickNumberBtn(int number) {
    if(double.parse(totalNumber) == 0 && number == 0){
      if(_tailIsDot()){
        setState(() {
          totalNumber = "$totalNumber$number";
        });
      }
      return ;
    }else if(double.parse(totalNumber) == 0 && !_containsDot()){
      setState(() {
        totalNumber = "$number";
      });
    }else if(_containsDot()){
      int index = totalNumber.indexOf(".");
      if(totalNumber.substring(index,totalNumber.length).length >= 3){
        return;
      }else{
        setState(() {
          totalNumber = "${totalNumber}$number";
        });
      }
    }else{
      setState(() {
        totalNumber = "${totalNumber}$number";
      });
    }

  }

  Widget _buildNumBtn(int number) {
    Widget expanded =  Expanded(
          flex: 1,
          child: GestureDetector(
              onTap: () {
                _numberBtnPress(number);
              },
              child: Container(
                decoration: BoxDecoration(
                    color: Colors.white,
                    border: Border.all(color: Colors.black12, width: 1)),
                alignment: Alignment.center,
                child: Text(
                  "$number",
                  style: TextStyle(
                      color: Colors.grey,
                      fontSize: ScreenUtil.getInstance().setSp(60)),
                ),
              ),
          ),
    );

    return expanded;
  }

  Widget _buildFunctionBtn(Widget child, int flag) {
    return Expanded(
          flex: 1,
          child: GestureDetector(
              onTap: () {
                _numberBtnPress(flag);
              },
              child: Container(
                decoration: BoxDecoration(
                    color: Colors.white,
                    border: Border.all(color: Colors.black12, width: 1)),
                alignment: Alignment.center,
                child: child,
              ),
          ),
    );
  }

  @override
  // TODO: implement wantKeepAlive
  bool get wantKeepAlive => true;
}
