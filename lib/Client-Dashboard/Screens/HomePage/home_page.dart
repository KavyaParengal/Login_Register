import 'dart:async';
import 'dart:convert';

import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_expandable_fab/flutter_expandable_fab.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';
import 'package:login_register/Admin-Dashboard/Provider/admin_view_banner_provider.dart';
import 'package:login_register/Admin-Dashboard/Provider/admin_view_workshop_video_provider.dart';
import 'package:login_register/Client-Dashboard/Provider/bannersController.dart';
import 'package:login_register/Client-Dashboard/Provider/workshopVideoController.dart';
import 'package:login_register/Client-Dashboard/Screens/ProfileDetails.dart';
import 'package:login_register/Client-Dashboard/Screens/freecontent.dart';
import 'package:login_register/Client-Dashboard/Screens/premium_plan_page.dart';
import 'package:login_register/Client-Dashboard/Screens/premiumcontent.dart';
import 'package:login_register/Login/login_page.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:http/http.dart' as http;
import 'package:url_launcher/url_launcher.dart';
import 'package:youtube_player_flutter/youtube_player_flutter.dart';
import '../../../Utilities/state_enum.dart';
import '../../../Widgets/error_refresh_icon.dart';
import '../../Api_services/viewDashbordDataApi.dart';
import '../../BottomNavigationBar.dart';
import '../../Models/dashboardDataModal.dart';
import '../../../Utilities/colors.dart';
import '../../../Utilities/constants.dart';
import '../../../Utilities/global.dart';
import '../../drawer.dart';
import '/Widgets/loading_icon.dart';
import 'Widget/articlecard_item_widget.dart';
import 'Widget/productsection_item_widget.dart';
import 'Widget/videosection_item_widget.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage>{

  late String data ;
  bool isLoading = true;
  DashbordDataModel? userDetails;
  String? token, uname;

  @override
  void initState() {
    super.initState();
    fetchUserDetails();
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      Provider.of<AdminViewBannerProvider>(context, listen: false).getBanners();
      Provider.of<AdminViewWorkshopVideoProvider>(context, listen: false).getWorkshopVideoList();
    });
  }

  Future<DashbordDataModel?> fetchUserDetails() async {
    SharedPreferences localStorage = await SharedPreferences.getInstance();
    token = await localStorage.getString('token');
    try {
      final details = await ViewDashboardData().getDashboardData(token!);
      userDetails=details;
      uname = '${userDetails!.clientDetails!.firstName} ${userDetails!.clientDetails!.lastName}';

      await localStorage.setString('userName', uname!);
      await localStorage.setString('subscription', userDetails!.clientDetails!.subscribed.toString());
      await localStorage.setString('id', userDetails!.clientDetails!.id.toString());
      print(Global.prefs!.getString("subscription"));
      setState(() {
        isLoading = false;
      });
    }
    catch(e){
      print('Failed to fetch user details: $e');
      Navigator.push(context, MaterialPageRoute(builder: (context)=>LoginPage()));
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: NavigationBottomBar(0),
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(60),
        child: AppBar(
          flexibleSpace: Container(
            decoration: BoxDecoration(
                color: Color(0xffe9f6f5)),
          ),
          elevation: 0,
          actions: [
            IconButton(
                onPressed: (){
                  Navigator.push(context, MaterialPageRoute(builder: (context)=> ProfileDetails()));
                },
                icon: const Icon(CupertinoIcons.profile_circled,size: 31,)
            ),
          ],
        ),
      ),
      drawer: FreeNavigationDrawer(),
      body: isLoading ? Center(child: CircularProgressIndicator(color: button,)) :SingleChildScrollView(
        child: Column(
          children: [
            Container(
              width: MediaQuery.of(context).size.width,
              color: Color(0xffe9f6f5),
              padding: EdgeInsets.all(10),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text('Hey $uname !', style: TextStyle(
                        color: titleColor,
                        fontSize: 28,
                        fontWeight: FontWeight.bold
                    )),
                  ),
                  const SizedBox(height: 31,),
                ],
              ),
            ),
            Container(
              height: 75,
              child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  itemCount: 40,
                  itemBuilder: (context, index) {
                    bool isCurrentWeek = index + 1 == userDetails!.date![0];
                    return Container(
                      height: isCurrentWeek ? 71 : 51,
                      width: isCurrentWeek ? 63 : 55,
                      margin: EdgeInsets.symmetric(horizontal: 5),
                      padding: EdgeInsets.all(8),
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(12),
                          border: Border.all(
                              color: isCurrentWeek
                                  ? Colors.deepOrange.shade700
                                  : Color(0xffc7c9db),
                              width: 1)),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text('Week',
                              style: TextStyle(
                                color: isCurrentWeek
                                    ? Colors.red
                                    : Color(0xffc7c9db),
                                fontSize: isCurrentWeek ? 16 : 13,
                              )),
                          Text('${NumberFormat("00").format(index + 1)}',
                              style: TextStyle(
                                  color: isCurrentWeek
                                      ? Colors.red
                                      : Color(0xffc7c9db),
                                  fontSize: isCurrentWeek ? 23 : 16,
                                  fontWeight: FontWeight.bold)),
                        ],
                      ),
                    );
                  }),
            ),
            _buildBabySection(),
            SizedBox(height: 48,),
            _buildQuickRead(),
            SizedBox(height: 48,),
            _buildVideoSection(),
            SizedBox(height: 48,),
            // _buildProductSection(),
          ],
        ),
      ),
    );
  }

  Widget _buildBabySection(){

    String extractNumber(String input) {
      final RegExp regex = RegExp(r'\d+');
      final Match? match = regex.firstMatch(input);
      return match != null ? match.group(0) ?? '' : '';
    }
    
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text('Your Baby', style: TextStyle(
                color: Color(0xff5a5f8c),
                fontSize: 19,
                fontWeight: FontWeight.w700
            )),
          ),
          SizedBox(height: 12,),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Container(
                width: MediaQuery.of(context).size.width / 3.4,
                height: 130,
                decoration: BoxDecoration(
                  color: Colors.green.withOpacity(0.1),
                  border: Border.all(color: Colors.green.shade600),
                  borderRadius: BorderRadius.circular(12)
                ),
                child: Padding(
                  padding: const EdgeInsets.all(12.0),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text('Length', style: TextStyle(
                          color: Color(0xff5a5f8c),
                          fontSize: 18,
                      )),
                      Row(
                        children: [
                          Text('${extractNumber(userDetails!.dashbordDetails!.length.toString())}', style: TextStyle(
                            color: Colors.green.shade700,
                            fontSize: 21,
                            fontWeight: FontWeight.bold
                          )),
                          Text('cm', style: TextStyle(
                            color: Colors.green.shade700,
                            fontSize: 21,
                            fontWeight: FontWeight.bold
                          )),
                        ],
                      )
                    ],
                  ),
                ),
              ),
              Container(
                width: MediaQuery.of(context).size.width / 3.4,
                height: 130,
                decoration: BoxDecoration(
                    color: titleColor.withOpacity(0.1),
                    border: Border.all(color: titleColor),
                    borderRadius: BorderRadius.circular(12)
                ),
                child: Padding(
                  padding: const EdgeInsets.all(12.0),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text('Weight', style: TextStyle(
                        color: Color(0xff5a5f8c),
                        fontSize: 18,
                      )),
                      Row(
                        children: [
                          Text('${extractNumber(userDetails!.dashbordDetails!.weight.toString())}', style: TextStyle(
                              color: titleColor,
                              fontSize: 21,
                              fontWeight: FontWeight.bold
                          )),
                          Text('g', style: TextStyle(
                              color: titleColor,
                              fontSize: 21,
                              fontWeight: FontWeight.bold
                          )),
                        ],
                      )
                    ],
                  ),
                ),
              ),
              Container(
                width: MediaQuery.of(context).size.width / 3.4,
                height: 130,
                decoration: BoxDecoration(
                    color: Colors.deepOrange.withOpacity(0.1),
                    border: Border.all(color: Colors.deepOrange.shade600),
                    borderRadius: BorderRadius.circular(12)
                ),
                child: Padding(
                  padding: const EdgeInsets.all(12.0),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text('Size', style: TextStyle(
                        color: Color(0xff5a5f8c),
                        fontSize: 18,
                      )),
                      Row(
                        children: [
                          Container(
                            constraints: BoxConstraints(
                              maxWidth: (MediaQuery.of(context).size.width / 3.4) - 30
                            ),
                            child: Text('${Global().capitalizeAllWord(userDetails!.dashbordDetails!.size.toString())}', style: TextStyle(
                                color: Colors.deepOrange.shade700,
                                fontSize: 21,
                                fontWeight: FontWeight.bold
                            )),
                          ),
                        ],
                      )
                    ],
                  ),
                ),
              )
            ],
          )
        ],
      ),
    );
  }

  Widget _buildQuickRead() {
    return ChangeNotifierProvider(
      create: (context) => GetBannersController(context),
      child: Consumer<GetBannersController>(
        builder: (context, controller, child) {
          return Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text(
                  'Quick reads',
                  style: TextStyle(
                    color: Color(0xff5a5f8c),
                    fontSize: 19,
                    fontWeight: FontWeight.w700,
                  ),
                ),
              ),
              SizedBox(height: 12),
              controller.state == StateEnum.loading
                  ? Container(
                height: double.infinity,
                width: double.infinity,
                alignment: Alignment.center,
                child: const Center(child: LoadingIcon()),
              )
                  : controller.state == StateEnum.success
                  ? (controller.model == null ||
                  controller.model!.data == null ||
                  controller.model!.data!.isEmpty
                  ? const Center(
                child: Text(
                  "No Banners available",
                  style: TextStyle(
                    color: Color(0xff5a5f8c),
                    fontSize: 15,
                    fontFamily: 'Gilroy',
                  ),
                ),
              )
                  : SizedBox(
                height: 220,
                child: ListView.separated(
                  scrollDirection: Axis.horizontal,
                  itemBuilder: (context, index) {
                    if (controller.model!.data?[index] != null) {
                      return ArticleCardItemWidget(
                          controller.model!.data![index]);
                    } else {
                      return const SizedBox.shrink();
                    }
                  },
                  separatorBuilder: (context, index) {
                    return SizedBox(
                      width: 1,
                    );
                  },
                  itemCount: controller.model!.data!.length,
                ),
              ))
                  : Center(
                child: ErrorRefreshIcon(onPressed: () {
                  controller.fetchGetBanners();
                }),
              ),
            ],
          );
        },
      ),
    );
  }


  Widget _buildVideoSection(){
    return ChangeNotifierProvider(
      create: (context) => GetWorkShopVideoController(context),
      child: Consumer<GetWorkShopVideoController>(
        builder: (context, controller, child) {
          return Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text('Videos for you', style: TextStyle(
                    color: Color(0xff5a5f8c),
                    fontSize: 19,
                    fontWeight: FontWeight.w700
                )),
              ),
              SizedBox(height: 12,),
              controller.state == StateEnum.loading
                  ? Container(
                height: double.infinity,
                width: double.infinity,
                alignment: Alignment.center,
                child: const Center(child: LoadingIcon()),
              )
                  : controller.state == StateEnum.success
                  ? (controller.model == null ||
                  controller.model!.data == null ||
                  controller.model!.data!.isEmpty
                  ? const Center(
                child: Text(
                  "No Work shop videos available",
                  style: TextStyle(
                    color: Color(0xff5a5f8c),
                    fontSize: 15,
                    fontFamily: 'Gilroy',
                  ),
                ),
              )
                  : SizedBox(
                height: 220,
                child: ListView.separated(
                  scrollDirection: Axis.horizontal,
                  itemBuilder: (context, index) {
                    if (controller.model!.data?[index] != null) {
                      return VideoSectionItemWidget(
                          controller.model!.data![index]);
                    } else {
                      return const SizedBox.shrink();
                    }
                  },
                  separatorBuilder: (context, index) {
                    return SizedBox(
                      width: 1,
                    );
                  },
                  itemCount: controller.model!.data!.length,
                ),
              ))
                  : Center(
                      child: ErrorRefreshIcon(onPressed: () {
                        controller.fetchWorkShopVideo();
                      }),
                    ),
            ],
          );
        },
      ),
    );
  }

  Widget _buildProductSection(){
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Text('Products we recommend', style: TextStyle(
              color: Color(0xff5a5f8c),
              fontSize: 19,
              fontWeight: FontWeight.w700
          )),
        ),
        SizedBox(height: 12,),
        SizedBox(
          height: 300,
          child: ListView.separated(
              scrollDirection: Axis.horizontal,
              itemBuilder: (context, index){
                return ProductsectionItemWidget();
              },
              separatorBuilder: (context, index){
                return SizedBox(
                  width: 1,
                );
              },
              itemCount: 6
          ),
        )
      ],
    );
  }
}
