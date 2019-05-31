import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';


class SplashPage extends StatefulWidget{
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return SplashPageState();
  }

}

class SplashPageState extends State<SplashPage> {


  @override
  void initState() {
    // TODO: implement initState
    super.initState();



    Future.delayed(Duration(seconds: 2)).whenComplete((){
      Navigator.pushReplacementNamed(context, 'main_page');
    });

  }

  @override
  void didChangeDependencies() {
    // TODO: implement didChangeDependencies
    super.didChangeDependencies();
    ScreenUtil.instance = ScreenUtil(width: 1080,height: 1920)..init(context);
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Image.asset("assets/welcome_bg.png",fit: BoxFit.fitHeight,);
  }
}














