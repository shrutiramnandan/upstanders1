
import 'package:flutter/material.dart';
import 'package:video_player/video_player.dart';

class VideoShower extends StatefulWidget {
  final String videoAsset;

  const VideoShower({Key key, this.videoAsset}) : super(key: key);
  @override
  _VideoShowerState createState() => _VideoShowerState();
}

class _VideoShowerState extends State<VideoShower> {
  VideoPlayerController _controller;

  @override
  void initState() {
    super.initState();
    _controller = VideoPlayerController.asset(widget.videoAsset
       )
      ..initialize().then((_) {
        setState(() {});
      });
    // _controller = VideoPlayerController.network(
      //   'https://www.sample-videos.com/video123/mp4/720/big_buck_bunny_720p_20mb.mp4')
      // ..initialize().then((_) {
      //   // Ensure the first frame is shown after the video is initialized, even before the play button has been pressed.
      //   setState(() {});
      // });
  }

  @override
  Widget build(BuildContext context) {
    print("_controller.value.duration _controller.value.duration:${_controller.value.isBuffering}");
    return Scaffold(
        body: Center(
          child: _controller.value.isInitialized
              ? AspectRatio(
                  aspectRatio: _controller.value.aspectRatio,
                  child: VideoPlayer(_controller),
                )
              : Container(),
        ),
        
        floatingActionButton: FloatingActionButton(
          onPressed: () {
            setState(() {
              
              _controller.value.isPlaying
                  ? _controller.pause()
                  : _controller.play();
            });
          },
          child: Icon(
            _controller.value.isPlaying ? Icons.pause : Icons.play_arrow,
          ),
        ),
     
    );
  }

  @override
  void dispose() {
    super.dispose();
    _controller.dispose();
  }
}

