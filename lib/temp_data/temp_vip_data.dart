
import '../model/PurchaseRecordEntity.dart';
import 'package:flutter_yd_mall/model/purchase_entity.dart';
import 'dart:math';

class VipPageTestData{


  static List<PurchaseRecordEntity> getVipData(){
    Random random = Random();
    List<PurchaseRecordEntity> entity = List<PurchaseRecordEntity>
                                        .generate(20, (index){
                                          return PurchaseRecordEntity("jiaqi-$index",
                                          random.nextInt(2)+1,
                                              random.nextInt(3)+1,
                                          random.nextInt(100),random.nextInt(10) * (index+1));
    });

    return entity;

  }

  static List<PurchaseEntity> getPurchaseRecord(){
    Random random = Random();
    List<PurchaseEntity> list = List<PurchaseEntity>
          .generate(20, (index){
            return PurchaseEntity((random.nextInt(100)*100).toDouble(),"${DateTime.now()
            }",random
                .nextInt(3)+1);
    });
    return list;
  }



}