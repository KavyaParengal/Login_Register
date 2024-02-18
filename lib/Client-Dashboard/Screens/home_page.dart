import 'dart:convert';

import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_expandable_fab/flutter_expandable_fab.dart';
import 'package:flutter_image_slideshow/flutter_image_slideshow.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:login_register/Admin-Dashboard/Provider/admin_view_banner_provider.dart';
import 'package:login_register/Admin-Dashboard/Provider/admin_view_workshop_video_provider.dart';
import 'package:login_register/Routes/route_names.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:http/http.dart' as http;
import 'package:url_launcher/url_launcher.dart';
import 'package:youtube_player_flutter/youtube_player_flutter.dart';
import '../Api_services/viewDashbordDataApi.dart';
import '../Models/dashboardDataModal.dart';
import '../../Utilities/colors.dart';
import '../../Utilities/constants.dart';
import '../../Utilities/global.dart';
import '../Models/freecontentmodel.dart';
import '../Widgets/free_package_drawer.dart';
import '../Widgets/loading_icon.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage>{

  late String data ;
  bool isLoading = true;
  DashbordDataModel? userDetails;
  String? token;
  int _currentIndexBanner = 0;
  int _currentIndexWorkshop = 0;

  late YoutubePlayerController _controller;
  late PlayerState _playerState;
  late YoutubeMetaData _videoMetaData;
  bool _isPlayerReady = true;

  @override
  void initState() {
    super.initState();
    fetchUserDetails();
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      Provider.of<AdminViewBannerProvider>(context, listen: false).getBanners();
      Provider.of<AdminViewWorkshopVideoProvider>(context, listen: false).getWorkshopVideoList();
    });
  }

  void listener() {
    if (_isPlayerReady && mounted && !_controller.value.isFullScreen) {
      setState(() {
        _playerState = _controller.value.playerState;
        _videoMetaData = _controller.metadata;
      });
    }
  }

  Future<DashbordDataModel?> fetchUserDetails() async {
    SharedPreferences localStorage = await SharedPreferences.getInstance();
    token = localStorage.getString('token');
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
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Row(
          children: [
            Padding(
              padding: const EdgeInsets.only(top: 8, left: 8, right: 8),
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
                      text: userDetails!.clientDetails!.firstName.toString()==null?'': Global().capitalizeAllWord(userDetails!.clientDetails!.firstName),
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
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: RichText(
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
            ]),
          ),
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
            color: Colors.teal.withOpacity(0.2),
          ),
          child: userDetails!.dashbordDetails == null ? Center(child: Text(
            'No Data Found', style: TextStyle(
            fontWeight: FontWeight.bold,
            color: Colors.teal.shade800
          ),
          ),):
          SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: <Widget>[
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: userDetails!.dashbordDetails!.image==null? Container():Image(
                    image:NetworkImage(APIConstants.url+'${userDetails!.dashbordDetails!.image.toString()}'),
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
                            userDetails!.dashbordDetails!.length.toString(),
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
                            userDetails!.dashbordDetails!.weight.toString(),
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
                            userDetails!.dashbordDetails!.size.toString(),
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
                      child: Text(userDetails!.dashbordDetails!.description == null ? "":utf8.decode(userDetails!.dashbordDetails!.description!.codeUnits),
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
                    color: Colors.teal.withOpacity(0.2),
                    borderRadius: BorderRadius.circular(10)
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: <Widget>[
                    const FaIcon(FontAwesomeIcons.crown,color: Colors.transparent,size: 14,),
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
                        //Navigator.pushNamed(context, RouteName.premium_content);
                        Navigator.pushNamed(context, RouteName.free_content);
                      },
                      style: ElevatedButton.styleFrom(
                          backgroundColor: button, // foreground (text) color
                          shape: RoundedRectangleBorder()
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
                if(userDetails!.clientDetails!.subscribed == true)
                  Navigator.pushNamed(context, RouteName.premium_content);
                else{
                  _premiumAlert();
                }
              },
            ),
          ],
        ),
        const Divider(
          height: 20,
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
                    color: Colors.teal.withOpacity(0.2),
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
                      image: AssetImage('assets/free_content.png'),
                      height: 60,
                      color: Colors.black,
                    ),
                    const Divider(
                      height: 10,
                      thickness: .01,
                    ),
                    ElevatedButton(
                      onPressed: () {
                        //Navigator.pushNamed(context, RouteName.premium_content);
                        if(userDetails!.clientDetails!.subscribed == true)
                          Navigator.pushNamed(context, RouteName.premium_content);
                        else{
                          _premiumAlert();
                        }
                      },
                      style: ElevatedButton.styleFrom(
                        backgroundColor: button, // foreground (text) color
                        shape: RoundedRectangleBorder()
                      ),
                      child: Text(
                        "Premium Content",
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
                if(userDetails!.clientDetails!.subscribed == true)
                  Navigator.pushNamed(context, RouteName.premium_content);
                else{
                  Navigator.pop(context);
                  _premiumAlert();
                  Navigator.pop(context);
                }
              },
            ),
          ],
        ),
      ],
    );
  }

  // Widget _buildBannerSlide() {
  //   return Consumer<AdminViewBannerProvider>(
  //     builder: (context, value, child){
  //       if (value.isLoading) {
  //         return const Center(
  //             child: LoadingIcon()
  //         );
  //       }
  //       final banners = value.bannerList;
  //
  //       List<Widget> images = banners.map((banner) {
  //         return Image.network(
  //           APIConstants.url + '${banner.banners}',
  //           fit: BoxFit.contain,
  //         );
  //       }).toList();
  //
  //       return Container(
  //         margin: EdgeInsets.only(bottom: 8),
  //         // decoration: BoxDecoration(
  //         //   // borderRadius: BorderRadius.circular(10),
  //         //   color: Colors.teal.withOpacity(0.2),
  //         // ),
  //         child: ImageSlideshow(
  //           height: MediaQuery.of(context).size.height/3,
  //           indicatorColor: Colors.teal.shade500,
  //           indicatorBackgroundColor: Colors.grey,
  //           autoPlayInterval: 4500,
  //           indicatorRadius: 3,
  //           //indicatorBottomPadding: 2,
  //           //indicatorPadding: 8,
  //           isLoop: true,
  //           children: images,
  //           onPageChanged: (value) {
  //             setState(() {
  //               _currentIndexBanner = value;
  //             });
  //           },
  //         ),
  //       );
  //     },
  //   );
  // }

  Widget _buildBannerSlide() {
    return Consumer<AdminViewBannerProvider>(
      builder: (context, value, child) {
        if (value.isLoading) {
          return const Center(
            child: LoadingIcon(),
          );
        }
        final banners = value.bannerList;
        List<Widget> images = banners.map((banner) {
          return Image.network(
            APIConstants.url + '${banner.banners}',
            fit: BoxFit.contain,
          );
        }).toList();

        return Container(
          // margin: EdgeInsets.only(bottom: 8),
          child: CarouselSlider(
            options: CarouselOptions(
              // height: MediaQuery.of(context).size.height / 3,
              aspectRatio: 16 / 9,
              autoPlay: true,
              enlargeCenterPage: true,
              autoPlayInterval: Duration(milliseconds: 4500),
              onPageChanged: (index, reason) {
                setState(() {
                  _currentIndexBanner = index;
                });
              },
            ),
            items: images,
          ),
        );
      },
    );
  }

  // Widget _buildWorkshopVideo() {
  //   return Consumer<AdminViewWorkshopVideoProvider>(
  //     builder: (context, value, child) {
  //       if (value.isLoading) {
  //         return const Center(child: LoadingIcon());
  //       }
  //       final workshop = value.workshopVideoList;
  //       return Container(
  //         height: 250,
  //         child: ListView(
  //           scrollDirection: Axis.horizontal,
  //           children: List.generate(workshop.length, (index) {
  //             final workshops = workshop[index];
  //             String videoId = YoutubePlayer.convertUrlToId('https://www.youtube.com/embed/EoxGlbnQxQw?si=Tkky52aoG8q0zFAY')!;
  //             _controller = YoutubePlayerController(
  //               initialVideoId: videoId,
  //               flags: YoutubePlayerFlags(
  //                 autoPlay: true,
  //                 mute: false,
  //               ),
  //             );
  //             return Padding(
  //               padding: const EdgeInsets.only(
  //                 top: 10,
  //                 bottom: 10,
  //                 left: 2,
  //                 right: 2,
  //               ),
  //               child: YoutubePlayerBuilder(
  //                 player: YoutubePlayer(
  //                   onReady: () {
  //                     _controller.addListener(listener);
  //                   },
  //                   aspectRatio: 16 / 9,
  //                   bottomActions: [],
  //                   topActions: [],
  //                   showVideoProgressIndicator: false,
  //                   controller: _controller,
  //                 ),
  //                 builder: (context, player) {
  //                   return Container(
  //                     width: 320, // Adjust width as needed
  //                     child: player,
  //                   );
  //                 },
  //               ),
  //             );
  //           }),
  //         ),
  //       );
  //     },
  //   );
  // }

  Widget _buildWorkshopVideo() {
    return Consumer<AdminViewWorkshopVideoProvider>(
      builder: (context, value, child) {
        if (value.isLoading) {
          return const Center(child: LoadingIcon());
        }
        final workshop = value.workshopVideoList;
        return Container(
          height: 250,
          child: CarouselSlider.builder(
            // itemCount: workshop.length,
            itemCount: 4,
            options: CarouselOptions(
              //autoPlay: true,
              aspectRatio: 16 / 9,
              enlargeCenterPage: true,
            ),
            itemBuilder: (context, index, realIndex) {
              String videoId = YoutubePlayer.convertUrlToId('https://www.youtube.com/embed/EoxGlbnQxQw?si=Tkky52aoG8q0zFAY')!;
              _controller = YoutubePlayerController(
                initialVideoId: videoId,
                flags: YoutubePlayerFlags(
                  autoPlay: true,
                  mute: false,
                ),
              );
              return Padding(
                padding: const EdgeInsets.only(
                  top: 10,
                  bottom: 10,
                  left: 2,
                  right: 2,
                ),
                child: YoutubePlayerBuilder(
                  player: YoutubePlayer(
                    onReady: () {
                      _controller.addListener(listener);
                    },
                    aspectRatio: 16 / 9,
                    bottomActions: [],
                    topActions: [],
                    showVideoProgressIndicator: false,
                    controller: _controller,
                  ),
                  builder: (context, player) {
                    return Container(
                      width: MediaQuery.of(context).size.width,
                      child: player,
                    );
                  },
                ),
              );
            },
          ),
        );
      },
    );
  }

  Future<dynamic> _premiumAlert() {
    return showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: const Text('Are you Subscribed?'),
        content: const Text('Only Subcribed Users Can Access This !'),
        actions: [
          TextButton(
            onPressed: () async {
              Navigator.pushNamed(context, RouteName.premium_plan);
            },
            child: Text("OK",
              style: TextStyle(
                color: button,
                fontWeight: FontWeight.bold
              ),
            ),
          ),
        ],
      ),
    );
  }

  _launchWhatsapp() async {
    await launch("https://wa.me/919710841234", forceSafariVC: false);
  }

  _launchEmail() async {
    final Uri _emailLaunchUri = Uri(
      scheme: 'mailto',
      path: 'gentlebirthmethodltd@gmail.com',
      query: 'subject=Subject%20Here&body=Body%20of%20the%20email%20here',
    );
    await launch(_emailLaunchUri.toString());
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
      floatingActionButtonLocation: ExpandableFab.location,
      floatingActionButton: ExpandableFab(
        openButtonBuilder: RotateFloatingActionButtonBuilder(
          child: const FaIcon(FontAwesomeIcons.phone),
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
      body: token ==  null ? Center(child: CircularProgressIndicator(color: primary,),) :
        Container(
          width: MediaQuery.of(context).size.width,
          height: MediaQuery.of(context).size.height,
          decoration: BoxDecoration(
            image: DecorationImage(
                image: AssetImage('assets/logo.png'),
              opacity: 0.35
            )
          ),
          child: SingleChildScrollView(
            physics: ScrollPhysics(),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.end,
              children: <Widget>[
                Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: _buildName(),
                ),
                _buildBannerSlide(),
                _buildWorkshopVideo(),
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
