import 'package:flutter/material.dart';

class ProviderAppBarTextController extends ChangeNotifier {

  int counter = 0;
  Future<void> incrementAppBarCounter() async {
    counter++;
    notifyListeners();
  }

}
