import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../constant/constant.dart';
import '../utils/sp_manager.dart';
import '../constant/page_title.dart';
import '../widget/app_bar.dart';
import '../page/vip/vip_page.dart';
import '../page/store/store_page.dart';
import '../page/home/home_page.dart';
import '../utils/no_inkwell.dart';



class MainPage extends StatefulWidget{
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return MainPageState();
  }

}

class MainPageState extends State<MainPage> with SingleTickerProviderStateMixin{

  final GlobalKey<ScaffoldState> _globalKey = new GlobalKey();

  TabController _tabController;


 int currentIndex = 0;
 PageController pageController = PageController(initialPage: 0,keepPage: true);
 DateTime lastPressedAt; //上次点击时间

 var storeName = "惠友测试一店";
 var admin = "超级管理员";
 var adminName =  "李佳奇";
 String userName = "";
  List<String> appBarTitles = [PageTitles.VIP_PAGE,
    PageTitles.SHOP_PAGE];

 @override
  void initState() {
    // TODO: implement initState
    super.initState();

    SpManager.singleton
        .getString(Constant.USER_NAME).then((str){
      userName = str;
      setState(() {
        appBarTitles.insert(1, userName);
      });
    }) ;

    if(userName.isEmpty){
      userName = '测试账号';
      SpManager.singleton.save(Constant.USER_NAME, userName);

    }
    setState(() {
      appBarTitles.insert(1, userName);
    });



    _tabController = new TabController(length: appBarTitles.length,
        vsync:this,initialIndex: currentIndex);

  }



  @override
  Widget build(BuildContext context) {
    // TODO: implement build


    //可监听退出键  其他功能百度
    return WillPopScope(
      child: Scaffold(
        key: _globalKey,
        appBar: AppBar(
          elevation: 0,
          backgroundColor: Colors.blueAccent,
          centerTitle:true ,
          title:Text(appBarTitles[currentIndex]),
          leading: FlatButton(onPressed: (){
            //Scaffold.of(context).openDrawer();
            _globalKey.currentState.openDrawer();
          }, child: Icon(Icons.menu,color: Colors.white,))
        ) ,
        drawer: Drawer(
          child: _buildDrawer(),
        ),
        body: PageView(
          physics: NeverScrollableScrollPhysics(),
          controller: pageController,
          children: <Widget>[
            VipPage(),
            HomePage(),
            StorePage(),
          ],
        ),
        bottomNavigationBar:_bottomNavigationBar()
//        BottomNavigationBar(
//          currentIndex: currentIndex,
//          type: BottomNavigationBarType.fixed,
//          fixedColor: Colors.lightBlue,
//          onTap: (index)=>tap(index),
//          items: [
//            BottomNavigationBarItem(
//              title: Text(appBarTitles[0],),icon:Icon(Icons.person_add)
//            ),
//            BottomNavigationBarItem(
//                title: Text(appBarTitles[1],),icon:Icon(Icons.home)
//            ),
//            BottomNavigationBarItem(
//                title: Text(appBarTitles[2],),icon:Icon(Icons.store)
//            ),
//          ],
//        ),
      ),
      onWillPop: ()async{
        if(lastPressedAt == null || DateTime.now().difference(lastPressedAt)
            >Duration(seconds: 2)){
          lastPressedAt = DateTime.now();
          Fluttertoast.showToast(msg: "再点击一次可退出应用");
          return false;
        }
        return true;
      },
    );
  }

  /*
  * 使用tabbar  解决 水波纹残留的问题
  * */

  Widget _bottomNavigationBar(){
    return Container(
      height: 56,
      width: double.infinity,
      child: TabBar(
        indicatorWeight: 0.0000001,
        onTap: (index)=>tap(index),
        controller: _tabController,
          labelColor:Colors.blue ,
          unselectedLabelColor: Colors.grey,
          tabs: <Widget>[
            bottomItem(Icon(Icons.person_add),Text(appBarTitles[0],)),
            bottomItem(Icon(Icons.home), Text(appBarTitles[1],)),
            bottomItem(Icon(Icons.store),  Text(appBarTitles[2],))
          ],),
    );
  }

  Widget bottomItem(Icon icon,Text text){
    return Container(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          icon,
          text
        ],
      ),
    );
  }


  tap(int index){
   setState(() {
      currentIndex = index;
      pageController.jumpToPage(index);
   });
  }



  Widget _buildDrawer(){
   return Container(
     margin: EdgeInsets.only(top: MediaQuery.of(context).padding.top),
     color: Colors.black,
     child: ListView(
       padding: const EdgeInsets.only(),
    children: <Widget>[
      //头部
      _drawerHeader(),
      //body
      ListTile(
        leading: Icon(Icons.screen_rotation,color: Colors.white,),
        title: Text("横竖屏切换",style: TextStyle(color: Colors.white),),
      ),
      ListTile(
        leading: Icon(Icons.warning,color: Colors.white,),
        title: Text("检查更新",style: TextStyle(color: Colors.white),),
      ),
      ListTile(
        leading: Icon(Icons.help_outline,color: Colors.white,),
        title: Text("帮助",style: TextStyle(color: Colors.white),),
      ),
      ListTile(
        leading: Icon(Icons.contact_phone,color: Colors.white,),
        title: Text("联系我们",style: TextStyle(color: Colors.white),),
      ),
      ListTile(
        leading: Icon(Icons.speaker_notes,color: Colors.white,),
        title: Text("意见反馈",style: TextStyle(color: Colors.white),),
      ),
    ],),
   );
  }



  Widget _drawerHeader(){
   return Container(
     height: ScreenUtil.getInstance().setHeight(500),
     padding: EdgeInsets.all(8),
     child: Row(
       mainAxisAlignment: MainAxisAlignment.spaceAround,
       children: <Widget>[
         Container(
           alignment: Alignment.centerLeft,
           child: CircleAvatar(
             backgroundImage: AssetImage("assets/drawable-xhdpi/icon_man.jpg",),
           ),
         ),
         Column(
           mainAxisAlignment: MainAxisAlignment.center,
           children: <Widget>[
             //店铺名字
             Text(
               "$storeName",
               style: TextStyle(color: Colors.white),
             ),
             //name
             Text(
               "$admin   $adminName",
               style: TextStyle(color: Colors.white),
             ),
           ],
         ),
//         Expanded(
//           flex: 1,
//         ),
         Icon(
           Icons.arrow_forward_ios,
           color: Colors.white,
         )
       ],
     ),
   );
  }

}



















