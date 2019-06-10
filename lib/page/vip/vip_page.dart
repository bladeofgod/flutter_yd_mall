import 'package:flutter/material.dart';
import 'dart:async';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_easyrefresh/easy_refresh.dart';
import 'package:flutter_yd_mall/temp_data/temp_vip_data.dart';
import 'package:flutter_yd_mall/model/PurchaseRecordEntity.dart';
import 'package:flutter_yd_mall/utils/dio_manager.dart';
import 'detail/vip_detail_page.dart';



class VipPage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return VipPageState();
  }
}

class VipPageState extends State<VipPage> {

  TextEditingController searchController;

  GlobalKey<EasyRefreshState> _globalKey = new GlobalKey();
  GlobalKey<RefreshHeaderState> _headerKey =
  new GlobalKey<RefreshHeaderState>();
  GlobalKey<RefreshFooterState> _footerKey =
  new GlobalKey<RefreshFooterState>();

  List<PurchaseRecordEntity> _listPurchase = new List();


  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    searchController = new TextEditingController();
    //_onRefresh();
  }
  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    searchController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    _listPurchase.addAll(VipPageTestData.getVipData());
    // TODO: implement build
    return Scaffold(
      body: Container(
        child: Column(
          children: <Widget>[
            buildSearchWidget(),
            buildFilter(),
            Container(
              height: 1,
              color: Colors.black12,
            ),
            //listview
            Expanded(
              flex: 1,
              child: _buildListView(),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildNewLV(){
    return ListView.builder(
      itemCount: _listPurchase.length,
      itemBuilder: (BuildContext context,int index){
        return _buildItem(context, index);
      },
    );
  }

  _onRefresh(){
    DioManager.singleton.getTestData().then((result){
      setState(() {
        _listPurchase.clear();
        _listPurchase.addAll(result);
      });
    });

  }

  _loadMore(){

    DioManager.singleton.getTestData().then((result){
      if(_listPurchase.length<100){
        setState(() {
          _listPurchase.addAll(result);
        });
      }
    });

  }



  Widget _buildListView(){
    return EasyRefresh(
      key: _globalKey,
      autoLoad: false,
      firstRefresh: true,
      behavior: ScrollBehavior(),
      refreshHeader: ClassicsHeader(
        key: _headerKey,
        refreshedText:"刷新完成" ,
        refreshReadyText: "释放刷新数据",
        refreshText: "下拉刷新",
        refreshingText: "刷新中...",
        bgColor: Colors.transparent,
        textColor: Colors.black87,
        moreInfoColor: Colors.black54,
        showMore: true,
      ),
      refreshFooter: ClassicsFooter(
        key: _footerKey,
        loadedText: "加载完成",
        loadReadyText: "释放加载数据",
        loadingText: "加载中...",
        loadText: "上拉加载更多",
        noMoreText: "没有更多数据了",
        bgColor: Colors.transparent,
        textColor: Colors.black87,
        moreInfoColor: Colors.black54,
        showMore: true,
      ),
      child: ListView.builder(
        itemCount: _listPurchase.length,
        itemBuilder: (BuildContext context,int index){
          return _buildItem(context,index);
        },
      ),
//  todo need resolve this bug
//      onRefresh: _onRefresh,
//      loadMore: _loadMore,
      onRefresh: ()async{
        await new Future.delayed(Duration(seconds: 1),(){
          setState(() {
            _listPurchase.clear();
            _listPurchase.addAll(VipPageTestData.getVipData());
          });
        });
      },
      loadMore: ()async{
        await new Future.delayed(Duration(seconds: 1),(){
          if(_listPurchase.length<100){
            setState(() {
              _listPurchase.addAll(VipPageTestData.getVipData());
            });
          }
        });
      },
    );
  }
  
  _onItemTap(){
    Navigator.of(context).push(MaterialPageRoute(builder: (context){
      return new VipDetailPage();
    }));
  }

  Widget _buildItem(BuildContext context,int index){
    return GestureDetector(
      onTap: _onItemTap,
      child: Container(
        child: Column(
          children: <Widget>[
            Container(
              margin: EdgeInsets.only(left: 8,right: 8,top: 6,bottom: 6),
              child: Row(
                children: <Widget>[
                  //avatar
                  Container(
                    decoration: BoxDecoration(
                        border: Border.all(color: Colors.black12,width: 1),
                        shape: BoxShape.circle
                    ),
                    child: Icon(
                      Icons.person_outline,color: Colors.lightBlue,
                      size: 40,
                    ),
                  ),
                  //info
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      //name & account type
                      Container(
                        margin: EdgeInsets.only(left: 6),
                        child: Row(
                          children: <Widget>[
                            Text(
                              "${_listPurchase[index].name}",
                              style: TextStyle(color: Colors.black,fontSize: ScreenUtil.getInstance().setSp(40)),
                            ),
                            judgeAccountType(_listPurchase[index]),
                          ],
                        ),
                      ),
                      //attribute
                      Row(
                        children: <Widget>[
                          _listPurchase[index].customerType == 1
                              ? _buildAttrBox("储值用户") : _buildAttrBox("现金用户"),
                          _buildAttrBox("消费${_listPurchase[index].purchaseCount}次"),

                        ],
                      ),

                    ],
                  ),
                  Spacer(
                    flex: 1,
                  ),

                  //purchase amount summary
                  Container(
                    alignment: Alignment.topCenter,
                    child: Text(
                      "消费累计：${_listPurchase[index].purchaseAmountSum * 100} 元",
                      style: TextStyle(color: Colors.black,fontSize: ScreenUtil.getInstance().setSp(40)),
                    ),
                  ),
                ],
              ),
            ),
            //divider
            Container(
              width: double.infinity,
              height: 1,
              color: Colors.black12,
            ),
          ],
        ),
      ),
    );
  }


  Widget _buildAttrBox(String tag){

    return Container(
      margin: EdgeInsets.only(left: 4,right: 4),
      padding: EdgeInsets.all(2),
      decoration: BoxDecoration(
        border: Border.all(color: Colors.lightBlueAccent,width: 1),
        borderRadius: BorderRadius.circular(4),
      ),
      child: Text(tag,style: TextStyle(color: Colors.lightBlue,fontSize: ScreenUtil.getInstance().setSp(40)),),
    );

  }


  Icon judgeAccountType(PurchaseRecordEntity entity){
    switch(entity.accountType){
      case 1:
        return Icon(Icons.star,color: Colors.red,);
      case 2:
        return Icon(Icons.question_answer,color: Colors.greenAccent,);
      case 3:
        return Icon(Icons.attach_money,color: Colors.lightBlue,);
    }
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
                          color: Colors.black38,
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
                          color: Colors.black38,
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
