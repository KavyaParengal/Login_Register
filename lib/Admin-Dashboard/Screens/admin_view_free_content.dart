import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:login_register/Admin-Dashboard/Api_services/delete_free_content_api.dart';
import 'package:login_register/Admin-Dashboard/Provider/admin_view_free_video_provider.dart';
import 'package:login_register/Admin-Dashboard/Screens/add_free_videos.dart';
import 'package:login_register/Admin-Dashboard/Screens/admin_home_page.dart';
import 'package:login_register/Admin-Dashboard/Screens/edit_free_content.dart';
import 'package:provider/provider.dart';
import 'package:youtube_player_flutter/youtube_player_flutter.dart';
import '../../Utilities/colors.dart';
import '/Widgets/loading_icon.dart';

class AdminViewFreeContent extends StatefulWidget {
  @override
  State<AdminViewFreeContent> createState() => _AdminViewFreeContentState();
}

class _AdminViewFreeContentState extends State<AdminViewFreeContent> {

  late YoutubePlayerController _controller;
  late PlayerState _playerState;
  late YoutubeMetaData _videoMetaData;
  bool _isPlayerReady = true;

  int? selectedWeek;


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

  Future<dynamic> _premiumAlert() {
    return showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: const Text('Filter, Which Week content data do you want ? '),
        content: DropdownButtonFormField<int>(
          value: selectedWeek,
          items: [1, 2, 3, 4, 5, 6, 7, 8, 9, 10].map((week) {
            return DropdownMenuItem<int>(
              value: week,
              child: Text('Week $week'),
            );
          }).toList(),
          onChanged: (value) {
            setState(() {
              selectedWeek = value;
            });
          },
        ),
        actions: [
          TextButton(
            onPressed: () async {
              Navigator.pop(context);
            },
            child: Text(
              "OK",
              style: TextStyle(
                color: button,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
        ],
      ),
    );
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(60),
        child: AppBar(
          flexibleSpace: Container(
            decoration: BoxDecoration(
                color: appBarColor),
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
              icon: Icon(Icons.arrow_back, color: Colors.white,)),
          actions: [
            // IconButton(
            //     onPressed: (){
            //       _premiumAlert();
            //       // Navigator.push(context, MaterialPageRoute(builder: (context)=>AdminHomePage()));
            //     },
            //     icon: Icon(Icons.filter_list_alt,color: Colors.white,)
            // ),
            IconButton(
                onPressed: (){
                  Navigator.push(context, MaterialPageRoute(builder: (context)=>AdminHomePage()));
                },
                icon: Icon(Icons.home,color: Colors.white,)
            ),
          ],
        ),
      ),
      // floatingActionButton: FloatingActionButton(
      //   mini: true,
      //   shape: CircleBorder(),
      //   child: Icon(Icons.add, color: Colors.white, size: 28,),
      //   backgroundColor: Colors.teal,
      //   onPressed: () {
      //     Navigator.push(context, MaterialPageRoute(builder: (context) => AdminAddVideos()));
      //   },
      // ),
      body: Consumer<AdminViewFreeVideoProvider>(
        builder: (context, value, child){
          if (value.isLoading) {
            return const Center(
                child: LoadingIcon()
            );
          }
          final freeVideoList = value.freeVideoList;
          return freeVideoList.isEmpty ? Center(
            child: Text('No Content Available',
              style: GoogleFonts.poppins(
                fontSize: 16,
                fontWeight: FontWeight.w400,
                color: Colors.teal.shade600,
              ),
            ),
            ) : SingleChildScrollView(
                physics: ScrollPhysics(),
                child: Column(
                  children: [
                    ListView.builder(
                          shrinkWrap: true,
                          physics: NeverScrollableScrollPhysics(),
                          itemCount: freeVideoList.length,
                          itemBuilder: (context, index) {
                            final freeContent = freeVideoList[index];
                            String videoId = YoutubePlayer.convertUrlToId(freeContent.video.toString())!;

                            // if (selectedWeek != null && freeContent.month != selectedWeek) {
                            //   return SizedBox.shrink();
                            // }

                            _controller = YoutubePlayerController(
                              initialVideoId: videoId,
                              flags: YoutubePlayerFlags(
                                autoPlay: false,
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
                                  Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: RichText(
                                        text: TextSpan(children: [
                                      TextSpan(
                                          text: "Week : ",
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
                                              Navigator.push(context, MaterialPageRoute(builder: (context) => EditFreeContent(
                                                id: freeContent.id??0,
                                                videoLink: freeContent.video??'',
                                                week: freeContent.month??0,
                                                title: freeContent.title??'',
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
                                              showDialog(
                                                context: context,
                                                builder: (context) => AlertDialog(
                                                  title: const Text('Are you Sure?'),
                                                  content: const Text('Once you delete this item, You will not be able to recover this !'),
                                                  actions: [
                                                    TextButton(
                                                      onPressed: () async {
                                                        DeleteFreeContent.deleteFreeContent(context, freeContent.id.toString());
                                                      },
                                                      child: Text("Delete",
                                                        style: TextStyle(
                                                            color: button,
                                                            fontWeight: FontWeight.bold
                                                        ),
                                                      ),
                                                    ),
                                                    TextButton(
                                                      onPressed: () async {
                                                        Navigator.pop(context);
                                                      },
                                                      child: Text("Cancel",
                                                        style: TextStyle(
                                                            color: button,
                                                            fontWeight: FontWeight.bold
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
                                            )),
                                      ),
                                    ],
                                  )
                                ],
                              ),
                            );
                          },
                              ),
                    SizedBox(height: 60,)
                  ],
                ),
              );
        },
      ),
    );
  }
}
