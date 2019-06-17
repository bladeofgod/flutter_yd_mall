import 'package:flutter/material.dart';
import 'page/splash_page.dart';
import 'page/main_page.dart';
import 'package:camera/camera.dart';
import 'utils/devices_holder.dart';


Future<Null> main()async{

  try{
    await availableCameras().then((cameraList){
      DevicesHolder.singleton.assembleCameraInfo(cameraList);
    });

  }on CameraException catch (e) {
    //logError(e.code, e.description);
  }

  runApp(MyApp());

}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return MaterialApp(
      title: '宜店商户端',
      theme: ThemeData(
        primaryColor:Colors.deepOrange,
        primarySwatch:Colors.orange,
      ),
      initialRoute: "splash_page",
      routes: {
        "splash_page":(context)=> SplashPage(),
        "main_page":(context)=>MainPage()
      },
    );
  }

}