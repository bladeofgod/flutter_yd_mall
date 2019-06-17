import 'package:flutter/material.dart';
import 'package:camera/camera.dart';
import 'package:flutter_yd_mall/utils/devices_holder.dart';


class ScanGoodsPage extends StatefulWidget{

  List<CameraDescription> cameras = DevicesHolder.singleton.cameras;


  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return ScanGoodsPageState();
  }

}

class ScanGoodsPageState extends State<ScanGoodsPage> with AutomaticKeepAliveClientMixin {

  CameraController controller;

  @override
  void initState() {
    // TODO: implement initState
    try {
      onCameraSelected(widget.cameras[0]);
    } catch (e) {
      print(e.toString());
    }

    super.initState();

  }

  @override
  void dispose() {
    // TODO: implement dispose
    controller?.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build

    if(widget.cameras.isEmpty){
      return Container(
        alignment: Alignment.center,
        padding: EdgeInsets.all(16.0),
        child: Text(
          'No Camera Found',
          style: TextStyle(
            fontSize: 16.0,
            color: Colors.white,
          ),
        ),
      );
    }

    if (!controller.value.isInitialized) {
      return Container(
      );
    }

    return AspectRatio(
      aspectRatio: controller.value.aspectRatio,
      child: Container(
        child: Stack(
          children: <Widget>[
            CameraPreview(controller),
          ],
        ),
      ),
    );


  }



  void onCameraSelected(CameraDescription cameraDescription) async {
    if (controller != null) await controller.dispose();
    controller = CameraController(cameraDescription, ResolutionPreset.medium);

    controller.addListener(() {
      if (mounted) setState(() {});
      if (controller.value.hasError) {
        showMessage('Camera Error: ${controller.value.errorDescription}');
      }
    });

    try {
      await controller.initialize();
    } on CameraException catch (e) {
      showException(e);
    }

    if (mounted) setState(() {});
  }




  void showException(CameraException e) {
    logError(e.code, e.description);
    showMessage('Error: ${e.code}\n${e.description}');
  }

  void showMessage(String message) {
    print(message);
  }

  void logError(String code, String message) =>
      print('Error: $code\nMessage: $message');


  @override
  // TODO: implement wantKeepAlive
  bool get wantKeepAlive => true;
}










