import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:login_register/Client-Dashboard/Screens/ProfileDetails.dart';
import 'package:login_register/PrivacyPolicy/privacy_policy.dart';
import 'package:login_register/PrivacyPolicy/terms&conditions.dart';
import 'package:login_register/Utilities/colors.dart';
import 'package:login_register/contact_us.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../Login/login_page.dart';
import 'Api_services/viewDashbordDataApi.dart';
import 'Models/dashboardDataModal.dart';
import '../Utilities/global.dart';


class FreeNavigationDrawer extends StatefulWidget {
  final int? value;
  FreeNavigationDrawer({Key? key, this.value}) : super(key: key);
  @override
  _FreeNavigationDrawerState createState() => _FreeNavigationDrawerState();
}

class _FreeNavigationDrawerState extends State<FreeNavigationDrawer> {

  String? uname;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    Global.getPreferences();
    uname = Global.prefs!.getString("userName");
  }

  @override
  Widget build(BuildContext context) {
    Future<dynamic> exitDialog() {
      return showDialog(
        context: context,
        builder: (context) => AlertDialog(
          title: const Text('Are you Sure?'),
          content: const Text('Do You want to Logout?'),
          actions: [
            TextButton(
              onPressed: () async {
               // Global().onLogout(context: context);
                SharedPreferences localStorage = await  SharedPreferences.getInstance();
                localStorage.setString('token', '');
                localStorage.setString('userName', '');
                Navigator.push(context, MaterialPageRoute(builder: (context)=>LoginPage()));
              },
              child: Text("Logout",style: TextStyle(
                color: Colors.teal.shade800
              ),),
            ),
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: Text("Cancel",style: TextStyle(
                  color: Colors.teal.shade800
              ),),
            ),
          ],
        ),
      );
    }
    return Drawer(
      child: ListView(
          children: <Widget>[
            DrawerHeader(
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Container(
                  height: 100,
                  width: 300,
                  decoration: BoxDecoration(
                    borderRadius: const BorderRadius.all(Radius.circular(20)),
                    color: button,
                  ),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      uname == null ?  Text(
                        "Hi,",style: GoogleFonts.poppins(
                        fontSize: 22,
                        color: Colors.white,
                      ),
                        textAlign: TextAlign.center,
                      ) : Text(
                        "Hi, $uname",style: GoogleFonts.poppins(
                          fontSize: 22,
                          color: Colors.white,
                        ),
                        textAlign: TextAlign.center,
                      ),
                      const Divider(
                        height: 10,
                        thickness: .01,
                      ),
                      Text(
                        "Profile & Other Setting",
                        style: GoogleFonts.poppins(
                          fontSize: 15,
                          color: Colors.white,
                        ),
                        textAlign: TextAlign.center,
                      )
                    ],
                  ),
                ),
              ),
            ),
            ListTile(
                leading: Icon(Icons.person, color: button),
                title: Text(
                  "Profile",
                  style: GoogleFonts.poppins(
                    fontSize: 15,
                    color: Colors.black,
                    fontWeight: FontWeight.bold
                  ),
                ),
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => ProfileDetails(),
                    ),
                  );
                }
            ),
            ListTile(
                leading: Image(image: AssetImage('assets/TermIcon.png',),color: button,
                  height: 20,),
                title: Text(
                  "Terms and Condition",
                  style: GoogleFonts.poppins(
                      fontSize: 15,
                      color: Colors.black,
                      fontWeight: FontWeight.bold
                  ),
                ),
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => TermsAndCondition(),
                    ),
                  );
                }),
            ListTile(
                leading: Image(image: AssetImage('assets/privacy-policy.png',),
                  color: button,
                  height: 28,),
                title: Text(
                  "Privacy Policy",
                  style: GoogleFonts.poppins(
                      fontSize: 15,
                      color: Colors.black,
                      fontWeight: FontWeight.bold
                  ),
                ),
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => PrivacyPolicy(),
                    ),
                  );
                }),
            ListTile(
                leading: Icon(Icons.call, color: button),
                title: Text(
                  "Contact us",
                  style: GoogleFonts.poppins(
                      fontSize: 15,
                      color: Colors.black,
                      fontWeight: FontWeight.bold
                  ),
                ),
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => ContactUs(),
                    ),
                  );
                }),
            ListTile(
                leading: Icon(Icons.logout, color: button),
                title: Text(
                  "Logout",
                  style: GoogleFonts.poppins(
                    fontSize: 15,
                    color: Colors.black,
                    fontWeight: FontWeight.bold
                  ),
                ),
                onTap: () {
                  exitDialog();
                }),
          ],
        ),
    );
  }
}

class CustomListTile extends StatefulWidget {
  IconData icon;
  String text;
  Function onTap;
  CustomListTile(this.icon, this.text, this.onTap);

  @override
  _CustomListTileState createState() => _CustomListTileState();
}

class _CustomListTileState extends State<CustomListTile> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(8.0, 0, 8.0, 0),
      child: InkWell(
        child: Container(
          height: 60,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: <Widget>[
              Row(
                children: <Widget>[
                  Icon(widget.icon, color: Colors.white),
                ],
              ),
              Padding(
                padding: const EdgeInsets.all(6.0),
                child: Text(
                  widget.text,
                  style: GoogleFonts.poppins(
                    fontSize: 14,
                    color: Colors.white,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
