import 'dart:math';
import 'package:uuid/uuid.dart';
class Utils {

  static const String _words =
      'abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ';

  static String getRandomName() {
    Random random = Random();
    String productName = '';
    for (int i = 0; i < 10; i++) {
      productName += _words[random.nextInt(_words.length)];
      if (i == 5) {
        productName += ' ';
      }
    }
    return productName;
  }

  static String generateUniqueId(){
    const uuid = Uuid();
    return uuid.v4();
  }

}
