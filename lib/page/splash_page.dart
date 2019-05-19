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

    ScreenUtil.instance = ScreenUtil(width: 1080,height: 1920)..init(context);

    Future.delayed(Duration(seconds: 4)).whenComplete((){
      Navigator.pushReplacementNamed(context, 'main_page');
    });


  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Image.network(
      'http://b.hiphotos.baidu.com/image/pic/item/0ff41bd5ad6eddc4802878ba34dbb6fd536633a0.jpg',
      fit: BoxFit.fitHeight,
    );
  }
}














