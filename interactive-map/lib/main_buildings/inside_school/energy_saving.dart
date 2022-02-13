import 'package:flutter/material.dart';
import 'package:interactive_map/main_buildings/home.dart';
import 'package:interactive_map/main_buildings/school.dart';
import 'package:video_player/video_player.dart';

class EnergySaving extends StatefulWidget {
  const EnergySaving({Key? key}) : super(key: key);

  @override
  _EnergySavingState createState() => _EnergySavingState();
}

class _EnergySavingState extends State<EnergySaving> {
  //late VideoPlayerController _controller;
  int index = 0;
  bool show = false;
  //final String url = 'assets/videos/datacentre_REV_v001.mp4';

  final String schoolImage = 'assets/images/School_Plain.png';

  setIndex(value) {
    index = value;
    setState(() {});
  }

  setShow() {
    setState(() {
      show = !show;
    });
  }

  @override
  void initState() {
    index = 0;
    show = false;
    // _controller = VideoPlayerController.asset(url)
    //   ..initialize().then((_) => {
    //         setState(() {
    //           _controller.setVolume(0);
    //           _controller.setLooping(false);
    //         })
    //       });

    super.initState();
  }

  @override
  void dispose() {
    //_controller.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    var screenSize = MediaQuery.of(context).size;
    bool _isPlaying = false;
    int index = 0;

    setIndex(value) {
      index = value;
      setState(() {});
    }

    return Scaffold(
      body: SingleChildScrollView(
        child: Stack(
          children: [
            // AspectRatio(
            //   aspectRatio: _controller.value.aspectRatio,
            //   // Use the VideoPlayer widget to display the video.
            //   child: VideoPlayer(_controller),
            // ),
          ],
        ),
      ),
      // floatingActionButton: FloatingActionButton(
      //   onPressed: () {
      //     _controller.play();

      //     _controller.addListener(() {
      //       final bool isPlaying = _controller.value.isPlaying;

      //       if (isPlaying != _isPlaying) {
      //         setState(() {
      //           _isPlaying = isPlaying;
      //           setIndex(++index);
      //         });
      //         if (index > 1) {
      //           _controller.removeListener(() {});
      //           Navigator.pushReplacement(
      //             context,
      //             PageRouteBuilder(
      //               pageBuilder: (context, animation1, animation2) =>
      //                   const SchoolVideo(),
      //               transitionDuration: const Duration(seconds: 2),
      //               transitionsBuilder:
      //                   (context, animation, secondaryAnimation, child) =>
      //                       FadeTransition(
      //                 opacity: animation,
      //                 child: child,
      //               ),
      //             ),
      //           );
      //         }
      //       }
      //     });
      //   },
      //   // Display the correct icon depending on the state of the player.
      //   child: const Icon(
      //     Icons.arrow_back,
      //   ),
      // ),
    );
  }
}
