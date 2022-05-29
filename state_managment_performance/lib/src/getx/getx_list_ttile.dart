import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:state_managment_performance/src/model/tile_data.dart';
import 'getx_page_controller.dart';

class GetxListTile extends StatelessWidget {

  final Product product;
  final GetxPageController controller = Get.find<GetxPageController>();
  late var countObs;
  GetxListTile({required this.product,Key? key}) : super(key: key){
    countObs = product.count.obs;
  }

  @override
  Widget build(BuildContext context) {
    print("reconstruyendo Tile");
    return ListTile(
      leading: Icon(product.iconData),
      title: Text(product.name),
      subtitle: Obx(() {
        print("reconstruyendo text del tile");
        return Text('Count: $countObs');
      },),
      trailing: IconButton(
        icon: const Icon(Icons.add),
        onPressed: addProductCount,
      ),
    );
  }

  Future<void> addProductCount()async{
    product.count++;
    countObs(product.count);
    controller.incrementAppBarCounter();
  }

}
