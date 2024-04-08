
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import 'package:http/http.dart' as http;
import 'package:login_register/Client-Dashboard/Models/premiumContentModel.dart';
import 'package:login_register/Client-Dashboard/Provider/premium_content_provider.dart';
import 'package:login_register/Client-Dashboard/Screens/home_page.dart';
import 'package:provider/provider.dart';
import 'package:youtube_player_flutter/youtube_player_flutter.dart';
import '../../Utilities/aboutscreen.dart';
import '../../Utilities/colors.dart';
import '../../Utilities/global.dart';
import '../BottomNavigationBar.dart';
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
    Citation(
      title: "Citation",
      link: "https://shebirth.com/citation/",
    ),
  ];

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
    return Scaffold(
        bottomNavigationBar: NavigationBottomBar(3),
        appBar: PreferredSize(
          preferredSize: const Size.fromHeight(60),
          child: AppBar(
            titleSpacing: 0,
            flexibleSpace: Container(
              decoration: BoxDecoration(
                  color: appBarColor
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
                    Navigator.push(context, MaterialPageRoute(builder: (context) => HomePage()));
                  },
                  icon: const Icon(Icons.home,color: Colors.white,))
            ],
          ),
        ),
        body: Consumer<PremiumContentDataProvider>(
          builder: (context, value, child){
            if (value.isLoading) {
              return const Center(
                  child: LoadingIcon()
              );
            }
            final premiumDatas = value.premiumDatas;
            return
              premiumDatas == null || premiumDatas.isEmpty ? Center(
                child: Text(
                  'No Premium Data Found',style: TextStyle(
                    color: Colors.teal.shade800,
                    fontWeight: FontWeight.bold
                ),),
              ) :
              SingleChildScrollView(
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
                    ),
                  ],
                ),
              );
          },
        )
    );
  }
}
