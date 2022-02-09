import 'package:flutter/material.dart';
import 'package:interactive_map/components/screenrev.dart';
import 'package:interactive_map/main_buildings/home.dart';
import 'package:interactive_map/main_buildings/school.dart';
import 'package:video_player/video_player.dart';

class ScreenVideo extends StatefulWidget {
  const ScreenVideo({Key? key}) : super(key: key);

  @override
  _ScreenVideoState createState() => _ScreenVideoState();
}

class _ScreenVideoState extends State<ScreenVideo> {
  late VideoPlayerController _controller;
  int index = 0;
  bool show = false;
  final String url = 'assets/videos/screen_v001.mp4';

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
      ..initialize().then((_) => {
        setState((){
          _controller.setVolume(0);
        })
      });

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    var screenSize = MediaQuery.of(context).size;
    bool _isPlaying = false;
    int index = 0;

    setIndex(value){
      index = value;
      setState(() {});
    }
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
      floatingActionButton: Row(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          FloatingActionButton(
            heroTag: const Text("btn1"),
            onPressed: () {
              Navigator.pushReplacement(
                context,
                PageRouteBuilder(
                  pageBuilder: (context, animation1, animation2) => const SchoolVideo(),
                  transitionDuration: Duration.zero,
                ),
              );
            },
            // Display the correct icon depending on the state of the player.
            child: const Icon(
              Icons.arrow_back,
            ),
          ),
          FloatingActionButton(
            heroTag: const Text("btn2"),
            onPressed: () {
              _controller.play();
              _controller..addListener(() {
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
                        pageBuilder: (context, animation1, animation2) => const ScreenRevVideo(),
                        transitionDuration: Duration.zero,
                      ),
                    );
                  }
                }
              })
                ..initialize().then((_) {
                  // Ensure the first frame is shown after the video is initialized,
                  // even before the play button has been pressed
                  setState(() {
                    _controller.play();
                    _controller.setLooping(false);
                  });
                });
            },
            // Display the correct icon depending on the state of the player.
            child: const Icon(
              Icons.arrow_forward,
            ),
          ),
        ],
      ),
    );
  }
}
