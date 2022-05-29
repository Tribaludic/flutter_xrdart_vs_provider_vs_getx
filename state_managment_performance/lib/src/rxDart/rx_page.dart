import 'package:flutter/material.dart';
import 'package:state_managment_performance/src/model/tile_data.dart';
import 'package:state_managment_performance/src/rxDart/rx_list_tile.dart';
import 'package:state_managment_performance/src/rxDart/rx_page_controller.dart';

class RxPage extends StatefulWidget {
  const RxPage({Key? key}) : super(key: key);

  @override
  State<RxPage> createState() => _RxPageState();
}

class _RxPageState extends State<RxPage> {

  final RxPageController pageController = RxPageController();

  @override
  initState(){
    super.initState();
    pageController.initState();
  }

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
            const Text('RxDart: '),
                StreamBuilder<int>(
                stream: pageController.appBarCounterBehavior.stream,
                initialData: pageController.appBarCounter,
                builder: (context, snapshot) {
                  print("reconstruyendo text del appbar");
                return Text(snapshot.data!.toString());
              }
            )
          ],
        ),
        centerTitle: true,
      ),
      body: StreamBuilder<List<Product>>(
          stream: pageController.productsBehavior.stream,
          initialData:  const [],
          builder: (context, snapshot) {
            return ListView.builder(
                itemCount: snapshot.data!.length,
                itemBuilder: (context, index) {
                  print("reconstruyendo Lista");
                  return Card(
                    child: RxListTile(product: snapshot.data![index],),
                  );
                });
          }),
    ));
  }

  @override
  void dispose() {
    pageController.dispose();
    super.dispose();
  }
}
