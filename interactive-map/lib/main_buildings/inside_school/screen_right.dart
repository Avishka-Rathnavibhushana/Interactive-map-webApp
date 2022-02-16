import 'package:flutter/material.dart';
import 'package:interactive_map/main_buildings/home.dart';
import 'package:interactive_map/main_buildings/inside_school/motor.dart';
import 'package:interactive_map/main_buildings/inside_school/school_main_screens.dart';
import 'package:interactive_map/main_buildings/inside_school/energy_saving.dart';
import 'package:interactive_map/widgets/text_area.dart';
import 'package:interactive_map/widgets/text_area_with_clip.dart';
import 'package:video_player/video_player.dart';

class ScreenRight extends StatefulWidget {
  const ScreenRight({Key? key}) : super(key: key);

  @override
  _ScreenRightState createState() => _ScreenRightState();
}

class _ScreenRightState extends State<ScreenRight> {
  late VideoPlayerController _controller;
  int index = 0;
  bool show = false;
  bool _isPlaying = false;
  bool nextIndex = false;
  String url = 'assets/videos/screen_RIGHT_REV.mp4';

  String screenRightImage_1 = 'assets/tempory images/screen_RIGHT.png';
  String screenRightImage_2 = 'assets/tempory images/screen_RIGHT_2.png';

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
    nextIndex = false;
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
            show
                ? nextIndex
                    ? Container(
                        width: screenSize.width,
                        child: Image.asset(
                          screenRightImage_1,
                          fit: BoxFit.fill,
                        ),
                      )
                    : Container(
                        width: screenSize.width,
                        child: Image.asset(
                          screenRightImage_2,
                          fit: BoxFit.fill,
                        ),
                      )
                : Container(),
            show ? nextButton() : Container(),
            // show ? backButton() : Container(),
            show ? menuButton() : Container(),
            show
                ? nextIndex
                    ? Positioned(
                        top: screenSize.height * (0.1),
                        child: TextAreaWithClip(
                            screenSize: screenSize,
                            texts: const [
                              "Easily mange temparature setpoints and scheduling anytime, anywhere 24/7",
                            ],
                            topic: "Smart HVAC",
                            description: ""),
                      )
                    : Positioned(
                        top: screenSize.height * (0.1),
                        child: TextAreaWithClip(
                            screenSize: screenSize,
                            texts: const [
                              "Monitor equipment performance with fault detection and alerts for preventative maintenance",
                              "Reduce costs and resolve issues before customers are affected"
                            ],
                            topic: "Smart HVAC",
                            description: ""),
                      )
                : Container(),
          ],
        ),
      ),
    );
  }

  Widget nextButton() {
    var screenSize = MediaQuery.of(context).size;
    return Positioned(
      bottom: screenSize.height * (0.2),
      right: 0,
      child: GestureDetector(
        onTap: () {
          if (nextIndex) {
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
              nextIndex = true;
            });
          }
        },
        child: Container(
          width: screenSize.width * 0.091,
          height: screenSize.width * 0.040,
          decoration: const BoxDecoration(
            image: DecorationImage(
              image: AssetImage('assets/graphics/Next.png'),
              fit: BoxFit.cover,
            ),
          ),
        ),
      ),
    );
  }

  // Widget backButton() {
  //   var screenSize = MediaQuery.of(context).size;
  //   return SizedBox(
  //     height: screenSize.height * 0.95,
  //     child: Align(
  //       alignment: Alignment.topRight,
  //       child: GestureDetector(
  //         onTap: () {
  //           if (nextIndex) {
  //             setState(() {
  //               nextIndex = false;
  //             });
  //           } else {
  //             setShow();
  //             _controller.play();
  //             _controller.addListener(() {
  //               final bool isPlaying = _controller.value.isPlaying;

  //               if (isPlaying != _isPlaying) {
  //                 setState(() {
  //                   _isPlaying = isPlaying;
  //                   setIndex(++index);
  //                 });
  //                 if (index > 1) {
  //                   _controller.removeListener(() {});
  //                   Navigator.pushReplacement(
  //                     context,
  //                     PageRouteBuilder(
  //                       pageBuilder: (context, animation1, animation2) =>
  //                           const SchoolMainScreens(),
  //                       transitionDuration: const Duration(seconds: 2),
  //                       transitionsBuilder:
  //                           (context, animation, secondaryAnimation, child) =>
  //                               FadeTransition(
  //                         opacity: animation,
  //                         child: child,
  //                       ),
  //                     ),
  //                   );
  //                 }
  //               }
  //             });
  //           }
  //         },
  //         child: Container(
  //           width: screenSize.width * 0.050,
  //           height: screenSize.width * 0.050,
  //           decoration: BoxDecoration(
  //             boxShadow: [
  //               BoxShadow(
  //                 color: Colors.grey.withOpacity(0.5),
  //                 spreadRadius: 5,
  //                 blurRadius: 7,
  //                 offset: const Offset(0, 3), // changes position of shadow
  //               ),
  //             ],
  //             image: const DecorationImage(
  //               image: AssetImage('assets/graphics/back.png'),
  //               fit: BoxFit.cover,
  //             ),
  //           ),
  //         ),
  //       ),
  //     ),
  //   );
  // }

  Widget menuButton() {
    var screenSize = MediaQuery.of(context).size;
    return SizedBox(
      height: screenSize.height * 0.95,
      child: Align(
        alignment: Alignment.topRight,
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
            decoration: const BoxDecoration(
              image: DecorationImage(
                image: AssetImage('assets/graphics/HOME.png'),
                fit: BoxFit.cover,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
