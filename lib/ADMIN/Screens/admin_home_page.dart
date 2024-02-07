
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:login_register/CLIENT/Routes/route_names.dart';

import '../../CLIENT/Utilities/global.dart';

class AdminHomePage extends StatefulWidget {
  const AdminHomePage({super.key});

  @override
  State<AdminHomePage> createState() => _AdminHomePageState();
}

class _AdminHomePageState extends State<AdminHomePage> {

  List image = [
    'assets/free_content.png',
    'assets/premium.png',
    'assets/dashBoard_details.png',
    'assets/payment.png',
    'assets/clients.png'];
  List title = [ 'Free Content', 'Premium Content', 'Dashboard Details', 'Payment', 'Client List'];
  List navigation = [RouteName.add_free_content, RouteName.admin_home];

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
          ),
        ),
        body: SafeArea(
          child: Center(
            child: GridView.builder(
              shrinkWrap: true,
              itemCount: image.length,
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
              ),
              itemBuilder: (BuildContext context, int index) {
                return GridTile(
                  child: InkWell(

                    onTap: (){
                      Navigator.pushNamed(context, navigation[index]);
                    },

                    child: Container(
                      margin: const EdgeInsets.all(12.0),
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
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            Image.asset(image[index], width: 66,),
                            Text(title[index],style: GoogleFonts.poppins(
                              fontSize: 15,
                              fontWeight: FontWeight.bold,
                              color: Colors.black,
                            ),),
                          ],
                        ),
                      )
                    ),
                  ),
                );
              },
            ),
          ),
        )
    );
  }
}
