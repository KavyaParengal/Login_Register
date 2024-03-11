
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:login_register/Admin-Dashboard/Provider/admin_view_workshop_video_provider.dart';
import 'package:login_register/Admin-Dashboard/Screens/edit_workshop_video.dart';
import 'package:provider/provider.dart';
import 'package:youtube_player_flutter/youtube_player_flutter.dart';

import '/Widgets/loading_icon.dart';
import '../../Routes/route_names.dart';

class AdminViewWorkshopVideo extends StatefulWidget {
  const AdminViewWorkshopVideo({super.key});

  @override
  State<AdminViewWorkshopVideo> createState() => _AdminViewWorkshopVideoState();
}

class _AdminViewWorkshopVideoState extends State<AdminViewWorkshopVideo> {

  late YoutubePlayerController _controller;
  late PlayerState _playerState;
  late YoutubeMetaData _videoMetaData;
  bool _isPlayerReady = true;

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
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

  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
            'View WorkShop Videos',
            style: GoogleFonts.poppins(
              fontSize: 20,
              fontWeight: FontWeight.bold,
              color: Colors.white,
            ),
            textAlign: TextAlign.start,
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
      body: Consumer<AdminViewWorkshopVideoProvider>(
        builder: (context, value, child){
          if (value.isLoading) {
            return const Center(
                child: LoadingIcon()
            );
          }
          final workshopVideoList = value.workshopVideoList;
          return workshopVideoList == null ? Center(
            child: Text('No Video Available',
              style: GoogleFonts.poppins(
                fontSize: 20,
                fontWeight: FontWeight.bold,
                color: Colors.white,
              ),
            ),
          ) : ListView.builder(
            shrinkWrap: true,
            itemCount: workshopVideoList.length,
            itemBuilder: (context, index) {
              final workshopVideo = workshopVideoList[index];
              String videoId = YoutubePlayer.convertUrlToId(workshopVideo.video.toString())!;
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

                    Row(
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(left: 70),
                          child: ElevatedButton(
                              style: ElevatedButton.styleFrom(
                                  backgroundColor: Colors.teal.shade500),
                              onPressed: () {
                                Navigator.push(context, MaterialPageRoute(builder: (context) => EditWorkshopVideo(
                                  id: workshopVideo.id??0,
                                  videoLink: workshopVideo.video??'',
                                )));
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
            },
          );
        },
      ),
    );
  }
}
