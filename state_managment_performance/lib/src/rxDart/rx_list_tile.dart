import 'package:flutter/material.dart';
import 'package:rxdart/rxdart.dart';
import 'package:state_managment_performance/src/model/tile_data.dart';
import 'package:state_managment_performance/src/rxDart/rx_page_controller.dart';

class RxListTile extends StatefulWidget {

  final Product product;
  const RxListTile({required this.product, Key? key}) : super(key: key);
  @override
  State<RxListTile> createState() => _RxListTileState();
}

class _RxListTileState extends State<RxListTile> {
  final BehaviorSubject<int> countBehavior =  BehaviorSubject<int>();

  @override
  Widget build(BuildContext context) {
    print("reconstruyendo Tile");
    return ListTile(
      leading: Icon(widget.product.iconData),
      title: Text(widget.product.name),
      subtitle: StreamBuilder<int>(
          stream: countBehavior.stream,
          initialData: widget.product.count,
          builder: (context, snapshot) {
            print("reconstruyendo text del tile");
            return Text('Count: ${snapshot.data}');
          }),
      trailing: IconButton(
        icon: const Icon(Icons.add),
        onPressed: addProductCount,
      ),
    );
  }

  Future<void> addProductCount()async{
    widget.product.count++;
    countBehavior.add(widget.product.count);
    RxPageController.instance.incrementAppBarCounter();
  }

  @override
  void dispose() {
    countBehavior.close();
    super.dispose();
  }


}
