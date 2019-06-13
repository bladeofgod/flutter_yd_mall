
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';


class TakeMoneyPage extends StatefulWidget{

  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return TakeMoneyPageState();
  }

}

class TakeMoneyPageState extends State<TakeMoneyPage> with SingleTickerProviderStateMixin {

  TabController _tabController;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _tabController = TabController(length: 4, vsync: this);
  }
  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    _tabController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(icon: Icon(Icons.arrow_back_ios,color: Colors
            .black,), onPressed: ()=>Navigator.pop(context)),
        title: Text("收款",style: TextStyle(color: Colors.black),),
        centerTitle: true,
      ),
      body: Container(
        child:Column(
          children: <Widget>[

            Container(
              height: ScreenUtil.getInstance().setHeight(100),
              margin: EdgeInsets.symmetric(vertical: 4),
              decoration: BoxDecoration(
                border: Border(
                  top: BorderSide(color: Colors.black12,width: 1),
                  bottom: BorderSide(color: Colors.black12,width: 1)
                ),
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  Text("请填写用户手机号或宜店号"),
                  Container(
                    padding: EdgeInsets.all(4),
                    decoration: BoxDecoration(
                      border: Border.all(color: Colors.redAccent,width: 1)
                    ),
                    child: Text("查询"),
                  ),
                ],
              ),
            ),

            //tab area

            Container(),

          ],
        ),
      ),
    );
  }


}




















