import 'package:flutter/material.dart';

class ProviderTileTextController extends ChangeNotifier {

  int unitCounter = 0;
  Future<void> incrementUnitCounter() async {
    unitCounter++;
    notifyListeners();
  }

}
