
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:login_register/Admin-Dashboard/Api_services/add_notification_api.dart';
import 'package:login_register/Client-Dashboard/Screens/view_notifications.dart';
import 'package:login_register/main.dart';

import '../../Utilities/colors.dart';

class AddNotification extends StatefulWidget {
  const AddNotification({super.key});

  @override
  State<AddNotification> createState() => _AddNotificationState();
}

class _AddNotificationState extends State<AddNotification> {

  bool _isLoading = false;
  String? mtoken = '';
  TextEditingController titleController=TextEditingController();
  TextEditingController descriptionController=TextEditingController();

  Future<void> _addOffer(String title, String description) async{
    try{
      CollectionReference users = FirebaseFirestore.instance.collection('Offers');
      await users
          .add({
        'title': title,
        'description': description,
        'timestamp': DateTime.now().millisecondsSinceEpoch,
      });
    }catch (e) {
      print('Error adding task: $e');
    }
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    requestPermission();
    getToken();
    initInfo();
  }

  initInfo() async{
    var androidInitialize = const AndroidInitializationSettings('@mipmap/ic_launcher');
    var iOSInitialize = const IOSInitializationSettings();
    var initializationSettings = InitializationSettings(android: androidInitialize, iOS: iOSInitialize);
    flutterLocalNotificationsPlugin.initialize(initializationSettings, onSelectNotification: (String? payload) async{
      try{
        if(payload != null && payload.isNotEmpty){
          Navigator.push(context, MaterialPageRoute(builder: (context) => ViewNotification()));
        }else{

        }
      }catch(e){

      }
      return;
    });
    FirebaseMessaging.onMessage.listen((RemoteMessage message) async{
      print('........... onMessage.........');
      print('onMessage: ${message.notification?.title}/${message.notification?.body}');
      BigTextStyleInformation bigTextStyleInformation = BigTextStyleInformation(
        message.notification!.body.toString(), htmlFormatBigText: true,
        contentTitle: message.notification!.title.toString(), htmlFormatContentTitle: true
      );
      AndroidNotificationDetails androidPlatformChannelSpecifics = AndroidNotificationDetails(
          'high_importance_channel', // id
          'High Importance Notifications', // title
          importance: Importance.high,
          styleInformation: bigTextStyleInformation,
          priority: Priority.high,
          playSound: true
      );
      NotificationDetails platformChannelSpecifics = NotificationDetails(android: androidPlatformChannelSpecifics);
      await flutterLocalNotificationsPlugin.show(0, message.notification?.title,
          message.notification?.body,
          platformChannelSpecifics,
          payload: message.data['body']
      );
    });
  }

  void requestPermission() async{
    FirebaseMessaging messaging = FirebaseMessaging.instance;
    NotificationSettings settings = await messaging.requestPermission(
      alert: true,
      announcement: false,
      badge: true,
      carPlay: false,
      criticalAlert: false,
      provisional: false,
      sound: true
    );
    if(settings.authorizationStatus == AuthorizationStatus.authorized){
      print('User granted permission');
    }else if(settings.authorizationStatus == AuthorizationStatus.provisional){
      print('User granted provisional permission');
    }else{
      print('User declined or has not accepted permission');
    }
  }

  void getToken() async{
    await FirebaseMessaging.instance.getToken().then(
        (token){
          setState(() {
            mtoken = token;
            print('My token is $mtoken');
          });
          saveToken(token!);
        });
  }
  void saveToken(String token) async{
    await FirebaseFirestore.instance.collection('UserTokens').add({
      'token': token
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(60),
        child: AppBar(
          flexibleSpace: Container(
            decoration: BoxDecoration(
                gradient: LinearGradient(
                    colors: [Colors.teal.shade500, Colors.teal.shade500, Colors.black]
                )
            ),
          ),
          leading: IconButton(
              onPressed: (){
                Navigator.pop(context);
              },
              icon: Icon(Icons.arrow_back, color: Colors.white,)
          ),
          elevation: 0,
          title: Text(
            'Add Notification',
            style: GoogleFonts.poppins(
              fontSize: 20,
              fontWeight: FontWeight.bold,
              color: Colors.white,
            ),
            textAlign: TextAlign.start,
          ),
        ),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: TextFormField(
              controller: titleController,
              decoration: InputDecoration(
                  hintText: "Title",
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(12)
                  )
              ),
            ),
          ),

          const SizedBox(height: 10,),

          Padding(
            padding: const EdgeInsets.all(8.0),
            child: TextFormField(
              controller: descriptionController,
              decoration: InputDecoration(
                  hintText: "Description",
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(12)
                  )
              ),
            ),
          ),

          const SizedBox(height: 36,),

          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Container(
              width: MediaQuery.of(context).size.width,
              child: ElevatedButton(onPressed: () async{
                String title = titleController.text;
                String description = descriptionController.text;
                if(title != "" && description != ""){
                  setState(() {
                    _isLoading = true;
                  });
                  await NotificationAPI.sendNotification(context, title, description);
                  setState(() {
                    _isLoading = false;
                  });
                }
              },
                  style: ElevatedButton.styleFrom(backgroundColor: button, fixedSize: const Size(300, 55),shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12.0)),),
                  child: _isLoading ? CircularProgressIndicator(color: Colors.white,) : Text("Add",style: TextStyle(fontSize: 17, color: Colors.white),)),
            ),
          ),
        ],
      ),
    );
  }
}
