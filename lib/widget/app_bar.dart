import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';


class AppBarWidget extends StatefulWidget implements PreferredSizeWidget{

  String title = '';
  Widget leftWidget;
  List<Widget> rightWidgets;

  AppBarWidget({this.title,this.leftWidget,this.rightWidgets});

  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return AppBarWidgetState();
  }

  @override
  // TODO: implement preferredSize
  Size get preferredSize => Size.fromHeight(ScreenUtil.getInstance().setHeight(56.0));


  static Widget iconButton({IconData icon,Color color = Colors.white,Function() press}){
    return IconButton(
      padding: EdgeInsets.all(2),
      icon: Icon(icon,color: color,),
      onPressed: press,
    );
  }

}

class AppBarWidgetState extends State<AppBarWidget> {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Container(
      padding: EdgeInsets.only(top: MediaQuery.of(context).padding.top,left: 10,right: 10),
      color: Colors.blue,
      child: Stack(
        children: <Widget>[
          Positioned(
            left: 0,
            height: ScreenUtil.getInstance().setHeight(56),
            child: widget.leftWidget,
          ),

          Container(
            margin: EdgeInsets.symmetric(horizontal:45),
            child: Text(
              widget.title,
              style: TextStyle(fontWeight: ScreenUtil.getInstance().setSp(18),color: Colors.white),
            ),
          ),
          Positioned(
            right: 0,
            height: ScreenUtil.getInstance().setHeight(56),
            child: widget.rightWidgets !=null ? Row(children: widget.rightWidgets,) : null,
          )
        ],
      ),
    );
  }
}


















