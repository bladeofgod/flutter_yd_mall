import 'package:flutter/material.dart';



class VipPage extends StatefulWidget{
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return VipPageState();
  }

}

class VipPageState extends State<VipPage> {

  TextEditingController searchController;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    searchController = new TextEditingController();
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      body: Container(
        child: Column(
          children: <Widget>[
            buildSearchWidget(),
            buildFilter(),
          ],
        ),
      ),
    );
  }

  Widget buildFilter(){
    return Container(
      height: 100,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: <Widget>[
          //
          Column(
            children: <Widget>[
              Text(
                '消费次数',
                style: TextStyle(color: Colors.blueAccent),
              ),
              Column(
                children: <Widget>[
                  //这里要做事件监听
                  Icon(Icons.arrow_drop_up,color: Colors.blueAccent,),
                  Icon(Icons.arrow_drop_down,color: Colors.white,),
                ],
              ),
            ],
          ),
          //
          Column(
            children: <Widget>[
              Text(
                '消费金额',
                style: TextStyle(color: Colors.blueAccent),
              ),
              Column(
                children: <Widget>[
                  //这里要做事件监听
                  Icon(Icons.arrow_drop_up,color: Colors.blueAccent,),
                  Icon(Icons.arrow_drop_down,color: Colors.white,),
                ],
              ),
            ],
          )
        ],
      ),
    );
  }

  Widget buildSearchWidget(){
    return Container(
      height: 50,
      decoration: BoxDecoration(
        border: Border.all(color: Colors.black12,width: 1)
      ),
      padding: EdgeInsets.all(5),
      child: Row(
        children: <Widget>[
          Icon(Icons.search),
          TextField(
            controller: searchController,
            decoration: InputDecoration(
              hintText: "搜索会员手机号或备注信息"
            ),
          )
        ],
      ),
    );

  }

}

















