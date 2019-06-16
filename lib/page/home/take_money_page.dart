
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'take.money/shortcut_page.dart';
import 'take.money/scan_goods_page.dart';
import 'take.money/choose_coupon_page.dart';
import 'take.money/choose_goods_page.dart';


class TakeMoneyPage extends StatefulWidget{

  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return TakeMoneyPageState();
  }

}

class TakeMoneyPageState extends State<TakeMoneyPage> with SingleTickerProviderStateMixin {

  TabController _tabController;

  int currentIndex = 1;
  static const  List<String> tabTitle = [
    "快捷","选商品","扫商品","选卷"
  ];

  TextEditingController _editingController;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _tabController = TabController(length: 4, vsync: this,initialIndex: currentIndex);
    _editingController = TextEditingController();
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
        backgroundColor: Colors.white,
        elevation: 0,
        leading: IconButton(icon: Icon(Icons.arrow_back_ios,color: Colors
            .black,), onPressed: ()=>Navigator.pop(context)),
        title: Text("收款",style: TextStyle(color: Colors.black),),
        centerTitle: true,
      ),
      body: Container(
        child:Column(
          children: <Widget>[
            Container(
              height: ScreenUtil.getInstance().setHeight(150),
              padding: EdgeInsets.symmetric(vertical: 10,horizontal: 10),
              decoration: BoxDecoration(
                color: Colors.white,
                border: Border(
                  top: BorderSide(color: Colors.black12,width: 1),
                  bottom: BorderSide(color: Colors.black12,width: 1)
                ),
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  Container(
                    width: ScreenUtil.getInstance().setWidth(800),
                    child: TextField(
                      controller: _editingController,
                      decoration: InputDecoration(
                          hintText: "请填写用户手机号或宜店号",
                          border: InputBorder.none
                      ),
                    ),
                  ),
                  Container(
                    padding: EdgeInsets.all(4),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      border: Border.all(color: Colors.redAccent,width: 1),
                      borderRadius: BorderRadius.circular(5),
                      boxShadow: <BoxShadow>[
                    BoxShadow(color: Colors.grey[300],offset: Offset(1, 1),blurRadius: 2,),
                    BoxShadow(color: Colors.grey[300], offset: Offset(-1, -1), blurRadius: 2),
                    BoxShadow(color: Colors.grey[300], offset: Offset(1, -1), blurRadius: 2),
                    BoxShadow(color: Colors.grey[300], offset: Offset(-1, 1), blurRadius: 2)
                      ],
                    ),
                    child: Text("查询"),
                  ),
                ],
              ),
            ),

            //tab area
            Container(
              height: ScreenUtil.getInstance().setHeight(150),
              child:TabBar(
                labelColor: Colors.green,
                unselectedLabelColor: Colors.grey,
                onTap: (index)=>_tabTap,
                tabs: tabTitle.map((title){
                  return Tab(text: title,);
                }).toList(),
                controller: _tabController,
                isScrollable: false,
                indicatorColor: Colors.green,
              ),
            ),

            Expanded(
              child: Container(
                child: TabBarView(
                  physics: NeverScrollableScrollPhysics(),
                  controller: _tabController,
                  children: <Widget>[
                    ShortcutPage(),
                    ChooseGoodsPage(),
                    ScanGoodsPage(),
                    ChooseCouponPage()
                  ],
                ),
              ),
            ),

          ],
        ),
      ),
    );
  }
  
  _tabTap(int index){
    setState(() {
      currentIndex = index;
      _tabController.animateTo(index);
    });
  }


}




















