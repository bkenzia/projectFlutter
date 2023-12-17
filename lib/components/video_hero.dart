import 'package:flutter/material.dart';
import 'package:video_player/video_player.dart';

class VideoHero extends StatefulWidget {
  const VideoHero({super.key});

  @override
  State<VideoHero> createState() => _VideoPlayerState();
}

class _VideoPlayerState extends State<VideoHero> {
  late VideoPlayerController _controller;
  late Future<void> _initializeVideoPlayerFuture;

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        buildVideoPlayer(),
        Align(
          alignment: Alignment.center,
          heightFactor: 3.0,
          child: buildTextWidgets(),
        ),
      ],
    );
  }

  @override
  void initState() {
    super.initState();
    _controller = VideoPlayerController.asset('web/assets/video/v1.mp4');
    _initializeVideoPlayerFuture = _controller.initialize();
    _controller.setLooping(true);
    _controller.play();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  Widget buildVideoPlayer() {
    return FutureBuilder(
      future: _initializeVideoPlayerFuture,
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.done) {
          return AspectRatio(
            aspectRatio: _controller.value.aspectRatio,
            child: VideoPlayer(_controller),
          );
        } else {
          return const Center(
            child: CircularProgressIndicator(),
          );
        }
      },
    );
  }

  Widget buildTextWidgets() {
    return const Column(children: <Widget>[
      Text(
        'France Data',
        style: TextStyle(
          color: Color.fromARGB(255, 221, 214, 214),
          fontSize: 30,
        ),
      ),
      Text(
        "Atlas des données de France",
        style: TextStyle(
          color: Color.fromARGB(255, 221, 214, 214),
          fontSize: 20,
        ),
      ),
    ]);
  }
}
