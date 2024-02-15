
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:login_register/Admin-Dashboard/Provider/admin_view_banner_provider.dart';
import 'package:login_register/Admin-Dashboard/Screens/edit_banners.dart';
import 'package:login_register/Utilities/constants.dart';
import 'package:provider/provider.dart';

import '../../Client-Dashboard/Widgets/loading_icon.dart';
import '../../Routes/route_names.dart';

class AdminViewBanners extends StatefulWidget {
  const AdminViewBanners({super.key});

  @override
  State<AdminViewBanners> createState() => _AdminViewBannersState();
}

class _AdminViewBannersState extends State<AdminViewBanners> {

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      Provider.of<AdminViewBannerProvider>(context, listen: false).getBanners();
    });
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
      body: Consumer<AdminViewBannerProvider>(
        builder: (context, value, child){
          if (value.isLoading) {
            return const Center(
                child: LoadingIcon()
            );
          }
          final banners = value.bannerList;
          return banners == null ? Center(
            child: Text('No Content Available',
              style: GoogleFonts.poppins(
                fontSize: 20,
                fontWeight: FontWeight.bold,
                color: Colors.white,
              ),
            ),
          ) : ListView.builder(
              itemCount: banners.length,
              shrinkWrap: true,
              itemBuilder: (context, index){
                final bannerList = banners[index];
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
                        child: Image.network(APIConstants.url + bannerList.banners.toString()),
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
                                  text: bannerList.order.toString(),
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
                                  id: bannerList.id??0,
                                  banner: bannerList.banners??'',
                                  order: bannerList.order??0
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
          );
        },
      ),
    );
  }
}
