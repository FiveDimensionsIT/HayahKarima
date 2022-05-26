import 'package:flutter/material.dart';
import 'package:youtube_player_flutter/youtube_player_flutter.dart';

class YoutubePlayerView extends StatefulWidget {
  final String videoUrl;
  const YoutubePlayerView({Key? key, required this.videoUrl}) : super(key: key);

  @override
  _YoutubePlayerViewState createState() => _YoutubePlayerViewState();
}

class _YoutubePlayerViewState extends State<YoutubePlayerView> {
  late YoutubePlayerController _controller;


  @override
  void initState() {
    super.initState();
    var videoId = YoutubePlayer.convertUrlToId(widget.videoUrl);
    _controller = YoutubePlayerController(
      initialVideoId: videoId??'',
      flags: const YoutubePlayerFlags(
        mute: false,
        autoPlay: false,
        disableDragSeek: false,
        loop: false,
        isLive: false,
        forceHD: false,
        enableCaption: true,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return YoutubePlayer(controller: _controller,
      showVideoProgressIndicator: true
    );
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }
}
