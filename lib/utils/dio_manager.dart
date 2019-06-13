import 'package:cookie_jar/cookie_jar.dart';
import 'package:dio/dio.dart';
import 'dart:convert';
import 'package:flutter_yd_mall/temp_data/temp_vip_data.dart';
import 'package:flutter_yd_mall/model/PurchaseRecordEntity.dart';

class DioManager{
  Dio _dio;

  DioManager._internal(){
    //can set some options
    _dio = new Dio();


  }

  static DioManager singleton = DioManager._internal();

  factory DioManager() => singleton;

  get dio{
    return _dio;
  }


  Future<List<PurchaseRecordEntity>> getTestData()async{
    List<PurchaseRecordEntity> response = List();
    await  Future.delayed(Duration(seconds: 1),(){
      response.addAll(VipPageTestData.getVipData()) ;
    });

    return response;

  }

}





















