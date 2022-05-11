import 'package:chewie/chewie.dart';
import 'package:flutter/material.dart';
import 'package:hayah_karema/app/common/themes/app_colors.dart';
import 'package:video_player/video_player.dart';

class VideoPlayerView extends StatefulWidget {
  final String videoUrl;

  const VideoPlayerView({Key? key, required this.videoUrl}) : super(key: key);

  @override
  _VideoPlayerViewState createState() => _VideoPlayerViewState();
}

class _VideoPlayerViewState extends State<VideoPlayerView> {
   late VideoPlayerController _controller;
   late ChewieController _chewieController;
   late Future<void> _initializeVideoPlayerFuture;

  @override
  void initState() {
    super.initState();
    final testVideo = "https://flutter.github.io/assets-for-api-docs/assets/videos/butterfly.mp4";

    _controller = VideoPlayerController.network(widget.videoUrl, videoPlayerOptions: VideoPlayerOptions(allowBackgroundPlayback: true, mixWithOthers: true));
    _initializeVideoPlayerFuture =  _controller.initialize();
    _chewieController = ChewieController(
      videoPlayerController: _controller,
      autoPlay: false,
      looping: false,
      errorBuilder: (_, __) => Center(child: Text("Invalid video URL", style: TextStyle(color: AppColors.current.neutral),)),
      allowFullScreen: true,
      allowMuting: true,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: FutureBuilder(
        future: _initializeVideoPlayerFuture,
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.done) {
            return Chewie(
              controller: _chewieController,
            );
          } else if(snapshot.connectionState == ConnectionState.waiting){
            return const Center(
              child: CircularProgressIndicator(),
            );
          } else {
            return Center(child: Text("Invalid video URL", style: TextStyle(color: AppColors.current.neutral),));
          }
        },
      ),
    );
  }

  @override
  void dispose() {
    _controller.dispose();
    _chewieController.dispose();
    super.dispose();
  }
}
