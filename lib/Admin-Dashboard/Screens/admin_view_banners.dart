
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:login_register/Admin-Dashboard/Screens/edit_banners.dart';

import '../../Routes/route_names.dart';

class AdminViewBanners extends StatefulWidget {
  const AdminViewBanners({super.key});

  @override
  State<AdminViewBanners> createState() => _AdminViewBannersState();
}

class _AdminViewBannersState extends State<AdminViewBanners> {
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
            'View Banners',
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
          actions: [
            IconButton(
                onPressed: (){
                  Navigator.pushNamed(context, RouteName.admin_home);
                },
                icon: Icon(Icons.home,color: Colors.white,)
            )
          ],
        ),
      ),
      body: ListView.builder(
          itemCount: 4,
          shrinkWrap: true,
          itemBuilder: (context, index){
            return Container(
              decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(12),
                  boxShadow: [
                    BoxShadow(
                        color: Colors.teal,
                        offset: Offset(1.1, 3),
                        blurRadius: 2,
                        spreadRadius: 1)
                  ]),
              margin: EdgeInsets.all(10),
              padding: EdgeInsets.all(10),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Image.asset('assets/image.jpg'),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(10.0),
                    child: RichText(
                        text: TextSpan(children: [
                          TextSpan(
                              text: "Order : ",
                              style: TextStyle(
                                  color: Colors.teal.shade700,
                                  fontWeight: FontWeight.bold,
                                  fontSize: 16)),
                          TextSpan(
                              text: 'freeContent.title',
                              style: TextStyle(
                                  color: Colors.black,
                                  fontWeight: FontWeight.w400,
                                  fontSize: 16))
                        ])),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      ElevatedButton(
                          style: ElevatedButton.styleFrom(
                              backgroundColor: Colors.teal.shade500),
                          onPressed: () {
                            Navigator.push(context, MaterialPageRoute(builder: (context) => EditBanners(
                              // id: workshopVideo.id??0,
                              // videoLink: workshopVideo.video??'',
                            )));
                          },
                          child: Text(
                            "Edit",
                            style: TextStyle(color: Colors.white),
                          )),
                      Padding(
                        padding: const EdgeInsets.only(left: 50),
                        child: ElevatedButton(
                            style: ElevatedButton.styleFrom(
                                backgroundColor: Colors.red),
                            onPressed: () {
                              //DeleteFreeContent.deleteFreeContent(context, freeContent.id.toString());
                            },
                            child: Text(
                              "Delete",
                              style: TextStyle(color: Colors.white),
                            )),
                      ),
                    ],
                  )
                ],
              ),
            );
          }
      ),
    );
  }
}
