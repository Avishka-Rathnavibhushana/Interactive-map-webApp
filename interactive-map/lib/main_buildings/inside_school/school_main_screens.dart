import 'package:flutter/material.dart';
import 'package:interactive_map/main_buildings/school.dart';
import 'package:interactive_map/main_buildings/inside_school/screen_left.dart';
import 'package:interactive_map/main_buildings/inside_school/screen_right.dart';
import 'package:interactive_map/widgets/custom_button_label_with_clip.dart';
import 'package:interactive_map/widgets/text_area_with_clip.dart';
import 'package:video_player/video_player.dart';

class SchoolMainScreens extends StatefulWidget {
  const SchoolMainScreens({Key? key, this.offsetHor, this.offsetVer})
      : super(key: key);
  final offsetHor;
  final offsetVer;
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

  var screenWidth = 3840 * 0.63;
  var screenHeight = 2160 * 0.63;

  final ScrollController _scrollControllerHrizontal = ScrollController(
    initialScrollOffset: offsetHor,
  );

  final ScrollController _scrollControllerVertical = ScrollController(
    initialScrollOffset: offsetVer,
  );
  static double offsetHor = 0;
  static double offsetVer = 0;

  @override
  Widget build(BuildContext context) {
    var screenSize = MediaQuery.of(context).size;

    if (_scrollControllerHrizontal.hasClients) {
      _scrollControllerHrizontal.animateTo(
          _scrollControllerHrizontal.position.maxScrollExtent / 2,
          duration: const Duration(milliseconds: 1000),
          curve: Curves.easeInOut);
      offsetHor = _scrollControllerHrizontal.position.maxScrollExtent / 2;
    }

    if (_scrollControllerVertical.hasClients) {
      _scrollControllerVertical.animateTo(
          _scrollControllerVertical.position.maxScrollExtent / 2,
          duration: const Duration(milliseconds: 1000),
          curve: Curves.easeInOut);
      offsetVer = _scrollControllerVertical.position.maxScrollExtent / 2;
    }

    return Scaffold(
      backgroundColor: Colors.transparent,
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      floatingActionButton: Container(
        child: Stack(
          alignment: Alignment.topCenter,
          fit: StackFit.expand,
          children: [
            show ? menuButton() : Container(),
            show
                ? Padding(
                    padding: const EdgeInsets.only(bottom: 100),
                    child: Container(
                      alignment: Alignment.bottomLeft,
                      child: TextAreaWithClip(
                        screenSize: screenSize,
                        texts: [],
                        topic: "Trntide App for Mobile and Desktop",
                        description:
                            "Remotely monitor and manage HVAC equipment and yor entire building",
                      ),
                    ),
                  )
                : Container(),
          ],
        ),
      ),
      body: SingleChildScrollView(
        scrollDirection: Axis.horizontal,
        controller: _scrollControllerHrizontal,
        child: SingleChildScrollView(
          scrollDirection: Axis.vertical,
          controller: _scrollControllerVertical,
          child: SizedBox(
            width: screenWidth,
            height: screenHeight,
            child: Stack(
              children: [
                // show
                //     ? SizedBox(
                //         width: screenWidth,
                //         height: screenHeight,
                //         child: VideoPlayer(_controller),
                //       )
                //     : Container(),
                SizedBox(
                  width: screenWidth,
                  height: screenHeight,
                  child: Image.asset(
                    mapMainScreenImage,
                    fit: BoxFit.fill,
                  ),
                ),

                show ? screenLeft() : Container(),
                show ? screenRight() : Container(),
                //show ? backButton() : Container(),

                _leftScreenVideoPlaying
                    ? SizedBox(
                        width: screenWidth,
                        height: screenHeight,
                        child: VideoPlayer(_leftScreenVideoController),
                      )
                    : Container(),
                _rightScreenVideoPlaying
                    ? SizedBox(
                        width: screenWidth,
                        height: screenHeight,
                        child: VideoPlayer(_rightScreenVideoController),
                      )
                    : Container(),
                loading
                    ? SizedBox(
                        width: screenWidth,
                        height: screenHeight,
                        child: Image.asset(
                          mapMainScreenImage,
                          fit: BoxFit.fill,
                        ),
                      )
                    : Container(),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget screenLeft() {
    var screenSize = MediaQuery.of(context).size;
    return Positioned(
        left: screenWidth * 0.35,
        top: screenHeight * 0.34,
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
                              ScreenLeft(
                                  offsetHor: offsetHor, offsetVer: offsetVer),
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
        left: screenWidth * 0.75,
        top: screenHeight * 0.38,
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
  //
  //           _controller.addListener(() {
  //             final bool isPlaying = _controller.value.isPlaying;
  //
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
    return Container(
      alignment: Alignment.topRight,
      height: screenSize.width * 0.050,
      width: screenSize.width * 0.050,
      child: GestureDetector(
        onTap: () {
          _controller.pause();
          _controller.removeListener(() {});
          Navigator.pushReplacement(
            context,
            PageRouteBuilder(
              pageBuilder: (context, animation1, animation2) =>
                  const SchoolVideo(
                from: "map",
              ),
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
    );
  }
}
