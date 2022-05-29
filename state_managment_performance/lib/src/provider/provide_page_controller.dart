import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:state_managment_performance/src/model/tile_data.dart';
import 'package:state_managment_performance/src/provider/provider_app_bar_text_controller.dart';
import 'package:state_managment_performance/src/utils/uttils.dart';

class ProviderListController extends ChangeNotifier {

  final products = <Product>[];

  Future<void> addNewProduct(BuildContext context) async {
    products.add(Product(Utils.generateUniqueId(), Icons.adb, Utils.getRandomName(), 1));
    notifyListeners();
    context.read<ProviderAppBarTextController>().incrementAppBarCounter();
  }

  void  fetchApi(BuildContext context){
    print('fetchApi');
    for(int i=0;i<10000;i++){
      addNewProduct(context);
    }
  }

}
