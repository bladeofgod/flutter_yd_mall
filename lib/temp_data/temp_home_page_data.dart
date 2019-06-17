
import 'package:flutter_yd_mall/model/merchandise_entity.dart';
import 'dart:math';

class TempHomePageData{


  static List<MerchandiseEntity> getTempData(){
    Random random = new Random();
    List<MerchandiseEntity> entityList = List.generate(10, (index){
      return MerchandiseEntity("测试商品$index",random.nextInt(100).toString(),"a"
          "ssets/"
          "load_fail.png",0);
    });

    return entityList;
  }

}