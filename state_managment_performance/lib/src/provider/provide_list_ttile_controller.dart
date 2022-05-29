import 'package:flutter/material.dart';
import 'package:state_managment_performance/src/model/tile_data.dart';

class ProviderListTileController extends ChangeNotifier {

  Future<void> addProductCount(Product product)async{
    product.count++;
    notifyListeners();
  }

}
