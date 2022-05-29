import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:state_managment_performance/src/model/tile_data.dart';
import 'package:state_managment_performance/src/utils/uttils.dart';

class GetxPageController extends GetxController {

  final products = [].obs;
  var appBarCounter = 0.obs;

  Future<void> addNewProduct() async {
    products.add(Product(Utils.generateUniqueId(), Icons.adb, Utils.getRandomName(), 1));
    appBarCounter++;
  }

  Future<void> incrementAppBarCounter() async {
    appBarCounter++;
  }

  @override
  onInit(){
    print('on Init()');
    fetchApi();
    super.onInit();
  }

  void  fetchApi(){
    print('fetchApi');
    for(int i=0;i<10000;i++){
      addNewProduct();
    }
  }

}
