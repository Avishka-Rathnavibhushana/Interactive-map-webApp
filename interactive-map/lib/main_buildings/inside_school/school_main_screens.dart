import 'package:flutter/material.dart';
import 'package:interactive_map/main_buildings/home.dart';
import 'package:interactive_map/main_buildings/school.dart';
import 'package:interactive_map/main_buildings/inside_school/screen_left.dart';
import 'package:interactive_map/main_buildings/inside_school/screen_right.dart';
import 'package:interactive_map/widgets/custom_button_label.dart';
import 'package:interactive_map/widgets/custom_button_label_with_clip.dart';
import 'package:interactive_map/widgets/text_area.dart';
import 'package:video_player/video_player.dart';

class SchoolMainScreens extends StatefulWidget {
  const SchoolMainScreens({Key? key}) : super(key: key);

  @override
  _SchoolMainScreensState createState() => _SchoolMainScreensState();
}

class _SchoolMainScreensState extends State<SchoolMainScreens> {
  late VideoPlayerController _controller;

  late VideoPlayerController _leftScreenVideoController;
  bool _leftScreenVideoPlaying = false;
  late VideoPlayerController _rightScreenVideoController;
  bool _rightScreenVideoPlaying = false;

  bool _isPlaying = false;
  int index = 0;
  bool show = false;
  final String url = 'assets/videos/school_REV.mp4';

  String mapMainScreenImage = 'assets/tempory images/screen_MAIN.png';

  setIndex(value) {
    index = value;
    setState(() {});
  }

  setShow() {
    setState(() {
      show = !show;
    });
  }

  bool loading = true;

  @override
  void initState() {
    setState(() {
      loading = true;
    });

    index = 0;
    show = false;

    videoHandler();

    super.initState();
  }

