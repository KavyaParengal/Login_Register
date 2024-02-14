import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:login_register/Utilities/colors.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../Api_services/viewDashbordDataApi.dart';
import '../Models/dashboardDataModal.dart';

class ProfileDetails extends StatefulWidget {

  @override
  State<ProfileDetails> createState() => _ProfileDetailsState();
}

class _ProfileDetailsState extends State<ProfileDetails> {

  late String data ;
  bool isLoading = true;
  DashbordDataModel? userDetails;
  String? token = null;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    fetchUserDetails();
  }

  Future<DashbordDataModel?> fetchUserDetails() async {
    SharedPreferences localStorage = await SharedPreferences.getInstance();
    token = localStorage.getString('token').toString();
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
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(60),
        child: AppBar(
          flexibleSpace: Container(
            decoration: BoxDecoration(
                gradient: LinearGradient(colors: [
              Colors.teal.shade500,
              Colors.teal.shade500,
              Colors.black
            ])),
          ),
          elevation: 0,
          title: Column(
            children: [
              // Text(
              //   'Gentle Birth',
              //   style: GoogleFonts.poppins(
              //     fontSize: 20,
              //     fontWeight: FontWeight.bold,
              //     color: Colors.white,
              //   ),
              //   textAlign: TextAlign.start,
              // ),
              Text(
                'Gentle Birth Method',
                style: GoogleFonts.poppins(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                ),
                textAlign: TextAlign.start,
              ),
            ],
          ),
          centerTitle: true,
          leading: IconButton(
              onPressed: (){
                Navigator.pop(context);
              },
              icon: Icon(Icons.arrow_back)
          ),
        ),
      ),
      // appBar: AppBar(
      //   backgroundColor: Colors.teal.shade500,
      //   title: Text(
      //     "Profile Details",
      //     style: TextStyle(
      //         color: Colors.white, fontWeight: FontWeight.bold, fontSize: 20),
      //   ),
      //   leading: Icon(
      //     Icons.arrow_back,
      //     color: Colors.black,
      //   ),
      // ),
      body: Container(
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height,
        // decoration: BoxDecoration(
        //     image: DecorationImage(
        //       image: AssetImage('assets/logo.png',),
        //       opacity: 0.3,
        //     )
        // ),
        child: token == null ? Center(child: CircularProgressIndicator(color: primary,),):
        Center(
          child: SingleChildScrollView(
            child: Column(
              // mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Align(
                  alignment: Alignment.center,
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text(
                      'Profile',
                      style: GoogleFonts.poppins(
                        fontSize: 22,
                        fontWeight: FontWeight.bold,
                        color: Colors.teal.shade800,
                      ),
                      textAlign: TextAlign.start,
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text("First Name",style: TextStyle(
                      fontSize: 15,
                      fontWeight: FontWeight.bold,
                      color: Colors.teal.shade800
                  ),),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: TextFormField(
                    readOnly: true,
                    style: const TextStyle(color: Colors.black),
                    cursorColor: Colors.black,
                    keyboardType: TextInputType.multiline,
                    decoration: InputDecoration(
                      hintText: "${userDetails!.clientDetails!.firstName!.toUpperCase()[0]}${userDetails!.clientDetails!.firstName!.toUpperCase().substring(1).toLowerCase()}",
                      hintStyle: TextStyle(
                          color: Colors.black
                      ),
                      border: OutlineInputBorder(
                        borderSide: BorderSide(
                          color: Colors.black,
                        ),
                        borderRadius: BorderRadius.all(
                          Radius.circular(10),
                        ),
                      ),
                    ),
                  ),
                ),
                // SizedBox(
                //   height: 10,
                // ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text("Last Name",style: TextStyle(
                      fontSize: 15,
                      fontWeight: FontWeight.bold,
                      color: Colors.teal.shade800
                  ),),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: TextFormField(
                    readOnly: true,
                    style: const TextStyle(color: Colors.black),
                    cursorColor: Colors.black,
                    keyboardType: TextInputType.multiline,
                    decoration: InputDecoration(
                      hintText: "${userDetails!.clientDetails!.lastName!.toUpperCase()[0]}${userDetails!.clientDetails!.lastName!.toUpperCase().substring(1).toLowerCase()}",
                      hintStyle: TextStyle(
                          color: Colors.black
                      ),
                      border: OutlineInputBorder(
                        borderSide: BorderSide(
                          color: Colors.black,
                        ),
                        borderRadius: BorderRadius.all(
                          Radius.circular(10),
                        ),
                      ),
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text("Email ID",style: TextStyle(
                      fontSize: 15,
                      fontWeight: FontWeight.bold,
                      color: Colors.teal.shade800
                  ),),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: TextFormField(
                    readOnly: true,
                    style: const TextStyle(color: Colors.black),
                    cursorColor: Colors.black,
                    keyboardType: TextInputType.multiline,
                    decoration: InputDecoration(
                      hintText: "${userDetails!.clientDetails!.email}",
                      hintStyle: TextStyle(
                          color: Colors.black
                      ),
                      border: OutlineInputBorder(
                        borderSide: BorderSide(
                          color: Colors.black,
                        ),
                        borderRadius: BorderRadius.all(
                          Radius.circular(10),
                        ),
                      ),
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text("Mobile Number",style: TextStyle(
                      fontSize: 15,
                      fontWeight: FontWeight.bold,
                      color: Colors.teal.shade800
                  ),),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: TextFormField(
                    readOnly: true,
                    style: const TextStyle(color: Colors.black),
                    cursorColor: Colors.black,
                    keyboardType: TextInputType.multiline,
                    decoration: InputDecoration(
                      hintText: "${userDetails!.clientDetails!.mobile}",
                      hintStyle: TextStyle(
                          color: Colors.black
                      ),
                      border: OutlineInputBorder(
                        borderSide: BorderSide(
                          color: Colors.black,
                        ),
                        borderRadius: BorderRadius.all(
                          Radius.circular(10),
                        ),
                      ),
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text("Location",style: TextStyle(
                      fontSize: 15,
                      fontWeight: FontWeight.bold,
                      color: Colors.teal.shade800
                  ),),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: TextFormField(
                    readOnly: true,
                    style: const TextStyle(color: Colors.black),
                    cursorColor: Colors.black,
                    keyboardType: TextInputType.multiline,
                    decoration: InputDecoration(
                      hintText: "${userDetails!.clientDetails!.location!.toUpperCase()[0]}${userDetails!.clientDetails!.location!.toUpperCase().substring(1).toLowerCase()}",
                      hintStyle: TextStyle(
                        color: Colors.black
                      ),
                      border: OutlineInputBorder(
                        borderSide: BorderSide(
                          color: Colors.black,
                        ),
                        borderRadius: BorderRadius.all(
                          Radius.circular(10),
                        ),
                      ),
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text("Menstruation Date",style: TextStyle(
                      fontSize: 15,
                      fontWeight: FontWeight.bold,
                      color: Colors.teal.shade800
                  ),),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: TextFormField(
                    readOnly: true,
                    style: const TextStyle(color: Colors.black),
                    cursorColor: Colors.black,
                    keyboardType: TextInputType.multiline,
                    decoration: InputDecoration(
                      hintText: "${userDetails!.mensturationDate}",
                      hintStyle: TextStyle(
                          color: Colors.black
                      ),
                      border: OutlineInputBorder(
                        borderSide: BorderSide(
                          color: Colors.black,
                        ),
                        borderRadius: BorderRadius.all(
                          Radius.circular(10),
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
