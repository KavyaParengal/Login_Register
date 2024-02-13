import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:login_register/Admin-Dashboard/Api_services/delete_free_content_api.dart';
import 'package:login_register/Admin-Dashboard/Provider/admin_view_free_video_provider.dart';
import 'package:login_register/Admin-Dashboard/Screens/edit_free_content.dart';
import 'package:provider/provider.dart';
import 'package:youtube_player_flutter/youtube_player_flutter.dart';

import '../../Client-Dashboard/Routes/route_names.dart';
import '../../Client-Dashboard/Widgets/loading_icon.dart';

class AdminViewFreeContent extends StatefulWidget {
  @override
  State<AdminViewFreeContent> createState() => _AdminViewFreeContentState();
}

class _AdminViewFreeContentState extends State<AdminViewFreeContent> {

  late YoutubePlayerController _controller;
  late PlayerState _playerState;
  late YoutubeMetaData _videoMetaData;
  bool _isPlayerReady = true;

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      Provider.of<AdminViewFreeVideoProvider>(context, listen: false).getFreeVideoList();
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
            decoration: BoxDecoration(
                gradient: LinearGradient(colors: [
              Colors.teal.shade500,
              Colors.teal.shade500,
              Colors.black
            ])),
          ),
          elevation: 0,
          title: Text(
            'View Free Content',
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
              icon: Icon(Icons.arrow_back)),
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
      body: Consumer<AdminViewFreeVideoProvider>(
        builder: (context, value, child){
          if (value.isLoading) {
            return const Center(
                child: LoadingIcon()
            );
          }
          final freeVideoList = value.freeVideoList;
        return freeVideoList == null ? Center(
          child: Text('No Content Available',
            style: GoogleFonts.poppins(
              fontSize: 20,
              fontWeight: FontWeight.bold,
              color: Colors.white,
            ),
          ),
          ) : ListView.builder(
                shrinkWrap: true,
                itemCount: freeVideoList.length,
                itemBuilder: (context, index) {
                  final freeContent = freeVideoList[index];
                  String videoId = YoutubePlayer.convertUrlToId(freeContent.video.toString())!;


                  _controller = YoutubePlayerController(
                    initialVideoId: videoId,
                    flags: YoutubePlayerFlags(
                      autoPlay: true,
                      mute: false,
                    ),);

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
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: RichText(
                              text: TextSpan(children: [
                            TextSpan(
                                text: "Title : ",
                                style: TextStyle(
                                    color: Colors.teal.shade700,
                                    fontWeight: FontWeight.bold,
                                    fontSize: 16)),
                            TextSpan(
                                text: freeContent.title,
                                style: TextStyle(
                                    color: Colors.black,
                                    fontWeight: FontWeight.w400,
                                    fontSize: 16))
                          ])),
                        ),
                        // Padding(
                        //   padding: const EdgeInsets.all(8.0),
                        //   child: RichText(
                        //       text: TextSpan(children: [
                        //     TextSpan(
                        //         text: "Description : ",
                        //         style: TextStyle(
                        //             color: Colors.teal.shade700,
                        //             fontWeight: FontWeight.bold,
                        //             fontSize: 16)),
                        //     TextSpan(
                        //         text:
                        //             'gdgsd hajhsk shjs jwhey and sdja djksl kfjh had hdbjs eurowla nsbjs',
                        //         style: TextStyle(
                        //             color: Colors.black,
                        //             fontWeight: FontWeight.w400,
                        //             fontSize: 16))
                        //   ])),
                        // ),
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: RichText(
                              text: TextSpan(children: [
                            TextSpan(
                                text: "Month : ",
                                style: TextStyle(
                                    color: Colors.teal.shade700,
                                    fontWeight: FontWeight.bold,
                                    fontSize: 16)),
                            TextSpan(
                                text: '${freeContent.month}',
                                style: TextStyle(
                                    color: Colors.black,
                                    fontWeight: FontWeight.w400,
                                    fontSize: 16))
                          ])),
                        ),
                        Row(
                          children: [
                            Padding(
                              padding: const EdgeInsets.only(left: 70),
                              child: ElevatedButton(
                                  style: ElevatedButton.styleFrom(
                                      backgroundColor: Colors.teal.shade500),
                                  onPressed: () {
                                    Navigator.push(context, MaterialPageRoute(builder: (context) => EditFreeContent()));
                                  },
                                  child: Text(
                                    "Edit",
                                    style: TextStyle(color: Colors.white),
                                  )),
                            ),
                            Padding(
                              padding: const EdgeInsets.only(left: 50),
                              child: ElevatedButton(
                                  style: ElevatedButton.styleFrom(
                                      backgroundColor: Colors.red),
                                  onPressed: () {
                                    DeleteFreeContent.deleteFreeContent(context, freeContent.id.toString());
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
                },
        );
        },
      ),
    );
  }
}
