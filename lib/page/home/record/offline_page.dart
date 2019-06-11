
import 'package:flutter/material.dart';
import 'package:flutter_easyrefresh/easy_refresh.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_yd_mall/temp_data/temp_vip_data.dart';
import 'package:flutter_yd_mall/model/PurchaseRecordEntity.dart';


/*
* 收款订单
* 线下
*
* */



class OfflinePage extends StatefulWidget{

  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return OfflinePageState();
  }

}

class OfflinePageState extends State<OfflinePage> {

  ScrollController _scrollController ;
  TextEditingController searchController;
  List<PurchaseRecordEntity> _listPurchase = new List();

  bool _isAppBarVisible = true;
  double headerHeight = 300;

  GlobalKey<EasyRefreshState> _easyKey = GlobalKey();
  GlobalKey<RefreshHeaderState> _headerKey =
  new GlobalKey<RefreshHeaderState>();
  GlobalKey<RefreshFooterState> _footerKey =
  new GlobalKey<RefreshFooterState>();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _scrollController = ScrollController();
    searchController = TextEditingController();
    _scrollController.addListener((){
      if(_scrollController.offset < headerHeight && !_isAppBarVisible){
        setState(() {
          _isAppBarVisible = true;
        });
      }else if(_scrollController.offset > headerHeight && _isAppBarVisible){
        setState(() {
          _isAppBarVisible = false;
        });
      }
    });
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    _scrollController.dispose();
    searchController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      body: Container(
        height: double.infinity,
        margin: EdgeInsets.only(top: MediaQuery.of(context).padding.top),
        child: Stack(
          children: <Widget>[
          EasyRefresh(
          key: _easyKey,
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
          child:ListView.builder(
            controller: _scrollController,
            itemCount: _listPurchase.length +1,
            itemBuilder: (context,index){
              return _buildItem(context,index);
            },
          ),
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
        ),
            //float app bar
            Offstage(
              offstage: _isAppBarVisible,
              child: Container(
                width: double.infinity,
                color: Colors.lightBlue,
                padding: EdgeInsets.only(left: 8,right: 8,top: 8,bottom: 6),
                height: ScreenUtil.getInstance().setHeight(130),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: <Widget>[
                    _buildAppBarColumn("今日", "0.00"),
                    _buildAppBarColumn("本周", "175.00"),
                    _buildAppBarColumn("本月", "2565.00"),
                    Icon(Icons.dashboard,color: Colors.white,),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
      endDrawer: Drawer(
        child: _buildDrawer(),
      ),
    );
  }
  //list item

  _onItemTap(){}

  Widget _buildItem(BuildContext context,int index){
    if(index == 0 ){
      //header
      return Container(
        height: 400,
        decoration: BoxDecoration(
          image: DecorationImage(image: AssetImage("assets/icon_bg_vip.png"),
              fit: BoxFit.fill),
        ),
        child: Column(
          children: <Widget>[
            //app bar
            Container(
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
              padding: EdgeInsets.only(top: 10,bottom: 10),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget>[
                  Text(
                    "今日收入/共0笔",style: TextStyle(color: Colors.white,fontSize:
                  ScreenUtil.getInstance().setSp(30)),
                  ),
                  Text(
                    "0.00",style: TextStyle(color: Colors.white,fontSize:
                  ScreenUtil.getInstance().setSp(40)),
                  ),
                ],
              ),
            ),
            //本周 本月
            Container(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget>[
                  Column(
                    children: <Widget>[
                      _buildAppBarColumn("本周", "175.00"),
                      Container(
                        color: Colors.black12,
                        width: 1,
                        height: double.infinity,

                      ),
                      _buildAppBarColumn("本月", "2565.00"),
                    ],
                  )
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
      );
    }else{
      //item
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
                                "${_listPurchase[index+1].name}",
                                style: TextStyle(color: Colors.black,fontSize: ScreenUtil.getInstance().setSp(40)),
                              ),
                              judgeAccountType(_listPurchase[index+1]),
                            ],
                          ),
                        ),
                        //attribute
                        Row(
                          children: <Widget>[
                            _listPurchase[index+1].customerType == 1
                                ? _buildAttrBox("储值用户") : _buildAttrBox("现金用户"),
                            _buildAttrBox("消费${_listPurchase[index+1]
                                .purchaseCount}次"),

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
                        "消费累计：${_listPurchase[index+1].purchaseAmountSum *
                            100} 元",
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


  }

  Widget buildSearchWidget() {
    return Row(
      children: <Widget>[
        Container(
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
        ),
        GestureDetector(
          //TODO search
          onTap: (){},
          child: Container(
            padding: EdgeInsets.all(4),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(2),
              border: Border.all(color: Colors.lightBlue),
            ),
            child: Text("查询",style: TextStyle(color: Colors.lightBlue),),
          ),
        ),
      ],
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
  
  // drawer 


  Widget _buildDrawer(){
    return Container(
      padding: EdgeInsets.only(left: 8,right: 8,top: 8),
      child: Text("drawer open"),
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

















