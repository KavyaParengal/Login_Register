
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_nav_bar/google_nav_bar.dart';
import 'package:login_register/Client-Dashboard/Screens/freecontent.dart';
import 'package:login_register/Client-Dashboard/Screens/HomePage/home_page.dart';
import 'package:login_register/Client-Dashboard/Screens/premiumcontent.dart';
import 'package:login_register/Utilities/colors.dart';
import 'package:login_register/Widgets/about_us.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../Login/login_page.dart';
import '../Utilities/global.dart';
import 'Api_services/viewDashbordDataApi.dart';
import 'Models/dashboardDataModal.dart';
import 'Screens/premium_plan_page.dart';

class NavigationBottomBar extends StatefulWidget {
  int _selectedIndex;
  @override
  State<NavigationBottomBar> createState() => _NavigationBottomBarState();

  NavigationBottomBar(this._selectedIndex);
}

class _NavigationBottomBarState extends State<NavigationBottomBar> {

  void onItemTapped(int index){
    setState(() {
      widget._selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        boxShadow: [BoxShadow(
            color: Colors.grey,
            blurRadius: 8,
            spreadRadius: 4,
            offset: Offset(0, 6)
        )],
      ),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 12),
        child: GNav(
          backgroundColor: Colors.white,
            color: Colors.grey,
            activeColor: Colors.white,
            tabBackgroundColor: button,
            padding: EdgeInsets.all(10),
            gap: 4,
            selectedIndex: widget._selectedIndex,
            onTabChange: onItemTapped,
            tabs: [
              GButton(
                icon: Icons.home,
                text: 'Home',
                onPressed: (){
                  Navigator.push(context, MaterialPageRoute(builder: (context) => HomePage()));
                },
              ),
              GButton(
                icon: FontAwesomeIcons.calendarCheck,
                text: 'About Us',
                textSize: 5,
                onPressed: (){
                  Navigator.push(context, MaterialPageRoute(builder: (context) => AboutUs()));
                },
              ),
              GButton(
                icon: FontAwesomeIcons.leanpub,
                text: 'Get Started',
                textSize: 5,
                onPressed: (){
                  Navigator.push(context, MaterialPageRoute(builder: (context) => FreeContent()));
                },
              ),
              GButton(
                icon: FontAwesomeIcons.crown,
                text: 'Premium Membership',
                textSize: 2,
                  onPressed: () async{
                    if(Global.prefs!.getString("subscription") == 'true')
                      Navigator.push(context, MaterialPageRoute(builder: (context)=>PremiumContent()));
                    else{
                      _premiumAlert();
                      // Navigator.pop(context);
                    }
                },
              ),
            ]
        ),
      ),
    );
  }
  Future<dynamic> _premiumAlert() {
    return showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: const Text('Are you Subscribed?'),
        content: const Text('Only Subcribed Users Can Access This !'),
        actions: [
          TextButton(
            onPressed: () async {
              Navigator.push(context, MaterialPageRoute(builder: (context) => PremiumPlanPage(id: Global.prefs!.getString("id"))));
            },
            child: Text("OK",
              style: TextStyle(
                  color: button,
                  fontWeight: FontWeight.bold
              ),
            ),
          ),
        ],
      ),
    );
  }
}
