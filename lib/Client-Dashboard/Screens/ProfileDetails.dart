import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:login_register/Client-Dashboard/Utilities/colors.dart';
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
          title: Text(
            'Profile Details',
            style: GoogleFonts.poppins(
              fontSize: 20,
              fontWeight: FontWeight.bold,
              color: Colors.white,
            ),
            textAlign: TextAlign.start,
          ),
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
      body: token == null ? Center(child: CircularProgressIndicator(color: primary,),):
      Center(
        child: SingleChildScrollView(
          child: Column(
            children: [
              SizedBox(
                height: 40,
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: TextFormField(
                  readOnly: true,
                  style: const TextStyle(color: Colors.black),
                  cursorColor: Colors.black,
                  keyboardType: TextInputType.multiline,
                  decoration: InputDecoration(
                    hintText: "${userDetails!.clientDetails!.firstName!.toUpperCase()}",
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
              SizedBox(
                height: 10,
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: TextFormField(
                  readOnly: true,
                  style: const TextStyle(color: Colors.black),
                  cursorColor: Colors.black,
                  keyboardType: TextInputType.multiline,
                  decoration: InputDecoration(
                    hintText: "${userDetails!.clientDetails!.lastName!.toUpperCase()}",
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
              SizedBox(
                height: 10,
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
              SizedBox(
                height: 10,
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
              SizedBox(
                height: 10,
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: TextFormField(
                  readOnly: true,
                  style: const TextStyle(color: Colors.black),
                  cursorColor: Colors.black,
                  keyboardType: TextInputType.multiline,
                  decoration: InputDecoration(
                    hintText: "${userDetails!.clientDetails!.location!.toUpperCase()}",
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
    );
  }
}
