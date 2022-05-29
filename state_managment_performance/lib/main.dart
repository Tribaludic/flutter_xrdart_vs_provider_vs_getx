import 'package:flutter/material.dart';
import 'package:get/get_navigation/src/root/get_material_app.dart';
import 'package:provider/provider.dart';
import 'package:state_managment_performance/src/getx/getx_page.dart';
import 'package:state_managment_performance/src/provider/provide_list_ttile_controller.dart';
import 'package:state_managment_performance/src/provider/provide_page_controller.dart';
import 'package:state_managment_performance/src/provider/provider_app_bar_text_controller.dart';
import 'package:state_managment_performance/src/provider/provider_page.dart';
import 'package:state_managment_performance/src/rxDart/rx_page.dart';


void main() {
  WidgetsFlutterBinding.ensureInitialized();
  //runApp(const RxApp());
  //runApp(const GetxApp());
  runApp(const ProviderApp());
}

class RxApp extends StatelessWidget {
  const RxApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Rx Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const RxPage(),
    );
  }
}

class GetxApp extends StatelessWidget {
  const GetxApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'Flutter Getx Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: GetxPage(),
    );
  }
}

class ProviderApp extends StatelessWidget {
  const ProviderApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => ProviderListController()),
        ChangeNotifierProvider(create: (_) => ProviderListTileController()),
        ChangeNotifierProvider(create: (_) => ProviderAppBarTextController())
      ],
      child: MaterialApp(
        title: 'Flutter Provider Demo',
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        home: const ProviderPage(),
      ),
    );
  }
}
