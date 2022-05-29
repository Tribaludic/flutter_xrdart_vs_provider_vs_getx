import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:state_managment_performance/src/model/tile_data.dart';
import 'package:state_managment_performance/src/provider/provide_list_ttile_controller.dart';
import 'package:state_managment_performance/src/provider/provider_app_bar_text_controller.dart';

class ProviderListTile extends StatelessWidget {

  final Product product;
  const ProviderListTile({required this.product,Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    print("reconstruyendo tile");
    return ListTile(
      leading: Icon(product.iconData),
      title: Text(product.name),
      subtitle: Consumer<ProviderListTileController>(
        builder: (context, snapshot, child) {
          print("reconstruyendo text del tile");
          return Text('Count: ${product.count}');
        }
      ),
      trailing: IconButton(
        icon: const Icon(Icons.add),
        onPressed: () {
          context.read<ProviderListTileController>().addProductCount(product);
          context.read<ProviderAppBarTextController>().incrementAppBarCounter();
        },
      ),
    );
  }

}
