import 'package:flutter/material.dart';
import '../constant/constant.dart';
import '../utils/sp_manager.dart';
import '../constant/page_title.dart';
import '../widget/app_bar.dart';



class MainPage extends StatefulWidget{
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return MainPageState();
  }

}

class MainPageState extends State<MainPage> {

 var appBarTitles;
 int currentIndex;
 PageController pageController = PageController(initialPage: 0,keepPage: true);
 DateTime lastPressedAt; //上次点击时间

 @override
  void initState() {
    // TODO: implement initState
    super.initState();
    var userName;
    if(SpManager.singleton
        .getString(Constant.USER_NAME) == null ){
      userName = '测试账号';
      SpManager.singleton.save(Constant.USER_NAME, userName);
    }else{
      userName = SpManager.singleton
          .getString(Constant.USER_NAME) ;
    }

    appBarTitles = [PageTitles.VIP_PAGE,userName,PageTitles.SHOP_PAGE];

  }



  @override
  Widget build(BuildContext context) {
    // TODO: implement build


    //可监听退出键  其他功能百度
    return WillPopScope(
      child: Scaffold(
        appBar: AppBarWidget(
          title: appBarTitles[currentIndex],
          leftWidget: ,),
      ),
    );
  }
}



















