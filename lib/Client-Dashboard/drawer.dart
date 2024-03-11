import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:login_register/Routes/route_names.dart';
import 'package:login_register/Client-Dashboard/Screens/ProfileDetails.dart';
import 'package:login_register/Utilities/colors.dart';
import 'package:shared_preferences/shared_preferences.dart';


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

  DashbordDataModel? userDetails;
  String? token;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    fetchUserDetails();
  }

  Future<DashbordDataModel?> fetchUserDetails() async {
    SharedPreferences localStorage = await SharedPreferences.getInstance();
    token = localStorage.getString('token');
    try {
      final details = await ViewDashboardData().getDashboardData(token!);
      userDetails=details;
      setState(() {
        print(token);
        print('userDetails--$userDetails');
      });
    }
    catch(e){
      print('Failed to fetch user details: $e');
      return null;
    }
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
                Navigator.pushNamed(context, RouteName.login);
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
                  child: token==null? Container() :Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      userDetails!.clientDetails!.firstName ==null ? Text(
                        "Hi, ",
                        style: GoogleFonts.poppins(
                          fontSize: 22,
                          color: Colors.white,
                        ),
                        textAlign: TextAlign.center,
                      ) : Text(
                        "Hi, ${Global().capitalizeAllWord(userDetails!.clientDetails!.firstName)}",style: GoogleFonts.poppins(
                          fontSize: 22,
                          color: Colors.white,
                        ),
                        textAlign: TextAlign.center,
                      ),
                      const Divider(
                        height: 10,
                        thickness: .01,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          TextButton(
                            onPressed: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => ProfileDetails(),
                                ),
                              );
                            },
                            child: Text(
                              "Profile & Other Setting",
                              style: GoogleFonts.poppins(
                                fontSize: 15,
                                color: Colors.white,
                              ),
                              textAlign: TextAlign.center,
                            ),
                            // onPressed: () {
                            //   Navigator.push(
                            //     context,
                            //     MaterialPageRoute(
                            //         builder: (context) => Profile(route: "free_package",)),
                            //   );
                            // },
                          )
                        ],
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
            // ListTile(
            //     leading:
            //     Icon(Icons.calendar_today_rounded, color: Colors.white),
            //     title: Text(
            //       "Appointment",
            //       style: GoogleFonts.poppins(
            //         fontSize: 12,
            //         color: Colors.white,
            //       ),
            //     ),
            //     onTap: () {
            //       Navigator.push(
            //         context,
            //         MaterialPageRoute(
            //           builder: (context) => Appointment(),
            //         ),
            //       );
            //     }),
            // ListTile(
            //     leading: Icon(Icons.medical_services, color: Colors.white),
            //     title: Text(
            //       "Support Team",
            //       style: GoogleFonts.poppins(
            //         fontSize: 12,
            //         color: Colors.white,
            //       ),
            //     ),
            //     onTap: () {
            //       Navigator.push(
            //         context,
            //         MaterialPageRoute(
            //           builder: (context) => SupportTeam(),
            //         ),
            //       );
            //     }),
            // ListTile(
            //     leading: Icon(Icons.person, color: Colors.white),
            //     title: Text(
            //       "My Doctor",
            //       style: GoogleFonts.poppins(
            //         fontSize: 12,
            //         color: Colors.white,
            //       ),
            //     ),
            //     onTap: () {
            //       Navigator.push(
            //         context,
            //         MaterialPageRoute(
            //           builder: (context) => MyDoctor(),
            //         ),
            //       );
            //     }),
            // ListTile(
            //     leading: Icon(Icons.payment, color: Colors.white),
            //     title: Text(
            //       "Payment",
            //       style: GoogleFonts.poppins(
            //         fontSize: 12,
            //         color: Colors.white,
            //       ),
            //     ),
            //     onTap: () {
            //       Navigator.push(
            //         context,
            //         MaterialPageRoute(
            //           builder: (context) => Payment(),
            //         ),
            //       );
            //     }),
            // ListTile(
            //     leading: Image(image: AssetImage('assets/ScanIcon.png'),
            //         height: 20),
            //     title: Text(
            //       "Scan Details",
            //       style: GoogleFonts.poppins(
            //         fontSize: 12,
            //         color: Colors.white,
            //       ),
            //     ),
            //     onTap: () {
            //       Navigator.push(
            //         context,
            //         MaterialPageRoute(
            //           builder: (context) => ScanDates(),
            //         ),
            //       );
            //     }),
            // ListTile(
            //     leading: Icon(Icons.scanner, color: Colors.white),
            //     title: Text(
            //       "Last Week Report",
            //       style: GoogleFonts.poppins(
            //         fontSize: 12,
            //         color: Colors.white,
            //       ),
            //     ),
            //     onTap: () {
            //       Navigator.push(
            //         context,
            //         MaterialPageRoute(
            //           builder: (context) => Report(),
            //         ),
            //       );
            //     }),
            // ListTile(
            //     leading: Icon(Icons.message, color: Colors.white),
            //     title: Text(
            //       "Message",
            //       style: GoogleFonts.poppins(
            //         fontSize: 12,
            //         color: Colors.white,
            //       ),
            //     ),
            //     onTap: () {
            //       Navigator.push(
            //         context,
            //         MaterialPageRoute(
            //           builder: (context) => AllMessages(),
            //         ),
            //       );
            //     }),

            // ListTile(
            //     leading: Icon(Icons.info_outline),
            //     title: Text(
            //       "About Us",
            //       style: GoogleFonts.poppins(
            //         fontSize: 12,
            //         color: Colors.white,
            //       ),
            //     ),
            //     onTap: () {
            //       Navigator.push(
            //         context,
            //         MaterialPageRoute(
            //           builder: (context) => AboutScreen(),
            //         ),
            //       );
            //     }),
            // ListTile(
            //     leading: Image(image: AssetImage('assets/TermIcon.png'),
            //       height: 20,),
            //     title: Text(
            //       "Terms of Use",
            //       style: GoogleFonts.poppins(
            //         fontSize: 12,
            //         color: Colors.white,
            //       ),
            //     ),
            //     onTap: () {
            //       Navigator.push(
            //         context,
            //         MaterialPageRoute(
            //           builder: (context) => Terms(),
            //         ),
            //       );
            //     }),
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
