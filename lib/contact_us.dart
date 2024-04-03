
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:url_launcher/url_launcher.dart';

import 'Utilities/global.dart';

class ContactUs extends StatelessWidget {
  const ContactUs({super.key});

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
            icon: Icon(Icons.arrow_back, color: Colors.white,),
            onPressed: (){
              Navigator.pop(context);
            },
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
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Text('Contact Us', style: GoogleFonts.headlandOne(
            fontWeight: FontWeight.bold,
            color: Colors.teal.shade800,
            fontSize: 23
          ),),
          Padding(
            padding: const EdgeInsets.all(14.0),
            child: Container(
              color: Colors.teal.shade800,
              height: MediaQuery.of(context).size.height -200,
              width: MediaQuery.of(context).size.width -10,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text('Contact Information', style: GoogleFonts.headlandOne(
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                        fontSize: 18
                    ),),
                  ),
                  Column(
                    children: [
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: FaIcon(FontAwesomeIcons.phoneVolume, color: Colors.white,),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Text('020 8530 1146', style: GoogleFonts.headlandOne(
                            fontWeight: FontWeight.w400,
                            color: Colors.white,
                            fontSize: 16
                        ),),
                      ),
                      SizedBox(height: 4,),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: FaIcon(FontAwesomeIcons.envelope, color: Colors.white,),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Text('gowrimotha@gentlebirthmethod.com', style: GoogleFonts.headlandOne(
                            fontWeight: FontWeight.w400,
                            color: Colors.white,
                            fontSize: 15
                        ),),
                      ),
                      SizedBox(height: 4,),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: FaIcon(FontAwesomeIcons.locationDot, color: Colors.white,),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Text('Gentle Birth Method c/o The Kailash Centre, 7 Newcourt Street, St John’s Wood, London, NW8 7AA', style: GoogleFonts.headlandOne(
                            fontWeight: FontWeight.w400,
                            color: Colors.white,
                            fontSize: 15
                        ), textAlign: TextAlign.center,),
                      ),
                    ],
                  ),
                  SizedBox(height: 20,),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      InkWell(
                        onTap: (){
                          launchUrl(Uri.parse('https://www.facebook.com/people/Gentle-Birth-Method/100027428816456/'));
                        },
                        child: CircleAvatar(
                          radius: 25,
                          backgroundColor: Colors.teal.shade700,
                          child: Image.asset('assets/facebook-app-symbol.png', width: 25, color: Colors.white,),
                        ),
                      ),
                      InkWell(
                        onTap: (){
                          launchUrl(Uri.parse('https://www.instagram.com/gentlebirthmethod/'));
                        },
                        child: CircleAvatar(
                          radius: 25,
                          backgroundColor: Colors.white,
                          child: Image.asset('assets/instagram.png', width: 25, color: Colors.black,),
                        ),
                      ),
                      InkWell(
                        onTap: (){
                          launchUrl(Uri.parse('https://www.youtube.com/user/gentlebirthmethod'));
                        },
                        child: CircleAvatar(
                          radius: 25,
                          backgroundColor: Colors.teal.shade700,
                          child: Image.asset('assets/youtube.png', width: 25, color: Colors.white,),
                        ),
                      )
                    ],
                  )
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}
