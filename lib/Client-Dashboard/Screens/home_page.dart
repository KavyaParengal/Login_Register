import 'dart:convert';
import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_expandable_fab/flutter_expandable_fab.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:login_register/Client-Dashboard/Routes/route_names.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:http/http.dart' as http;
import 'package:url_launcher/url_launcher.dart';
import '../Api_services/viewDashbordDataApi.dart';
import '../Models/dashboardDataModal.dart';
import '../Utilities/colors.dart';
import '../Utilities/constants.dart';
import '../Utilities/global.dart';
import '../Widgets/free_package_drawer.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {

  late String data ;
  bool isLoading = true;
  DashbordDataModel? userDetails;

  final _key = GlobalKey<ExpandableFabState>();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    fetchUserDetails();
  }

  Future<DashbordDataModel?> fetchUserDetails() async {
    SharedPreferences localStorage = await SharedPreferences.getInstance();
    String? token = localStorage.getString('token');
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

  Widget _buildName() {
    return userDetails != null ? Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: <Widget>[
        Row(
          children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: RichText(
                text: TextSpan(
                  children: [
                    TextSpan(
                      text: 'Hi ',
                      style: GoogleFonts.poppins(
                        fontSize: 15,
                        fontWeight: FontWeight.bold,
                        color: Colors.black,
                      ),
                    ),
                    TextSpan(
                      text: userDetails!.clientDetails!.firstName.toString()==null?'':'${userDetails!.clientDetails!.firstName.toString().toUpperCase()} ${userDetails!.clientDetails!.lastName.toString().toUpperCase()}',
                      style: GoogleFonts.poppins(
                        fontSize: 22,
                        fontWeight: FontWeight.bold,
                        color: Colors.black,
                      ),
                    ),
                    TextSpan(
                      text: ' , ',
                      style: GoogleFonts.poppins(
                        fontSize: 15,
                        fontWeight: FontWeight.bold,
                        color: Colors.black,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
        Wrap(
          children: [
            RichText(
              text: TextSpan(children: [
                TextSpan(
                  text: 'You Are in ',
                  style: GoogleFonts.poppins(
                    fontSize: 15,
                    fontWeight: FontWeight.bold,
                    color: Colors.black,
                  ),
                ),
                TextSpan(
                  text: 'Week ',
                  style: GoogleFonts.poppins(
                    fontSize: 22,
                    fontWeight: FontWeight.bold,
                    color: Colors.black,
                  ),
                ),
                TextSpan(
                  text: userDetails!.date![0].toString()==null?'0':userDetails!.date![0].toString(),
                  style: GoogleFonts.poppins(
                    fontSize: 22,
                    fontWeight: FontWeight.bold,
                    color: Colors.black,
                  ),
                ),
                TextSpan(
                  text: ' and ',
                  style: GoogleFonts.poppins(
                    fontSize: 15,
                    fontWeight: FontWeight.bold,
                    color: Colors.black,
                  ),
                ),
                TextSpan(
                  text: userDetails!.date![1].toString()==null?'0':userDetails!.date![1].toString(),
                  style: GoogleFonts.poppins(
                    fontSize: 22,
                    fontWeight: FontWeight.bold,
                    color: Colors.black,
                  ),
                ),
                TextSpan(
                  text: ' Days ',
                  style: GoogleFonts.poppins(
                    fontSize: 22,
                    fontWeight: FontWeight.bold,
                    color: Colors.black,
                  ),
                ),
                TextSpan(
                  text: 'Left',
                  style: GoogleFonts.poppins(
                    fontSize: 15,
                    fontWeight: FontWeight.bold,
                    color: Colors.black,
                  ),
                ),
              ]),
            ),
          ],
        ),
      ],
    ) :
    Container();
  }

  Widget _buildImage() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: <Widget>[
        Container(
          height: 320,
          width: 285,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
            color: Colors.black.withOpacity(0.1),
          ),
          child: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: <Widget>[
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: userDetails!.detail!.image==null? Container():Image(
                    image:NetworkImage(ClientAPI.url+'${userDetails!.detail!.image.toString()}'),
                    height: 60,
                  ),
                  //child: Image.asset('assets/logo.png'),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Container(
                      height: 75,
                      width: 75,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: <Widget>[
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Text(
                              "Length",
                              style: GoogleFonts.poppins(
                                  color: Colors.black, fontSize: 10),
                              textAlign: TextAlign.center,
                            ),
                          ),
                          Text(
                            userDetails!.detail!.length.toString(),
                            style: GoogleFonts.poppins(
                                color: Colors.black, fontSize: 10),
                            textAlign: TextAlign.center,
                          ),
                        ],
                      ),
                    ),
                    Container(
                      height: 75,
                      width: 75,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: <Widget>[
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Text(
                              'Weight',
                              style: GoogleFonts.poppins(
                                  color: Colors.black, fontSize: 10),
                              textAlign: TextAlign.center,
                            ),
                          ),
                          Text(
                            userDetails!.detail!.weight.toString(),
                            style: GoogleFonts.poppins(
                                color: Colors.black, fontSize: 10),
                            textAlign: TextAlign.center,
                          ),
                        ],
                      ),
                    ),
                    Container(
                      height: 75,
                      width: 75,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: <Widget>[
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Text(
                              "Size",
                              style: GoogleFonts.poppins(
                                  color: Colors.black, fontSize: 10),
                              textAlign: TextAlign.center,
                            ),
                          ),
                          Text(
                            userDetails!.detail!.size.toString(),
                            style: GoogleFonts.poppins(
                                color: Colors.black, fontSize: 10),
                            textAlign: TextAlign.center,
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
                Padding(
                    padding: const EdgeInsets.all(8.0),
                    // child: Text(description==null?"" :utf8.decode(description.codeUnits,
                      child: Text(userDetails!.detail!.description == null ? "":utf8.decode(userDetails!.detail!.description!.codeUnits),
                      style: GoogleFonts.poppins(
                        fontSize: 12,
                        color: Colors.black,
                      ),
                      textAlign: TextAlign.justify,
                    )),
              ],
            ),
          ),
        ),
      ],
    );
  }

  Widget _buildOptions() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: <Widget>[
        InkWell(
          child: Container(
            // constraints: BoxConstraints(
            //     minWidth: 125,
            //     maxWidth: 125,
            //     minHeight: 125,
            //     maxHeight: 150
            // ),
            //color: Colors.black.withOpacity(0.05),
            decoration: BoxDecoration(
              color: Colors.black.withOpacity(0.05),
              borderRadius: BorderRadius.circular(10)
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                const Padding(
                  padding: EdgeInsets.all(10.0),
                  child: Image(
                    image: AssetImage(
                      'assets/free_content.png',
                    ),
                    color: Colors.black,
                    height: 60,
                  ),
                ),
                const Divider(
                  height: 10,
                  thickness: .01,
                ),
                ElevatedButton(
                  onPressed: () {
                    Navigator.pushNamed(context, RouteName.free_content);
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: button, // foreground (text) color
                  ),
                  child: Text(
                    "Knowledge Base",
                    style: GoogleFonts.poppins(
                      fontSize: 15,
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                    ),
                    textAlign: TextAlign.center,
                  ),
                ),
              ],
            ),
          ),
          onTap: () {
            Navigator.pushNamed(context, RouteName.free_content);
          },
        ),
        const Divider(
          height: 25,
        ),
        Column(
          children: [
            InkWell(
              child: Container(
                // constraints: BoxConstraints(
                //     minWidth: 125,
                //     maxWidth: 150,
                //     minHeight: 125,
                //     maxHeight: 150),
                // color: Colors.black.withOpacity(0.05),
                decoration: BoxDecoration(
                    color: Colors.black.withOpacity(0.05),
                    borderRadius: BorderRadius.circular(10)
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: <Widget>[
                    const FaIcon(FontAwesomeIcons.crown,color: Colors.black,size: 14,),
                    const Divider(
                      height: 10,
                      thickness: .01,
                    ),
                    const Image(
                      image: AssetImage('assets/learning.png'),
                      height: 60,
                      color: Colors.black,
                    ),
                    const Divider(
                      height: 10,
                      thickness: .01,
                    ),
                    ElevatedButton(
                      onPressed: () {
                        Navigator.pushNamed(context, RouteName.premium_content);
                      },
                      style: ElevatedButton.styleFrom(
                        backgroundColor: button, // foreground (text) color
                        shape: RoundedRectangleBorder()
                      ),
                      child: Text(
                        " Premium Content ",
                        style: GoogleFonts.poppins(
                          fontSize: 15,
                          fontWeight: FontWeight.bold,
                          color: Colors.white,
                        ),
                        textAlign: TextAlign.center,
                      ),
                    ),
                  ],
                ),
              ),
              onTap: () {
                Navigator.pushNamed(context, RouteName.premium_content);
              },
            ),
          ],
        ),
      ],
    );
  }

  _launchWhatsapp() async {
    await launch("https://wa.me/919645713419", forceSafariVC: false);
  }

  _launchEmail() async {
    final Uri _emailLaunchUri = Uri(
      scheme: 'mailto',
      path: 'kavyakavya3108@gmail.com',
      //query: 'subject=Hello&body=Hello, this is the body of the email!',
    );
    if (await canLaunch(_emailLaunchUri.toString())) {
      await launch(_emailLaunchUri.toString());
    } else {
      throw 'Could not launch email';
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: FreeNavigationDrawer(),
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
        ),
      ),
      // floatingActionButton: FloatingActionButton(
      //   onPressed: () {
      //     setState(() {
      //       _isExpanded = !_isExpanded;
      //     });
      //   },
      //   elevation: 5,
      //   backgroundColor: Colors.transparent,
      //   child: Container(
      //     height: 60,
      //     width: 60,
      //     decoration: BoxDecoration(
      //         borderRadius: BorderRadius.circular(30),
      //         color: Colors.green.shade500
      //     ),
      //     child: Column(
      //       children: [
      //         IconButton(onPressed: (){
      //           // _launchWhatsapp();
      //         },
      //             icon: const FaIcon(FontAwesomeIcons.whatsapp,color: Colors.white,)),
      //       ],
      //     ),
      //   ),),

      floatingActionButtonLocation: ExpandableFab.location,
      floatingActionButton: ExpandableFab(
        openButtonBuilder: RotateFloatingActionButtonBuilder(
          child: const FaIcon(FontAwesomeIcons.thumbsUp),
          //fabSize: ExpandableFabSize.regular,
          foregroundColor: Colors.white,
          backgroundColor: button,
          shape: const CircleBorder(),
          angle: 58
        ),
        closeButtonBuilder: RotateFloatingActionButtonBuilder(
            child: const FaIcon(FontAwesomeIcons.multiply),
            //fabSize: ExpandableFabSize.regular,
            foregroundColor: Colors.white,
            backgroundColor: button,
            shape: const CircleBorder(),
            angle: 58
        ),
        children: [
          InkWell(
            onTap: (){
              _launchEmail();
            },
              child: Image.asset('assets/gmail.png', width: 50,)
          ),
          InkWell(
            onTap: (){
              _launchWhatsapp();
            },
              child: Image.asset('assets/whatsapp.png', width: 50,)
          ),
        ],
      ),

      body: Container(
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height,
        // decoration: BoxDecoration(
        //     gradient: LinearGradient(
        //         begin: Alignment.topCenter,
        //         end: Alignment.bottomCenter,
        //         colors: [Colors.teal.shade400, Colors.teal.shade500, Colors.teal.shade500, Colors.black]
        //     )
        // ),
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.end,
            children: <Widget>[
              Padding(
                padding: const EdgeInsets.all(10.0),
                child: _buildName(),
              ),
              Padding(
                padding: const EdgeInsets.all(10.0),
                child: _buildImage(),
              ),
              Padding(
                padding: const EdgeInsets.all(10.0),
                child: _buildOptions(),
              )
            ],
          ),
        ),
      ),
    );
  }
}
