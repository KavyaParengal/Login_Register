import 'package:flutter/foundation.dart';

class Global {

  String appName = 'Gentle Birth';

  String capitalizeAllWord(String? value) {
    var result = "";
    if (value != null && value.toString().trim().isNotEmpty) {
      result = value[0].toUpperCase();
      try {
        for (int i = 1; i < value.length; i++) {
          if (value[i - 1] == " ") {
            result = result + value[i].toUpperCase();
          } else {
            result = result + value[i];
          }
        }
      } catch (e) {
        if (kDebugMode) {
          print(e);
        }
      }
    }
    return result;
  }

}