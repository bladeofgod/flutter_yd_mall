import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class VipPage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return VipPageState();
  }
}

class VipPageState extends State<VipPage> {
  TextEditingController searchController;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    searchController = new TextEditingController();
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      body: Container(
        child: Column(
          children: <Widget>[
            buildSearchWidget(),
            buildFilter(),
          ],
        ),
      ),
    );
  }

  Widget buildFilter() {
    return Container(
      padding: EdgeInsets.all(10),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: <Widget>[
          //
          Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              Container(
                margin: EdgeInsets.only(top: 2),
                child: Text(
                  '消费次数',
                  style: TextStyle(color: Colors.blueAccent,fontSize:
                  ScreenUtil.getInstance().setSp(45)),
                ),
              ),

              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                mainAxisSize: MainAxisSize.max,
                children: <Widget>[
                  //todo 这里要做事件监听
                  Stack(
                    children: <Widget>[
                      Positioned(
                        child: Icon(
                          Icons.arrow_drop_up,
                          size: 25,
                          color: Colors.blueAccent,
                        ),
                      ),
                      Positioned(
                        top: 5,
                        child: Icon(
                          Icons.arrow_drop_down,
                          size: 25,
                          color: Colors.black,
                        ),
                      ),
                    ],
                  ),

                ],
              ),
            ],
          ),
          Row(
            children: <Widget>[
              Container(
                margin: EdgeInsets.only(top: 2),
                child: Text(
                  '消费金额',
                  style: TextStyle(color: Colors.blueAccent,fontSize:
                  ScreenUtil.getInstance().setSp(45)),
                ),
              ),
              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                mainAxisSize: MainAxisSize.min,
                children: <Widget>[
                  //这里要做事件监听
                  Stack(
                    children: <Widget>[
                      Positioned(
                        child: Icon(
                          Icons.arrow_drop_up,
                          size: 25,
                          color: Colors.blueAccent,
                        ),
                      ),
                      Positioned(
                        top: 5,
                        child: Icon(
                          Icons.arrow_drop_down,
                          size: 25,
                          color: Colors.black,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ],
          ),
          //
        ],
      ),
    );
  }

  Widget buildSearchWidget() {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(5),
          border: Border.all(color: Colors.black12, width: 1),),
      margin: EdgeInsets.all(10),
      padding: EdgeInsets.all(5),
      child: TextField(
        controller: searchController,
        decoration: InputDecoration(
          icon:Icon(Icons.search) ,
            border: InputBorder.none,
            hintText: "搜索会员手机号或备注信息"),
      ),
    );
  }
}
