import 'dart:async';

import 'package:flutter/material.dart';
import 'package:rxdart/rxdart.dart';
import 'package:state_managment_performance/src/model/tile_data.dart';
import 'package:state_managment_performance/src/utils/uttils.dart';

class RxPageController {

  static late RxPageController instance;

  RxPageController(){
    instance = this;
  }

  int appBarCounter = 0;
  final List<Product> products = [];

  final BehaviorSubject<List<Product>> productsBehavior = BehaviorSubject<List<Product>>();
  final BehaviorSubject<int> appBarCounterBehavior = BehaviorSubject<int>();

  Future<void> addNewProduct() async {
    products.add(Product(Utils.generateUniqueId(), Icons.adb, Utils.getRandomName(), 1));
    productsBehavior.add(products);
    appBarCounter++;
    appBarCounterBehavior.add(appBarCounter);
  }


  Future<void> incrementAppBarCounter() async {
    appBarCounter++;
    appBarCounterBehavior.add(appBarCounter);
  }

  void initState(){
    for(int i=0;i<10000;i++){
      addNewProduct();
    }
  }

  void dispose() {
    productsBehavior.close();
    appBarCounterBehavior.close();
  }
}
