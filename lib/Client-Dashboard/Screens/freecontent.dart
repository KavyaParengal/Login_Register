import 'dart:convert';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:http/http.dart' as http;
import 'package:login_register/Client-Dashboard/Provider/free_content_provider.dart';
import 'package:login_register/Utilities/state_enum.dart';
import 'package:provider/provider.dart';
import 'package:youtube_player_flutter/youtube_player_flutter.dart';

import '../Models/freecontentmodel.dart';
import '../../Utilities/aboutscreen.dart';
import '../../Utilities/global.dart';
import '/Widgets/loading_icon.dart';

class FreeContent extends StatefulWidget {
  @override
  _FreeContentState createState() => _FreeContentState();
}

class _FreeContentState extends State<FreeContent> {

  bool isLoading = true;
  late YoutubePlayerController _controller;
  List<FreeContentDataModel> _freeContent = [];
  late PlayerState _playerState;
  late YoutubeMetaData _videoMetaData;
  bool _isPlayerReady = true;

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      Provider.of<FreeContentDataProvider>(context, listen: false).getFreeContents();
    });
  }

  List<Citation> citations = [
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
                      "${citations[index].title}",
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
        // drawer: FreeNavigationDrawer(),
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

            leading: IconButton(
                icon: Icon(
                  Icons.arrow_back,
                  color: Colors.white,
                ),
                onPressed: () {
                  Navigator.pop(context);
            }),
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
            actions: [
              IconButton(
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  icon: const Icon(Icons.home, color: Colors.white,))
            ],
          ),
        ),
        body: SingleChildScrollView(
          physics: ScrollPhysics(),
          child: Consumer<FreeContentDataProvider>(
            builder: (context, value, child){
              if (value.state == StateEnum.loading) {
                return const Center(
                    child: LoadingIcon()
                );
              }
              final freeDatas = value.freeDatas;
              return freeDatas.isEmpty && value.state != StateEnum.success ? Align(
                alignment: Alignment.center,
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text(
                    'No Content Found',style: TextStyle(
                      fontSize: 16,
                      color: Colors.teal.shade800,
                      fontWeight: FontWeight.bold
                  ),
                  ),
                ),):
                Column(
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(top: 10,left: 8,right: 8),
                      child: Text(
                        'Free Content',
                        style: GoogleFonts.poppins(
                          fontSize: 22,
                          fontWeight: FontWeight.bold,
                          color: Colors.teal.shade800,
                        ),
                        textAlign: TextAlign.start,
                      ),
                    ),
                    Container(
                    child: ListView.builder(
                      physics: NeverScrollableScrollPhysics(),
                      padding: const EdgeInsets.only(bottom: 100),
                      itemCount: freeDatas.length ?? 0,
                      shrinkWrap: true,
                      itemBuilder: (context, index) {
                        final freeContent = freeDatas[index];
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
                            // Padding(
                            //   padding: const EdgeInsets.all(8.0),
                            //   child: Text(
                            //     utf8.decode(Global()
                            //         .capitalizeAllWord(
                            //             currFreeContentData.crew ?? "")
                            //         .codeUnits),
                            //     style: GoogleFonts.poppins(
                            //         color: Colors.black),
                            //   ),
                            // ),
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
                                        ),
                  ],
                );
            },
          ),
        )
      ),
    );
  }
}
