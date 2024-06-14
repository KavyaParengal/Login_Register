
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:login_register/Client-Dashboard/Provider/plan_list_provider.dart';
import 'package:login_register/Client-Dashboard/Screens/HomePage/home_page.dart';
import 'package:login_register/Utilities/global.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:url_launcher/url_launcher.dart';

import '../../Login/login_page.dart';
import '../../Utilities/colors.dart';
import '/Widgets/loading_icon.dart';

class PremiumPlanPage extends StatefulWidget {
  final String? id;
  const PremiumPlanPage({super.key, this.id});

  @override
  State<PremiumPlanPage> createState() => _PremiumPlanPageState();
}

class _PremiumPlanPageState extends State<PremiumPlanPage> {

  bool isLoading = true;

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      Provider.of<PlanListProvider>(context, listen: false).getPlanList();
    });
    // initUniLinks();
  }

  _launchPayment(String pId) async {
    await launch("https://gentlebirthmethod.in/home/payment_gateway/?x=${widget.id.toString()}&plan_id=$pId", forceSafariVC: false, );
    print("https://gentlebirthmethod.in/home/payment_gateway/?x=${widget.id.toString()}&plan_id=$pId");
  }

  // String _latestLink = 'Unknown';
  // Uri? _latestUri;
  //
  // void initUniLinks() async {
  //   // Platform messages may fail, so we use a try/catch PlatformException.
  //   try {
  //     // Attach a listener to the links stream
  //     getUriLinksStream().listen((Uri? uri) {
  //       if (!mounted) return;
  //       setState(() {
  //         _latestLink = uri.toString();
  //         _latestUri = uri;
  //       });
  //       // Check if the deep link matches the success link
  //       if (_latestUri?.toString() == 'yourapp://payment/success') {
  //         // Navigate to the login page
  //         // You can replace this with your actual navigation logic
  //         Navigator.pushReplacement(
  //           context,
  //           MaterialPageRoute(builder: (context) => LoginPage()),
  //         );
  //       }
  //     }, onError: (Object err) {
  //       if (!mounted) return;
  //       setState(() {
  //         _latestLink = 'Failed to get latest link: $err.';
  //         _latestUri = null;
  //       });
  //     });
  //
  //     // Get the latest link
  //     final initialLink = await getInitialUri();
  //     if (initialLink != null) {
  //       setState(() {
  //         _latestLink = initialLink.toString();
  //         _latestUri = initialLink;
  //       });
  //       // Check if the deep link matches the success link
  //       if (_latestUri?.toString() == 'yourapp://payment/success') {
  //         // Navigate to the login page
  //         // You can replace this with your actual navigation logic
  //         Navigator.pushReplacement(
  //           context,
  //           MaterialPageRoute(builder: (context) => LoginPage()),
  //         );
  //       }
  //     }
  //   } catch (e) {
  //     print(e);
  //   }
  // }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
          preferredSize: const Size.fromHeight(60),
          child: AppBar(
              flexibleSpace: Container(
                decoration: BoxDecoration(
                    // gradient: LinearGradient(
                    //     colors: [Colors.teal.shade500, Colors.teal.shade500, Colors.black]
                    // )
                    color: appBarColor
                ),
              ),
              elevation: 0,
              title: Text(
                Global().appName,
                style: GoogleFonts.poppins(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                ),
                textAlign: TextAlign.start,
              ),
            leading: IconButton(
                onPressed: (){
                  // Navigator.pop(context);
                  Navigator.push(context, MaterialPageRoute(builder: (context) => HomePage()));
                },
                icon: Icon(
                  Icons.arrow_back, color: Colors.white,
                )
            ),
          )),
      body: Consumer<PlanListProvider>(
        builder: (context, value, child) {
          if (value.isLoading) {
            return const Center(
                child: LoadingIcon()
            );
          }
          final planList = value.planList;
          return planList == null || planList.isEmpty ? Center(
            child: Text('No Payment Plans Available',
              style: GoogleFonts.poppins(
                fontSize: 16,
                fontWeight: FontWeight.w500,
                color: Colors.teal.shade700,
              ),
            ),
          ) : Column(
            children: [
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text(
                  'Plan List',
                  style: GoogleFonts.poppins(
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                    color: Colors.teal.shade800,
                  ),
                  textAlign: TextAlign.start,
                ),
              ),
              ListView.builder(
                shrinkWrap: true,
                itemCount: planList.length,
                  itemBuilder: (context, index){
                    return Container(
                      padding: EdgeInsets.all(10),
                      margin: const EdgeInsets.all(12.0),
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(12),
                        boxShadow: [
                          BoxShadow(
                            color: Colors.teal,
                            offset: Offset(1.1, 3),
                            blurRadius: 2,
                            spreadRadius: 1
                          )
                        ]
                      ),
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: [
                              RichText(text: TextSpan(children:[
                                  TextSpan(text: "Plan Type : ",style: TextStyle(
                                      color: Colors.teal.shade700,fontWeight: FontWeight.bold, fontSize: 16)),
                                  TextSpan(text:planList[index].plan??'not Given',style: TextStyle(
                                      color: Colors.black, fontWeight: FontWeight.w400, fontSize: 16))
                                ])),
                                RichText(text: TextSpan(children:[
                                  TextSpan(text: "Amount    : ",style: TextStyle(
                                      color: Colors.teal.shade700,fontWeight: FontWeight.bold, fontSize: 16)),
                                  TextSpan(text:planList[index].price.toString()??'0',style: TextStyle(
                                      color: Colors.black, fontWeight: FontWeight.w400, fontSize: 16)
                                  )
                                ])),
                              ],
                            ),
                            ElevatedButton(
                              onPressed: () async{
                                //Navigator.pushNamed(context, RouteName.premium_content);
                                await _launchPayment(planList[index].id.toString());
                                SharedPreferences localStorage = await  SharedPreferences.getInstance();
                                localStorage.setString('token', '');
                                localStorage.setString('userName', '');
                                Navigator.push(context, MaterialPageRoute(builder: (context)=>LoginPage()));
                              },
                              style: ElevatedButton.styleFrom(
                                  backgroundColor: button, // foreground (text) color
                                  shape: ContinuousRectangleBorder()
                              ),
                              child: Text(
                                " Pay Now ",
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
                    );
                  }
              ),
            ],
          );
        }
      ),
    );
  }
}
