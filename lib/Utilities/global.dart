import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/foundation.dart';
import 'package:shared_preferences/shared_preferences.dart';

class Global {

  static SharedPreferences? prefs;
  String appName = 'Gentle Birth Method';

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

  static Future<void> getPreferences() async {
    if (prefs == null) {
      prefs = await SharedPreferences.getInstance();
    }
  }

  validateToken(var setToken) async {
    try {
      var currentToken;
      final localToken = await getFirebaseToken();
      if (setToken != null) {
        currentToken = setToken;
      } else {
        currentToken = await FirebaseMessaging.instance.getToken();
        print('-------------------------$currentToken & $localToken');
      }
      if (localToken != currentToken) {
        print('hai');
        await saveFirebaseToken(currentToken);
      }
    } catch (e) {
      print('error ======= $e');
    }
  }

  saveFirebaseToken(var currentToken) async {
    try {
      await Global.getPreferences();
      print('current token === $currentToken');
      Global.prefs!.setString("firebaseToken", currentToken);
    } catch (e) {
      if (kDebugMode) {
        print("validateToken ${currentToken}");
      }
    }
  }

  static Future<String> getFirebaseToken() async {
    await getPreferences();
    String? firebaseToken = prefs!.getString("firebaseToken");
    print('object---$firebaseToken');
    return firebaseToken ?? "";
  }

  listenForTokenUpdate() {
    try {
      FirebaseMessaging.instance.onTokenRefresh.listen((currentToken) {
        print('========================$currentToken');
        validateToken(currentToken);
      });
    } catch (e) {
      print('error == $e');
    }
  }


}