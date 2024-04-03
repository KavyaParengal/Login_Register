import 'dart:convert';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import 'package:http/http.dart' as http;
import 'package:login_register/Client-Dashboard/Models/premiumContentModel.dart';
import 'package:login_register/Client-Dashboard/Provider/premium_content_provider.dart';
import 'package:provider/provider.dart';

import 'package:shared_preferences/shared_preferences.dart';
import 'package:youtube_player_flutter/youtube_player_flutter.dart';

import '../../Routes/route_names.dart';
import '../../Login/login_page.dart';
import '../../Utilities/aboutscreen.dart';
import '../../Utilities/global.dart';
import '../drawer.dart';
import '/Widgets/loading_icon.dart';

class PremiumContent extends StatefulWidget {
  @override
  _PremiumContentState createState() => _PremiumContentState();
}

class _PremiumContentState extends State<PremiumContent> {
  bool isLoading = true;
  late YoutubePlayerController _controller;
  List<PremiumContentDataModel> _premiumContent = [];
  late PlayerState  _playerState;
  late YoutubeMetaData  _videoMetaData;
  bool _isPlayerReady = true;

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      Provider.of<PremiumContentDataProvider>(context, listen: false).getPremiumContents();
    });
  }

  List<Citation> citations = [
    // Citation(
    //   title: "SkimResources",
    //   link:
    //       "https://go.skimresources.com/?id=2866X1446369&isjs=1&jv=15.4.2-stackpath&sref=https%3A%2F%2Fwww.thebump.com%2Fa%2Fpregnancy-books&url=https%3A%2F%2Fwww.walmart.com%2Fip%2FIna-May-s-Guide-to-Childbirth-Updated-with-New-Material-Paperback-9780553381153%2F1955925&xs=1&xtz=-330&xuuid=2225463b54c9594ee652d3e914aceb32&xjsf=other_click__touchstart%20%5B%5D&cci=a34cf277feba3c91ec836fcdd7033d90",
    // ),
    // Citation(
    //     title: "Walmart",
    //     link:
    //         "https://www.walmart.com/ip/The-Pregnancy-Countdown-Book-Nine-Months-of-Practical-Tips-Useful-Advice-and-Uncensored-Truths/17105117?irgwc=1&sourceid=imp_14w3xnwF2xyPTxeS1y2cw1LgUkFylsTmEzLGWg0&veh=aff&wmlspartner=imp_10078&clickid=14w3xnwF2xyPTxeS1y2cw1LgUkFylsTmEzLGWg0&sharedid=thebump.com&affiliates_ad_id=612734&campaign_id=9383")
    // ,
    Citation(
      title: "Citation",
      link: "https://shebirth.com/citation/",
    ),
  ];

  // Future<void> fetchData() async {
  //   SharedPreferences localStorage = await SharedPreferences.getInstance();
  //   String? token = localStorage.getString('token');
  //
  //   List<FreeContentDataModel> data = await ViewFreeContentData.getFreeContentData(token!);
  //
  //   setState(() {
  //     _freeContent = data;
  //     isLoading=false;
  //     print('$_freeContent');
  //   });
  //
  //   // String url = RouteName.free_content;
  //   // if (token != null) {
  //   //   var response = await http.get(Uri.parse(url), headers: {
  //   //     'Authorization': "token $token",
  //   //   });
  //   //   if (response.statusCode == 200) {
  //   //     freeContentModel =
  //   //         FreeContentModel.fromJson(json.decode(response.body));
  //   //   }
  //   //   setState(() {
  //   //     isLoading = false;
  //   //   });
  //   // } else {
  //   //   ScaffoldMessenger.of(context).showSnackBar(SnackBar(
  //   //     content: Text(
  //   //         'Login Details not found. You will be rerouted to the login page'),
  //   //     backgroundColor: Colors.red,
  //   //   ));
  //   //   Future.delayed(Duration(seconds: 2), () {
  //   //     Navigator.push(
  //   //       context,
  //   //       MaterialPageRoute(builder: (context) => LoginPage()),
  //   //     );
  //   //   });
  //   // }
  // }

  void listener() {
    if (_isPlayerReady && mounted && !_controller.value.isFullScreen) {
      setState(() {
        _playerState = _controller.value.playerState;
        _videoMetaData = _controller.metadata;
      });
    }
  }

  Widget referenceInfo() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          " Access to a wide range of health and medical information.\nContent sourced from credible and authoritative sources.\nRegular updates to ensure accuracy and relevance.",
          style: GoogleFonts.poppins(color: Colors.black),
        ),
        Padding(
          padding: const EdgeInsets.only(top: 8.0, bottom: 8),
          child: Text(
            "Citations and Credible Sources:",
            style: GoogleFonts.poppins(
                color: Colors.black, fontSize: 16, fontWeight: FontWeight.w500),
          ),
        ),
        Text(
          " Our content is meticulously researched and referenced, with citations and links to reputable sources such as medical journals, government health agencies, and academic institutions. We are committed to providing you with trustworthy information that you can rely on.\nPlease note that while Shebirth-Sukh Prasavam offers valuable information, it is not a substitute for professional medical advice",
          style: GoogleFonts.poppins(color: Colors.black),
        ),
        ListView.builder(
            shrinkWrap: true,
            itemCount: citations.length,
            itemBuilder: (BuildContext ctx, int index) {
              return InkWell(
                  onTap: () {
                    //launchUrl(Uri.parse(citations[index].link));
                  },
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text(
                      "${index + 1})${citations[index].title}",
                      style: GoogleFonts.poppins(color: Colors.blue),
                    ),
                  ));
            }),
        Column(
          children: [
            Text(
              "For More Info Please Visit our about Page and our website using the below link:",
              style: GoogleFonts.poppins(color: Colors.black),
            ),
            InkWell(
                onTap: () {
                  // launchUrl(Uri.parse("https://sukhprasavam.com/"));
                },
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text(
                    "https://sukhprasavam.com/",
                    style: GoogleFonts.poppins(color: Colors.blue),
                  ),
                ))
          ],
        ),
      ],
    );
  }

  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
          //drawer: FreeNavigationDrawer(),
          appBar: PreferredSize(
            preferredSize: const Size.fromHeight(60),
            child: AppBar(
              titleSpacing: 0,
              flexibleSpace: Container(
                decoration: BoxDecoration(
                    gradient: LinearGradient(
                        colors: [Colors.teal.shade500, Colors.teal.shade500, Colors.black]
                    )
                ),
              ),
              elevation: 0,
              centerTitle: false,
              title: Text(
                Global().appName,
                maxLines: 1,
                style: TextStyle(
                  //fontSize: 18.5,
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                  fontFamily: 'Gilroy',
                ),
                textAlign: TextAlign.start,
              ),
              leading: IconButton(
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  icon: const Icon(Icons.arrow_back,color: Colors.white,)),
              actions: [
                IconButton(
                    onPressed: () {
                      Navigator.pop(context);
                    },
                    icon: const Icon(Icons.home,color: Colors.white,))
              ],
            ),
          ),
          body: Container(
            child: SingleChildScrollView(
              physics: ScrollPhysics(),
              child: Column(
                children: [
                  Align(
                    alignment: Alignment.center,
                    child: Padding(
                      padding: const EdgeInsets.only(top: 10,left: 8,right: 8),
                      child: Text(
                        'Premium Content',
                        style: GoogleFonts.poppins(
                          fontSize: 22,
                          fontWeight: FontWeight.bold,
                          color: Colors.teal.shade800,
                        ),
                        textAlign: TextAlign.start,
                      ),
                    ),
                  ),
                  Consumer<PremiumContentDataProvider>(
                    builder: (context, value, child){
                      if (value.isLoading) {
                        return const Center(
                            child: LoadingIcon()
                        );
                      }
                      final premiumDatas = value.premiumDatas;
                      return
                        // premiumDatas == null ? Center(
                        //   child: Text(
                        //     'No Data Found',style: TextStyle(
                        //       color: Colors.teal.shade800,
                        //       fontWeight: FontWeight.bold
                        //   ),),
                        // ) :
                        Container(
                          child: ListView.builder(
                            physics: NeverScrollableScrollPhysics(),
                            padding: const EdgeInsets.only(bottom: 100),
                            itemCount: premiumDatas.length ?? 0,
                            shrinkWrap: true,
                            itemBuilder: (context, index) {
                              final freeContent = premiumDatas[index];
                              String videoId = YoutubePlayer.convertUrlToId(freeContent.video.toString())!;

                              _controller = YoutubePlayerController(
                                initialVideoId: videoId,
                                flags: YoutubePlayerFlags(
                                  autoPlay: false,
                                  mute: false,
                                ),);

                              return Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: <Widget>[
                                  Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: Text(
                                      Global().capitalizeAllWord(
                                          freeContent.title ?? ""),
                                      style: GoogleFonts.poppins(
                                        fontSize: 16,
                                        fontWeight: FontWeight.bold,
                                        color: Colors.black,
                                      ),
                                    ),
                                  ),
                                  const SizedBox(
                                    height: 10,
                                  ),
                                  Padding(
                                      padding: EdgeInsets.only(
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
                                              controller: _controller),
                                          builder: (context, player) {
                                            return Container(
                                              child: player,
                                            );
                                          })

                                  ),
                                  const SizedBox(
                                    height: 10,
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.all(9),
                                    child: referenceInfo(),
                                  ),
                                  const SizedBox(
                                    height: 10,
                                  ),
                                ],
                              );
                            },
                          ),
                        );
                    },
                  ),
                ],
              ),
            ),
          )
      ),
    );
  }
}
