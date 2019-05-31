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



class MainPage extends StatefulWidget{
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return MainPageState();
  }

}

class MainPageState extends State<MainPage> {

  final GlobalKey<ScaffoldState> _globalKey = new GlobalKey();

 var appBarTitles;
 int currentIndex = 0;
 PageController pageController = PageController(initialPage: 0,keepPage: true);
 DateTime lastPressedAt; //上次点击时间

 var storeName = "惠友测试一店";
 var admin = "超级管理员";
 var adminName =  "杨晋";
 String userName = "";

 @override
  void initState() {
    // TODO: implement initState
    super.initState();

    SpManager.singleton
        .getString(Constant.USER_NAME).then((str){
      userName = str;
      setState(() {

      });
    }) ;

    if(userName.isEmpty){
      userName = '测试账号';
      SpManager.singleton.save(Constant.USER_NAME, userName);

    }
    setState(() {

    });


  }



  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    appBarTitles = [PageTitles.VIP_PAGE,
      userName,
      PageTitles.SHOP_PAGE];

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
        bottomNavigationBar: BottomNavigationBar(
          currentIndex: currentIndex,
          type: BottomNavigationBarType.fixed,
          fixedColor: Colors.lightBlue,
          onTap: (index)=>tap(index),
          items: [
            BottomNavigationBarItem(
              title: Text(appBarTitles[0],),icon:Icon(Icons.person_add)
            ),
            BottomNavigationBarItem(
                title: Text(appBarTitles[1],),icon:Icon(Icons.home)
            ),
            BottomNavigationBarItem(
                title: Text(appBarTitles[2],),icon:Icon(Icons.store)
            ),
          ],
        ),
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



