  videoHandler() async {
    _controller = VideoPlayerController.asset(url);
    await _controller.initialize();
    setState(() {
      _controller.setVolume(0);
      _controller.setLooping(false);
      show = true;
    });

    _leftScreenVideoController =
        VideoPlayerController.asset("assets/videos/screen_LEFT.mp4")
          ..initialize().then((_) => {
                setState(() {
                  _leftScreenVideoController.setVolume(0);
                  _leftScreenVideoController.setLooping(false);
                })
              });
    _rightScreenVideoController =
        VideoPlayerController.asset("assets/videos/screen_RIGHT.mp4")
          ..initialize().then((_) => {
                setState(() {
                  _rightScreenVideoController.setVolume(0);
                  _rightScreenVideoController.setLooping(false);
                })
              });

    setState(() {
      loading = false;
    });
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
            show
                ? AspectRatio(
                    aspectRatio: _controller.value.aspectRatio,
                    // Use the VideoPlayer widget to display the video.
                    child: VideoPlayer(_controller),
                  )
                : Container(),
            Container(
              width: screenSize.width,
              child: Image.asset(
                mapMainScreenImage,
                fit: BoxFit.fill,
              ),
            ),

            show ? screenLeft() : Container(),
            show ? screenRight() : Container(),
            //show ? backButton() : Container(),
            show ? menuButton() : Container(),

            _leftScreenVideoPlaying
                ? AspectRatio(
                    aspectRatio: _leftScreenVideoController.value.aspectRatio,
                    // Use the VideoPlayer widget to display the video.
                    child: VideoPlayer(_leftScreenVideoController),
                  )
                : Container(),
            _rightScreenVideoPlaying
                ? AspectRatio(
                    aspectRatio: _rightScreenVideoController.value.aspectRatio,
                    // Use the VideoPlayer widget to display the video.
                    child: VideoPlayer(_rightScreenVideoController),
                  )
                : Container(),
            loading
                ? Container(
                    width: screenSize.width,
                    child: Image.asset(
                      mapMainScreenImage,
                      fit: BoxFit.fill,
                    ),
                  )
                : Container(),

            show
                ? Positioned(
                    bottom: screenSize.height * (0.2),
                    left: 0,
                    child: TextArea(
                      screenSize: screenSize,
                      texts: [],
                      topic: "Trntide App for Mobile and Desktop",
                      description:
                          "Remotely monitor and manage HVAC equipment and yor entire building",
                    ),
                  )
                : Container(),
          ],
        ),
      ),
    );
  }

  Widget screenLeft() {
    var screenSize = MediaQuery.of(context).size;
    return Positioned(
        left: screenSize.width * (0.362),
        top: screenSize.width * (0.184),
        child: Stack(
          children: [
            GestureDetector(
              onTap: () async {
                setShow();

                //await Future.delayed(Duration(seconds: 1));

                setState(() {
                  _leftScreenVideoPlaying = true;
                });
                _leftScreenVideoController.play();

                _leftScreenVideoController.addListener(() {
                  final bool isPlaying =
                      _leftScreenVideoController.value.isPlaying;
                  print(isPlaying);
                  if (isPlaying != _isPlaying) {
                    setState(() {
                      _isPlaying = isPlaying;
                      setIndex(++index);
                    });
                    if (index > 1) {
                      _leftScreenVideoController.removeListener(() {});

                      Navigator.pushReplacement(
                        context,
                        PageRouteBuilder(
                          pageBuilder: (context, animation1, animation2) =>
                              ScreenLeft(),
                          transitionDuration: Duration(seconds: 2),
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
              },
              child: CustomButtonLabelWithClip(
                screenSize: screenSize,
                text: "Smart Building Operations",
                type: 1,
              ),
            ),
          ],
        ));
  }

  Widget screenRight() {
    var screenSize = MediaQuery.of(context).size;
    return Positioned(
        left: screenSize.width * (0.732),
        top: screenSize.width * (0.205),
        child: Stack(
          children: [
            GestureDetector(
              onTap: () {
                setShow();
                if (_controller.value.isPlaying) {
                  _controller.pause();
                }

                setState(() {
                  _rightScreenVideoPlaying = true;
                });
                _rightScreenVideoController.play();

                _rightScreenVideoController.addListener(() {
                  final bool isPlaying =
                      _rightScreenVideoController.value.isPlaying;
                  print(isPlaying);
                  if (isPlaying != _isPlaying) {
                    setState(() {
                      _isPlaying = isPlaying;
                      setIndex(++index);
                    });
                    if (index > 1) {
                      _rightScreenVideoController.removeListener(() {});

                      Navigator.pushReplacement(
                        context,
                        PageRouteBuilder(
                          pageBuilder: (context, animation1, animation2) =>
                              ScreenRight(),
                          transitionDuration: Duration(seconds: 2),
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
              },
              child: CustomButtonLabelWithClip(
                screenSize: screenSize,
                text: "Smart HVAC",
                type: 2,
              ),
            ),
          ],
        ));
  }

  // Widget backButton() {
  //   var screenSize = MediaQuery.of(context).size;
  //   return SizedBox(
  //     height: screenSize.height * 0.95,
  //     child: Align(
  //       alignment: Alignment.topRight,
  //       child: GestureDetector(
  //         onTap: () {
  //           setShow();
  //           _controller.play();

  //           _controller.addListener(() {
  //             final bool isPlaying = _controller.value.isPlaying;

  //             if (isPlaying != _isPlaying) {
  //               setState(() {
  //                 _isPlaying = isPlaying;
  //                 setIndex(++index);
  //               });
  //               if (index > 1) {
  //                 _controller.removeListener(() {});
  //                 Navigator.pushReplacement(
  //                   context,
  //                   PageRouteBuilder(
  //                     pageBuilder: (context, animation1, animation2) =>
  //                         const SchoolVideo(),
  //                     transitionDuration: const Duration(seconds: 2),
  //                     transitionsBuilder:
  //                         (context, animation, secondaryAnimation, child) =>
  //                             FadeTransition(
  //                       opacity: animation,
  //                       child: child,
  //                     ),
  //                   ),
  //                 );
  //               }
  //             }
  //           });
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
