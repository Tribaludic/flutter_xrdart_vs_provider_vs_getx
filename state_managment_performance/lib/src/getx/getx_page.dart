import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:state_managment_performance/src/getx/getx_list_ttile.dart';
import 'getx_page_controller.dart';

class GetxPage extends StatelessWidget {

  final GetxPageController pageController = Get.put(GetxPageController());
  GetxPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
          backgroundColor: Colors.white,
          floatingActionButton: FloatingActionButton(
            onPressed: pageController.addNewProduct,
            child: const Icon(Icons.add),
          ),
          appBar: AppBar(
            title: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Text('Getx: '),
                Obx(() {
                  print("reconstruyendo text del appbar");
                  return Text(pageController.appBarCounter.toString());
                })
              ],
            ),
            centerTitle: true,
          ),
          body: Obx(() => ListView.builder(
              itemCount: pageController.products.length,
              itemBuilder: (context, index) {
                print('reconstruyendo lista de tiles');
                return Card(
                  child: GetxListTile(product: pageController.products[index]),
                );
              })),
        ));
  }
}
