import 'package:flutter/material.dart';
import 'package:interactive_map/main_buildings/home.dart';
import 'package:interactive_map/main_buildings/inside_school/motor.dart';
import 'package:interactive_map/main_buildings/inside_school/school_main_screens.dart';
import 'package:interactive_map/main_buildings/inside_school/temporary.dart';
import 'package:video_player/video_player.dart';

class ScreenLeft extends StatefulWidget {
  const ScreenLeft({Key? key}) : super(key: key);

  @override
  _ScreenLeftState createState() => _ScreenLeftState();
}

class _ScreenLeftState extends State<ScreenLeft> {
  late VideoPlayerController _controller;
  int index = 0;
  bool show = false;
  bool _isPlaying = false;
  int nextIndex = 0;
  String url = 'assets/videos/screen_LEFT_REV_v001.mp4';

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
    // Create and store the VideoPlayerController. The VideoPlayerController
    // offers several different constructors to play videos from assets, files,
    // or the internet.
    index = 0;
    show = false;
    nextIndex = 0;
    _controller = VideoPlayerController.asset(url)
      ..initialize().then((_) => {
            setState(() {
              _controller.setVolume(0);
              show = true;
              _controller.setLooping(false);
            })
          });

    // Use the controller to loop the video.

    super.initState();
  }

  @override
  void dispose() {
    // Ensure disposing of the VideoPlayerController to free up resources.
    _controller.dispose();

    super.dispose();
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
            show ? nextButton() : Container(),
            show ? backButton() : Container(),
            show ? menuButton() : Container(),
            show
                ? nextIndex == 0
                    ? textArea()
                    : nextIndex == 1
                        ? mediumArea()
                        : smallArea()
                : Container(),
          ],
        ),
      ),
    );
  }

  Widget nextButton() {
    var screenSize = MediaQuery.of(context).size;
    return SizedBox(
      height: screenSize.width * 0.52,
      child: Align(
        alignment: Alignment.bottomRight,
        child: GestureDetector(
          onTap: () {
            if (nextIndex == 2) {
              setShow();
              _controller.play();
              _controller.addListener(() {
                final bool isPlaying = _controller.value.isPlaying;

                if (isPlaying != _isPlaying) {
                  setState(() {
                    _isPlaying = isPlaying;
                    setIndex(++index);
                  });
                  if (index > 1) {
                    _controller.removeListener(() {});
                    Navigator.pushReplacement(
                      context,
                      PageRouteBuilder(
                        pageBuilder: (context, animation1, animation2) =>
                            const SchoolMainScreens(),
                        transitionDuration: const Duration(seconds: 2),
                        transitionsBuilder:
                            (context, animation, secondaryAnimation, child) =>
                                FadeTransition(
                          opacity: animation,
                          child: child,
                        ),
                      ),
                    );
                  }
                }
              });
            } else {
              setState(() {
                nextIndex += 1;
              });
            }
          },
          child: Container(
            width: screenSize.width * 0.091,
            height: screenSize.width * 0.040,
            decoration: BoxDecoration(
              boxShadow: [
                BoxShadow(
                  color: Colors.grey.withOpacity(0.5),
                  spreadRadius: 5,
                  blurRadius: 7,
                  offset: const Offset(0, 3), // changes position of shadow
                ),
              ],
              image: const DecorationImage(
                image: AssetImage('assets/graphics/next.png'),
                fit: BoxFit.cover,
              ),
            ),
          ),
        ),
      ),
    );
  }

  Widget backButton() {
    var screenSize = MediaQuery.of(context).size;
    return SizedBox(
      height: screenSize.height * 0.95,
      child: Align(
        alignment: Alignment.topRight,
        child: GestureDetector(
          onTap: () {
            if (nextIndex != 0) {
              setState(() {
                nextIndex -= 1;
              });
            } else {
              setShow();
              _controller.play();
              _controller.addListener(() {
                final bool isPlaying = _controller.value.isPlaying;

                if (isPlaying != _isPlaying) {
                  setState(() {
                    _isPlaying = isPlaying;
                    setIndex(++index);
                  });
                  if (index > 1) {
                    _controller.removeListener(() {});
                    Navigator.pushReplacement(
                      context,
                      PageRouteBuilder(
                        pageBuilder: (context, animation1, animation2) =>
                            const SchoolMainScreens(),
                        transitionDuration: const Duration(seconds: 2),
                        transitionsBuilder:
                            (context, animation, secondaryAnimation, child) =>
                                FadeTransition(
                          opacity: animation,
                          child: child,
                        ),
                      ),
                    );
                  }
                }
              });
            }
          },
          child: Container(
            width: screenSize.width * 0.050,
            height: screenSize.width * 0.050,
            decoration: BoxDecoration(
              boxShadow: [
                BoxShadow(
                  color: Colors.grey.withOpacity(0.5),
                  spreadRadius: 5,
                  blurRadius: 7,
                  offset: const Offset(0, 3), // changes position of shadow
                ),
              ],
              image: const DecorationImage(
                image: AssetImage('assets/graphics/back.png'),
                fit: BoxFit.cover,
              ),
            ),
          ),
        ),
      ),
    );
  }

  Widget menuButton() {
    var screenSize = MediaQuery.of(context).size;
    return SizedBox(
      height: screenSize.height * 0.95,
      child: Align(
        alignment: Alignment.topLeft,
        child: GestureDetector(
          onTap: () {
            _controller.pause();
            _controller.removeListener(() {});
            Navigator.pushReplacement(
              context,
              PageRouteBuilder(
                pageBuilder: (context, animation1, animation2) =>
                    const HomeVideo(),
                transitionDuration: const Duration(seconds: 2),
                transitionsBuilder:
                    (context, animation, secondaryAnimation, child) =>
                        FadeTransition(
                  opacity: animation,
                  child: child,
                ),
              ),
            );
          },
          child: Container(
            width: screenSize.width * 0.050,
            height: screenSize.width * 0.050,
            decoration: BoxDecoration(
              boxShadow: [
                BoxShadow(
                  color: Colors.grey.withOpacity(0.5),
                  spreadRadius: 5,
                  blurRadius: 7,
                  offset: const Offset(0, 3), // changes position of shadow
                ),
              ],
              image: const DecorationImage(
                image: AssetImage('assets/graphics/Home.png'),
                fit: BoxFit.cover,
              ),
            ),
          ),
        ),
      ),
    );
  }

  Widget smallArea() {
    var screenSize = MediaQuery.of(context).size;
    return SizedBox(
      height: screenSize.width * 0.58,
      child: Align(
        alignment: Alignment.centerLeft,
        child: Column(
          mainAxisSize: MainAxisSize.max,
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(height: screenSize.width * 0.35),
            Container(
              width: screenSize.width * 0.35,
              height: screenSize.width * 0.14,
              padding: const EdgeInsets.all(10),
              decoration: BoxDecoration(
                boxShadow: [
                  BoxShadow(
                    color: Colors.grey.withOpacity(0.5),
                    spreadRadius: 5,
                    blurRadius: 7,
                    offset: const Offset(0, 3), // changes position of shadow
                  ),
                ],
                color: const Color(0xFF131438),
              ),
              child: const Text(
                'dfsdfsf dfsdf sdfds dsfsd fsfsdfsdfs sdfdf sdfsdfs dfsdfsdf dsfsdfs sdfsdfs'
                'dsfsfd dfsd sdfdsfs df sd f sdfs sdfsdf sfd sd fdsf sdfds dsf gffgd dfdf dfds s sfssdf sf '
                'dfsdfs fsfs sfs fsfsfsdf dfs fs f',
                style: TextStyle(color: Colors.white),
              ),
            ),
            SizedBox(height: screenSize.width * 0.05),
          ],
        ),
      ),
    );
  }

  Widget mediumArea() {
    var screenSize = MediaQuery.of(context).size;
    return SizedBox(
      height: screenSize.width * 0.58,
      child: Align(
        alignment: Alignment.centerLeft,
        child: Column(
          mainAxisSize: MainAxisSize.max,
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(height: screenSize.width * 0.15),
            Container(
              width: screenSize.width * 0.26,
              height: screenSize.width * 0.18,
              padding: const EdgeInsets.all(10),
              decoration: BoxDecoration(
                boxShadow: [
                  BoxShadow(
                    color: Colors.grey.withOpacity(0.5),
                    spreadRadius: 5,
                    blurRadius: 7,
                    offset: const Offset(0, 3), // changes position of shadow
                  ),
                ],
                color: const Color(0xFF131438),
              ),
              child: const Text(
                'dfsdfsf dfsdf sdfds dsfsd fsfsdfsdfs sdfdf sdfsdfs dfsdfsdf dsfsdfs sdfsdfs'
                'dsfsfd dfsd sdfdsfs df sd f sdfs sdfsdf sfd sd',
                style: TextStyle(color: Colors.white),
              ),
            ),
            SizedBox(height: screenSize.width * 0.05),
          ],
        ),
      ),
    );
  }

  Widget textArea() {
    var screenSize = MediaQuery.of(context).size;
    return SizedBox(
      height: screenSize.width * 0.58,
      child: Align(
        alignment: Alignment.centerLeft,
        child: Column(
          mainAxisSize: MainAxisSize.max,
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              width: screenSize.width * 0.28,
              height: screenSize.width * 0.32,
              padding: const EdgeInsets.all(10),
              decoration: BoxDecoration(
                boxShadow: [
                  BoxShadow(
                    color: Colors.grey.withOpacity(0.5),
                    spreadRadius: 5,
                    blurRadius: 7,
                    offset: const Offset(0, 3), // changes position of shadow
                  ),
                ],
                color: const Color(0xFF131438),
              ),
              child: const Text(
                'dfsdfsf dfsdf sdfds dsfsd fsfsdfsdfs sdfdf sdfsdfs dfsdfsdf dsfsdfs sdfsdfs'
                'dsfsfd dfsd sdfdsfs df sd f sdfs sdfsdf sfd sd fdsf sdfds dsf gffgd dfdf dfds s sfssdf sf '
                'dfsdfs fsfs sfs fsfsfsdf dfs fs fdfsd dfsdf',
                style: TextStyle(color: Colors.white),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
