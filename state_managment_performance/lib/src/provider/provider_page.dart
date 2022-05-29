import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:state_managment_performance/src/provider/provide_page_controller.dart';
import 'package:state_managment_performance/src/provider/provider_app_bar_text_controller.dart';
import 'package:state_managment_performance/src/provider/provider_list_ttitle.dart';


class ProviderPage extends StatefulWidget {

  const ProviderPage({Key? key}) : super(key: key);

  @override
  State<ProviderPage> createState() => _ProviderPageState();
}

class _ProviderPageState extends State<ProviderPage> {

  @override
  initState(){
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback(onPostBuild);
  }

  void onPostBuild(Duration duration){
    context.read<ProviderListController>().fetchApi(context);
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
          backgroundColor: Colors.white,
          floatingActionButton: FloatingActionButton(
            onPressed: () => context.read<ProviderListController>().addNewProduct(context),
            child: const Icon(Icons.add),
          ),
          appBar: AppBar(
            title: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Text('Provider: '),
                Consumer<ProviderAppBarTextController>(
                  builder: (context, snapshot, child) {
                    print("reconstruyendo text del appbar");
                    return Text(snapshot.counter.toString());
                  }
                )
              ],
            ),
            centerTitle: true,
          ),
          body: Consumer<ProviderListController>(
            builder: (context, snapshot, child) {
              print("reconstruyendo lista de tiles");
              return ListView.builder(
                  itemCount: snapshot.products.length,
                  itemBuilder: (context, index) {
                    return Card(
                      child: ProviderListTile(product: snapshot.products[index]),
                    );
                  });
            }
          ),
        ));
  }
}
