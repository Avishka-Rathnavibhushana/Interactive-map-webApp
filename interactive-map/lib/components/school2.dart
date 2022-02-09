import 'package:flutter/material.dart';
import 'package:interactive_map/main_buildings/home.dart';
import 'package:interactive_map/components/screen.dart';
import 'package:video_player/video_player.dart';

class School2Video extends StatefulWidget {
  const School2Video({Key? key}) : super(key: key);

  @override
  _School2VideoState createState() => _School2VideoState();
}

class _School2VideoState extends State<School2Video> {
  late VideoPlayerController _controller;
  bool _isPlaying = false;
  int index = 0;
  bool show = false;
  final String url = 'assets/videos/school_map_v002.mp4';

  setIndex(value){
    index = value;
    setState(() {});
  }

  setShow(){
    setState(() {
      show = !show;
    });
  }

  @override
  void initState() {
    // Create and store the VideoPlayerController. The VideoPlayerController
    // offers several different constructors to play videos from assets, files,
    // or the internet.
    index = 0;
    show = false;
    _controller = VideoPlayerController.asset(url)
      ..addListener(() {
        final bool isPlaying = _controller.value.isPlaying;
        if (isPlaying != _isPlaying) {
          setState(() {
            _isPlaying = isPlaying;
            setIndex(++index);
          });
          if(index > 1) {
            Navigator.pushReplacement(
              context,
              PageRouteBuilder(
                pageBuilder: (context, animation1, animation2) => const ScreenVideo(),
                transitionDuration: Duration.zero,
              ),
            );
          }
        }
      })
      ..initialize().then((_) => {
        setState((){
          _controller.setVolume(0);
          _controller.play();
        })
      });

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    var screenSize = MediaQuery.of(context).size;
    return Scaffold(
      // Use a FutureBuilder to display a loading spinner while waiting for the
      // VideoPlayerController to finish initializing.
      body: SingleChildScrollView(
        child: Stack(
          children: [
            AspectRatio(
              aspectRatio: _controller.value.aspectRatio,
              // Use the VideoPlayer widget to display the video.
              child: VideoPlayer(_controller),
            ),
          ],
        ),
      ),
    );
  }
}
