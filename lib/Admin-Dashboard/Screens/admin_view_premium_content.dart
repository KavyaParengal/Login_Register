import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:login_register/Admin-Dashboard/Api_services/delete_premium_content_api.dart';
import 'package:login_register/Admin-Dashboard/Screens/edit_premium_content.dart';
import 'package:provider/provider.dart';
import 'package:youtube_player_flutter/youtube_player_flutter.dart';

import '../../Utilities/colors.dart';
import '/Widgets/loading_icon.dart';
import '../Provider/admin_view_paid_video_provider.dart';
import 'admin_home_page.dart';

class AdminViewPremiumContent extends StatefulWidget {
  @override
  State<AdminViewPremiumContent> createState() => _AdminViewPremiumContentState();
}

class _AdminViewPremiumContentState extends State<AdminViewPremiumContent> {
  late YoutubePlayerController _controller;
  late PlayerState _playerState;
  late YoutubeMetaData _videoMetaData;
  bool _isPlayerReady = true;

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      Provider.of<AdminViewPaidVideoProvider>(context, listen: false).getPaidVideoList();
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

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(60),
        child: AppBar(
          flexibleSpace: Container(
            decoration: BoxDecoration(color: appBarColor),
          ),
          elevation: 0,
          title: Text(
            'View Premium Content',
            style: GoogleFonts.poppins(
              fontSize: 20,
              fontWeight: FontWeight.bold,
              color: Colors.white,
            ),
            textAlign: TextAlign.start,
          ),
          leading: IconButton(
            onPressed: () {
              Navigator.pop(context);
            },
            icon: Icon(Icons.arrow_back, color: Colors.white),
          ),
          actions: [
            IconButton(
              onPressed: () {
                Navigator.push(context, MaterialPageRoute(builder: (context) => AdminHomePage()));
              },
              icon: Icon(Icons.home, color: Colors.white),
            ),
          ],
        ),
      ),
      body: Consumer<AdminViewPaidVideoProvider>(
        builder: (context, value, child) {
          if (value.isLoading) {
            return const Center(child: LoadingIcon());
          }
          final paidVideoList = value.paidVideoList;
          return paidVideoList.isEmpty
              ? Center(
            child: Text(
              'No Content Available',
              style: GoogleFonts.poppins(
                fontSize: 16,
                fontWeight: FontWeight.w400,
                color: Colors.teal.shade600,
              ),
            ),
          )
              : ListView.builder(
            shrinkWrap: true,
            itemCount: paidVideoList.length,
            itemBuilder: (context, index) {
              final paidContent = paidVideoList[index];
              String? videoId = YoutubePlayer.convertUrlToId(paidContent.video.toString());

              if (videoId != null) {
                _controller = YoutubePlayerController(
                  initialVideoId: videoId,
                  flags: YoutubePlayerFlags(
                    autoPlay: false,
                    mute: false,
                  ),
                );
              }

              return Container(
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(12),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.teal,
                      offset: Offset(1.1, 3),
                      blurRadius: 2,
                      spreadRadius: 1,
                    ),
                  ],
                ),
                margin: EdgeInsets.all(10),
                padding: EdgeInsets.all(10),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    if (videoId != null)
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: YoutubePlayerBuilder(
                          player: YoutubePlayer(
                            onReady: () {
                              _controller.addListener(listener);
                            },
                            aspectRatio: 16 / 9,
                            controller: _controller,
                          ),
                          builder: (context, player) {
                            return Container(child: player);
                          },
                        ),
                      ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: RichText(
                        text: TextSpan(
                          children: [
                            TextSpan(
                              text: "Title: ",
                              style: TextStyle(
                                color: Colors.teal.shade700,
                                fontWeight: FontWeight.bold,
                                fontSize: 16,
                              ),
                            ),
                            TextSpan(
                              text: paidContent.title,
                              style: TextStyle(
                                color: Colors.black,
                                fontWeight: FontWeight.w400,
                                fontSize: 16,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: RichText(
                        text: TextSpan(
                          children: [
                            TextSpan(
                              text: "Description: ",
                              style: TextStyle(
                                color: Colors.teal.shade700,
                                fontWeight: FontWeight.bold,
                                fontSize: 16,
                              ),
                            ),
                            TextSpan(
                              text: paidContent.discription ?? 'Not given',
                              style: TextStyle(
                                color: Colors.black,
                                fontWeight: FontWeight.w400,
                                fontSize: 16,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: RichText(
                        text: TextSpan(
                          children: [
                            TextSpan(
                              text: "Week: ",
                              style: TextStyle(
                                color: Colors.teal.shade700,
                                fontWeight: FontWeight.bold,
                                fontSize: 16,
                              ),
                            ),
                            TextSpan(
                              text: paidContent.month.toString(),
                              style: TextStyle(
                                color: Colors.black,
                                fontWeight: FontWeight.w400,
                                fontSize: 16,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: RichText(
                        text: TextSpan(
                          children: [
                            TextSpan(
                              text: "Advice: ",
                              style: TextStyle(
                                color: Colors.teal.shade700,
                                fontWeight: FontWeight.bold,
                                fontSize: 16,
                              ),
                            ),
                            TextSpan(
                              text: paidContent.advice ?? 'Not given',
                              style: TextStyle(
                                color: Colors.black,
                                fontWeight: FontWeight.w400,
                                fontSize: 16,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                    Row(
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(left: 70),
                          child: ElevatedButton(
                            style: ElevatedButton.styleFrom(
                              backgroundColor: Colors.teal.shade500,
                            ),
                            onPressed: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => EditPremiumContent(
                                    id: paidContent.id ?? 0,
                                    videoLink: paidContent.video ?? '',
                                    week: paidContent.month ?? 0,
                                    title: paidContent.title ?? '',
                                    description: paidContent.discription ?? 'Not given',
                                    advice: paidContent.advice ?? 'Not given',
                                    plan: "",
                                  ),
                                ),
                              );
                            },
                            child: Text(
                              "Edit",
                              style: TextStyle(color: Colors.white),
                            ),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(left: 50),
                          child: ElevatedButton(
                            style: ElevatedButton.styleFrom(
                              backgroundColor: Colors.red,
                            ),
                            onPressed: () {
                              showDialog(
                                context: context,
                                builder: (context) => AlertDialog(
                                  title: const Text('Are you Sure?'),
                                  content: const Text(
                                    'Once you delete this item, You will not be able to recover this!',
                                  ),
                                  actions: [
                                    TextButton(
                                      onPressed: () async {
                                        DeletePaidContent.deletePaidContent(
                                          context,
                                          paidContent.id.toString(),
                                        );
                                      },
                                      child: Text(
                                        "Delete",
                                        style: TextStyle(
                                          color: button,
                                          fontWeight: FontWeight.bold,
                                        ),
                                      ),
                                    ),
                                    TextButton(
                                      onPressed: () {
                                        Navigator.pop(context);
                                      },
                                      child: Text(
                                        "Cancel",
                                        style: TextStyle(
                                          color: button,
                                          fontWeight: FontWeight.bold,
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              );
                            },
                            child: Text(
                              "Delete",
                              style: TextStyle(color: Colors.white),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              );
            },
          );
        },
      ),
    );
  }
}
