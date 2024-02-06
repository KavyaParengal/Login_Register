import 'dart:convert';
import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:http/http.dart' as http;
import '../Api_services/viewDashbordDataApi.dart';
import '../Models/dashboardDataModal.dart';
import '../Utilities/colors.dart';
import '../Utilities/constants.dart';
import '../Utilities/global.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {

  late SharedPreferences localStorage;
  late String data ;
  DashbordDataModel? dashbordDataModel = DashbordDataModel();
  bool isLoading = true;
  DashbordDataModel? userDetails;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    fetchUserDetails();
  }

  Future<DashbordDataModel?> fetchUserDetails() async {
    String token = (localStorage.getString('token') ?? '' );
    try {
      final details = await ViewDashboardData().getDashboardData(token);
      userDetails=details;
      setState(() {
        print(userDetails);
      });
    }
    catch(e){
      print('Failed to fetch user details: $e');
      return null;
    }
  }

  // getData() async {
  //   String token = (localStorage.getString('token') ?? '' );
  //   String url = ClientAPI.url + ClientAPI.dashboard;
  //   try {
  //     if (token != null) {
  //       var response = await http.get(Uri.parse(url), headers: {
  //         'Authorization': "Token $token",
  //       });
  //       if (response.statusCode == 200) {
  //         log(response.body, name: "response");
  //         data = response.body;
  //
  //         // if (dashbordDataModel!.clientDetails!.subscribed != null &&
  //         //     dashbordDataModel!.clientDetails!.subscribed == false) {
  //         //   Navigator.push(
  //         //     context,
  //         //     MaterialPageRoute(builder: (context) => HomePage()),
  //         //   );
  //         // }
  //         print(data);
  //         setState(() {
  //           isLoading = false;
  //           data = response.body;
  //           dashbordDataModel =
  //               DashbordDataModel.fromJson(json.decode(response.body ?? ""));
  //           log(dashbordDataModel!.clientDetails!.firstName.toString(), name: "firstnamevv");
  //           id = jsonDecode(data)['client_details']['id'];
  //           firstname = jsonDecode(data)['client_details']['first_name'];
  //           lastname = jsonDecode(data)['client_details']['last_name'];
  //           date = jsonDecode(data)['client_details']['date'];
  //           // daysLeft = jsonDecode(data)['daysLeft'];
  //           // description = jsonDecode(data)['babyDetails']['description'];
  //           // length = jsonDecode(data)['babyDetails']['length'];
  //           // weigth = jsonDecode(data)['babyDetails']['weigth'];
  //           // size = jsonDecode(data)['babyDetails']['size'];
  //           // // video = jsonDecode(data)['video']['link'];
  //           // log(image.toString(), name: "image name veeraaaa");
  //         });
  //       }
  //     }
  //     // else {
  //     //   ScaffoldMessenger.of(context).showSnackBar(SnackBar(
  //     //     content: Text(
  //     //         'Login Details not found. You will be rerouted to the login page'),
  //     //     backgroundColor: Colors.red,
  //     //   ));
  //     //   Future.delayed(Duration(seconds: 2), () {
  //     //     Navigator.push(
  //     //       context,
  //     //       MaterialPageRoute(builder: (context) => Login()),
  //     //     );
  //     //   });
  //     // }
  //   } catch (e) {
  //     log(e.toString(), name: "getDataError");
  //   }
  // }

  Widget _buildName() {
    return Column(
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
                      text: dashbordDataModel!.clientDetails!.firstName.toString().toUpperCase(),
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
                  text: '7',
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
                  text: '160',
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
    );
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
            borderRadius: BorderRadius.circular(5),
            color: Colors.black.withOpacity(0.1),
          ),
          child: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: <Widget>[
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  // child: image==null? Container():Image(
                  //   image:NetworkImage(image.toString()),
                  //   height: 60,
                  // ),
                  child: Image.asset('assets/logo.jpg'),
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
                            '22',
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
                            '4',
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
                            '55',
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
                    // child: Text(description==null?"" :utf8.decode(description.codeUnits),
                      child: Text('aaaaaa aadcbdvb hfvbhrv ndv nfvjehyuf rienv fbfdjfir nfjhgio4rj aaaaaa aadcbdvb hfvbhrv ndv nfvjehyu frienv fbfdjfir nfjhgio4rj',
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
            color: Colors.black.withOpacity(0.05),
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
                    // Navigator.push(
                    //   context,
                    //   MaterialPageRoute(
                    //     builder: (context) => LearnIt(),
                    //   ),
                    // );
                  },
                  style: ElevatedButton.styleFrom(
                    primary: button, // foreground (text) color
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
            // Navigator.push(
            //   context,
            //   MaterialPageRoute(
            //     builder: (context) => LearnIt(),
            //   ),
            // );
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
                color: Colors.black.withOpacity(0.05),
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
                        // Navigator.push(
                        //   context,
                        //   MaterialPageRoute(
                        //     builder: (context) => ClientDailyTracker(),
                        //   ),
                        // );
                      },
                      style: ElevatedButton.styleFrom(
                        primary: button, // foreground (text) color
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
                // Navigator.push(
                //   context,
                //   MaterialPageRoute(
                //     builder: (context) => ClientDailyTracker(),
                //   ),
                // );
              },
            ),
          ],
        ),
      ],
    );
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
      floatingActionButton: FloatingActionButton(onPressed: (){},
        elevation: 5,
        backgroundColor: Colors.transparent,
        child: Container(
          height: 60,
          width: 60,
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(30),
              color: Colors.green.shade500
          ),
          child: IconButton(onPressed: (){
            // _launchWhatsapp();
          },
              icon: const FaIcon(FontAwesomeIcons.whatsapp,color: Colors.white,)),
        ),),
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
