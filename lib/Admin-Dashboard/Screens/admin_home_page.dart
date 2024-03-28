import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:login_register/Admin-Dashboard/Screens/add_notification.dart';
import 'package:login_register/Admin-Dashboard/Screens/admin_view_banners.dart';
import 'package:login_register/Admin-Dashboard/Screens/admin_view_free_content.dart';
import 'package:login_register/Admin-Dashboard/Screens/admin_view_premium_content.dart';
import 'package:login_register/Admin-Dashboard/Screens/admin_view_price_plan.dart';
import 'package:login_register/Admin-Dashboard/Screens/admin_view_week_wise_content.dart';
import 'package:login_register/Admin-Dashboard/Screens/admin_view_workshop_video.dart';
import 'package:login_register/Admin-Dashboard/Screens/view_clients.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../../Login/login_page.dart';
import '../../Routes/route_names.dart';
import '../../Utilities/global.dart';
import 'add_banner.dart';
import 'add_free_videos.dart';
import 'add_premium_content.dart';
import 'add_price.dart';
import 'add_week_wise_content.dart';
import 'add_workshop_video.dart';

class AdminHomePage extends StatefulWidget {
  const AdminHomePage({super.key});

  @override
  State<AdminHomePage> createState() => _AdminHomePageState();
}

class _AdminHomePageState extends State<AdminHomePage> {

  List image = [
    'assets/free_content1.png',
    'assets/premium.png',
    'assets/dashBoard_details.png',
    'assets/payment.png',
    'assets/banner.png',
    'assets/workshop.png',
    'assets/add.png',
    'assets/clients.png'
  ];
  List title = [ 'Free Content', 'Premium Content', 'Week Wise Content', 'Payment', 'Banners', 'Workshop Videos', 'Notification', 'View Clients'];
  List navigationAdd = [
    AdminAddVideos(),
    AddPremiumContent(),
    AddWeekWiseContent(),
    AddPremiumPrice(),
    AddBanners(),
    AddWorkShopVideos(),
    AddNotification(),
    ViewClients()
  ];

  List navigationView = [
    AdminViewFreeContent(),
    AdminViewPremiumContent(),
    AdminViewWeekWiseContent(),
    AdminViewPricePlan(),
    AdminViewBanners(),
    AdminViewWorkshopVideo()
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: PreferredSize(
          preferredSize: const Size.fromHeight(65),
          child: AppBar(
            flexibleSpace: Container(
              decoration: BoxDecoration(
                  gradient: LinearGradient(
                      colors: [Colors.teal.shade500, Colors.teal.shade500, Colors.black]
                  )
              ),
            ),
            elevation: 0,
            title: Text(
              '${Global().appName}',
              style: GoogleFonts.poppins(
                fontSize: 20,
                fontWeight: FontWeight.bold,
                color: Colors.white,
              ),
              textAlign: TextAlign.start,
            ),
            centerTitle: true,
            actions: [
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: IconButton(
                  onPressed: () async {
                    SharedPreferences localStorage = await  SharedPreferences.getInstance();
                    localStorage.setString('token', '');
                    Navigator.push(context, MaterialPageRoute(builder: (context)=>LoginPage()));
                  },
                  icon: Icon(Icons.logout,color: Colors.white,),
                ),
              ),
            ]
          ),
        ),
        body: SafeArea(
          child: Center(
            child: SingleChildScrollView(
              physics: ScrollPhysics(),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  GridView.builder(
                    physics: NeverScrollableScrollPhysics(),
                    shrinkWrap: true,
                    itemCount: image.length,
                    gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2,
                      crossAxisSpacing: 3.0,
                      mainAxisSpacing: 3.0,
                      //childAspectRatio: MediaQuery.of(context).size.width/5
                    ),
                    itemBuilder: (BuildContext context, int index) {
                      return GridTile(
                        child: image[index]=='assets/clients.png'?InkWell(
                          onTap: (){
                            Navigator.push(context, MaterialPageRoute(builder: (context)=>ViewClients()));
                          },
                          child: Container(
                              margin: const EdgeInsets.all(5.0),
                              decoration: ShapeDecoration(
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(12.0),
                                ),
                                gradient: RadialGradient(
                                  colors: <Color>[ Colors.white, Colors.teal.shade100],
                                ),
                              ),
                              child: Padding(
                                padding: const EdgeInsets.all(10.0),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                  children: [
                                    Image.asset('assets/clients.png', width: 66,),
                                    Text('Client List',style: GoogleFonts.poppins(
                                      fontSize: 15,
                                      fontWeight: FontWeight.bold,
                                      color: Colors.black,
                                    ),textAlign: TextAlign.center,),
                                  ],
                                ),
                              )
                          ),
                        ):Container(
                          margin: const EdgeInsets.all(5.0),
                          decoration: ShapeDecoration(
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(12.0),
                            ),
                            gradient: RadialGradient(
                              colors: <Color>[ Colors.white, Colors.teal.shade100],
                            ),
                          ),
                          child: Padding(
                            padding: const EdgeInsets.all(10.0),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: [
                                Image.asset(image[index], width: 66,),
                                Text(title[index],style: GoogleFonts.poppins(
                                  fontSize: 15,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.black,
                                ),textAlign: TextAlign.center,),
                                Align(
                                      alignment: Alignment.bottomRight,
                                      child: PopupMenuButton(
                                          icon: const Icon(Icons.more_vert),
                                          //color: scaffoldBgColor,
                                          elevation: 0,
                                          shape: RoundedRectangleBorder(
                                            borderRadius: BorderRadius.circular(12),
                                          ),
                                          itemBuilder: (context) {
                                            return <PopupMenuEntry>[
                                              PopupMenuItem(
                                                child: InkWell(
                                                  onTap: (){
                                                    Navigator.pop(context);
                                                    Navigator.push(context, MaterialPageRoute(builder: (context)=>navigationAdd[index]));
                                                  },
                                                  child: TextButton(
                                                    child: Text('Add',style: TextStyle(
                                                        fontWeight: FontWeight.bold,
                                                        color: Colors.teal.shade800
                                                    ),),
                                                    onPressed: (){
                                                      Navigator.pop(context);
                                                      Navigator.push(context, MaterialPageRoute(builder: (context)=>navigationAdd[index]));
                                                    },
                                                  )
                                                ),
                                              ),

                                              PopupMenuItem(
                                                child: InkWell(
                                                  onTap: (){
                                                    Navigator.pop(context);
                                                    Navigator.push(context, MaterialPageRoute(builder: (context)=> navigationView[index]));
                                                  },
                                                  child: TextButton(
                                                    child: Text('View',style: TextStyle(
                                                    fontWeight: FontWeight.bold,
                                                    color: Colors.teal.shade800
                                                    ),),
                                                    onPressed: (){
                                                      Navigator.pop(context);
                                                      Navigator.push(context, MaterialPageRoute(builder: (context)=> navigationView[index]));
                                                    },
                                                  )
                                                ),
                                              ),
                                            ];
                                          }),
                                )
                              ],
                            ),
                          )
                        ),
                      );
                    },
                  ),
                ],
              ),
            ),
          ),
        )
    );
  }
}
