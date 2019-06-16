import 'package:flutter/material.dart';
import 'package:flutter_easyrefresh/easy_refresh.dart';
import 'package:flutter_yd_mall/model/merchandise_entity.dart';
import 'package:flutter_yd_mall/temp_data/temp_home_page_data.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';


class ChooseGoodsPage extends StatefulWidget{
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return ChooseGoodsPageState();
  }

}

class ChooseGoodsPageState extends State<ChooseGoodsPage> with AutomaticKeepAliveClientMixin {

  TextEditingController _editingController;
  GlobalKey<EasyRefreshState> _easyRefresh ;
  GlobalKey<RefreshHeaderState> _headerKey =
  new GlobalKey<RefreshHeaderState>();
  GlobalKey<RefreshFooterState> _footerKey =
  new GlobalKey<RefreshFooterState>();

  List<MerchandiseEntity> entityList = List();

  double priceSummary = 0;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _editingController = TextEditingController();
    _easyRefresh = GlobalKey();


  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Container(
      child: Column(
        children: <Widget>[
          Container(

            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(5),
              border: Border.all(color: Colors.black12, width: 1),),
            margin: EdgeInsets.all(10),
            child: TextField(
              controller: _editingController,
              decoration: InputDecoration(
                  icon:Icon(Icons.search) ,
                  border: InputBorder.none,
                  hintText: "搜索商品名称"),
            ),
          ),
          Expanded(
            child: EasyRefresh(
              key: _easyRefresh,
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
                  itemCount:entityList.length ,
                  itemBuilder: (context,index){
                    return _buildItem(context,index);
                  }) ,
              onRefresh:()async{
                await Future.delayed(Duration(seconds: 1),(){
                  setState(() {
                    entityList.clear();
                    entityList.addAll(TempHomePageData.getTempData());
                  });
                });
              } ,
              loadMore: ()async{
                await Future.delayed(Duration(seconds: 1),(){
                  if(entityList.length < 50){
                    setState(() {
                      entityList.addAll(TempHomePageData.getTempData());
                    });
                  }
                });
              },
            ),
          ),
          Container(
            height: ScreenUtil.getInstance().setHeight(100),
            child: Row(
              children: <Widget>[
                Expanded(
                  flex: 1,
                  child: Container(
                    alignment: Alignment.centerLeft,
                    color:Colors.white,
                    child: Icon(Icons.shopping_cart,color: Colors.deepOrange,),
                  ),
                ),
                Expanded(
                  flex: 1,
                  child: Container(
                    alignment: Alignment.centerRight,
                    color:Colors.white,
                    child: Text(
                      "￥${priceSummary.toStringAsFixed(2)}"
                    ),
                  ),
                ),
                Expanded(
                  flex: 1,
                  child: Container(
                    alignment: Alignment.center,
                    color:Colors.green,
                    child: Text("结账"),
                  ),
                ),
                Expanded(
                  flex: 1,
                  child: Container(
                    alignment: Alignment.center,
                    color:Colors.orange,
                    child: Text("扫码结账"),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildItem(BuildContext context,index){
    return Container(
      padding: EdgeInsets.all(10),
      height: ScreenUtil.getInstance().setHeight(400),
      child: Row(
        children: <Widget>[
          Image.asset(entityList[index].igmUrl,
            fit: BoxFit.cover,
            width: ScreenUtil.getInstance().setWidth(250),
            height: ScreenUtil.getInstance().setHeight(250),),
          Container(
            width: ScreenUtil.getInstance().setWidth(200),
            margin: EdgeInsets.only(left: 10),
            child: Column(
              children: <Widget>[
                Text(entityList[index].name,
                  style: TextStyle(color: Colors.black,
                      fontSize:ScreenUtil.getInstance().setSp(40),),),
                Text("单价￥${entityList[index].price}",
                  style: TextStyle(color: Colors.black,
                    fontSize:ScreenUtil.getInstance().setSp(20),),),
              ],
            ),
          ),
          Spacer(
            flex: 1,
          ),
          Container(
            padding: EdgeInsets.only(left: 10,right: 10),
            width: ScreenUtil.getInstance().setWidth(300),
            margin: EdgeInsets.symmetric(vertical: 4),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                //-
                GestureDetector(
                  onTap: (){
                    _decrease(entityList[index]);
                  },
                  child: Container(
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      color: Colors.black12,
                    ),
                    child: Text("-",style: TextStyle(fontSize: ScreenUtil.getInstance().setSp(30)),),
                  ),
                ),
                //amount
                Text(
                  "x ${entityList[index].amount}",
                  style: TextStyle(fontSize: ScreenUtil.getInstance().setSp(30)),
                ),
                //+
                GestureDetector(
                  onTap: (){
                    _increase(entityList[index]);
                  },
                  child: Container(
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      color: Colors.black12,
                    ),
                    child: Text("+",style: TextStyle(fontSize: ScreenUtil.getInstance().setSp(30)),),
                  ),
                ),


              ],
            )
          ),
        ],
      ),
    );
  }


  _decrease(MerchandiseEntity entity){
    setState(() {
      if(entity.amount > 0){
        entity.amount--;
        _calculateTotalPrice();
      }
    });
  }

  _increase(MerchandiseEntity entity){
    setState(() {
      entity.amount++;
      _calculateTotalPrice();
    });
  }

  _calculateTotalPrice(){
    entityList.map((entity){
      if(entity.amount != 0){
        setState(() {
          priceSummary += (double.parse(entity.price) * entity.amount);
        });
      }
    });

  }

  @override
  // TODO: implement wantKeepAlive
  bool get wantKeepAlive => true;









}














