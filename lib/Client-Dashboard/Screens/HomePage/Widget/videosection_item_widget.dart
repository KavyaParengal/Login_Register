import 'package:flutter/material.dart';
import 'package:login_register/Client-Dashboard/Models/workshopVideoModel.dart';
import 'package:youtube_player_flutter/youtube_player_flutter.dart';

class VideoSectionItemWidget extends StatefulWidget {
  VideoSectionItemWidget(this.items);

  Data items;

  @override
  State<VideoSectionItemWidget> createState() => _VideoSectionItemWidgetState();
}

class _VideoSectionItemWidgetState extends State<VideoSectionItemWidget> {
  late YoutubePlayerController _controller;
  late PlayerState _playerState;
  late YoutubeMetaData _videoMetaData;
  bool _isPlayerReady = false;
  String _videoDuration = '0:00';
  String _remainingDuration = '0:00';

  @override
  void initState() {
    super.initState();
    _controller = YoutubePlayerController(
      initialVideoId: YoutubePlayer.convertUrlToId(widget.items.video ?? 'jLrLV1pMZ4M')!,
      flags: const YoutubePlayerFlags(
        autoPlay: false,
        mute: false,
      ),
    )..addListener(listener);
  }

  void listener() {
    if (_isPlayerReady && mounted && !_controller.value.isFullScreen) {
      final duration = _controller.metadata.duration;
      final position = _controller.value.position;
      setState(() {
        _playerState = _controller.value.playerState;
        _videoMetaData = _controller.metadata;
        _videoDuration = _formatDuration(duration);
        _remainingDuration = _formatDuration(duration - position);
      });
    }
  }

  String _formatDuration(Duration duration) {
    String twoDigits(int n) => n.toString().padLeft(2, '0');
    final minutes = twoDigits(duration.inMinutes.remainder(60));
    final seconds = twoDigits(duration.inSeconds.remainder(60));
    return '$minutes:$seconds';
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: SizedBox(
        height: 220,
        width: 328,
        child: Stack(
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(20),
              child: YoutubePlayerBuilder(
                player: YoutubePlayer(
                  onReady: () {
                    _isPlayerReady = true;
                  },
                  controller: _controller,
                  showVideoProgressIndicator: true,
                ),
                builder: (context, player) {
                  return Container(
                    child: player,
                  );
                },
              ),
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Container(
                      margin: EdgeInsets.all(10),
                      padding: EdgeInsets.all(2),
                      width: 59,
                      height: 20,
                      color: Colors.black.withOpacity(0.2),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: const [
                          Icon(
                            Icons.ondemand_video,
                            color: Colors.white,
                            size: 16,
                          ),
                          Text(
                            'Video',
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 13,
                              fontWeight: FontWeight.w400,
                            ),
                          ),
                        ],
                      ),
                    ),
                    Container(
                      margin: EdgeInsets.all(10),
                      padding: EdgeInsets.all(2),
                      width: 56,
                      height: 20,
                      color: Colors.black.withOpacity(0.2),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          const Icon(
                            Icons.access_time,
                            color: Colors.white,
                            size: 16,
                          ),
                          Text(
                            _remainingDuration,
                            style: const TextStyle(
                              color: Colors.white,
                              fontSize: 13,
                              fontWeight: FontWeight.w400,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
                // const Padding(
                //   padding: EdgeInsets.all(16.0),
                //   child: Text(
                //     'Advice on how to make your pregnancy easier and more comfortable',
                //     style: TextStyle(
                //       color: Colors.white,
                //       fontSize: 16,
                //       fontWeight: FontWeight.w700,
                //     ),
                //   ),
                // ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
