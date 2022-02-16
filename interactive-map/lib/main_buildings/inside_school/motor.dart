import 'package:flutter/material.dart';
import 'package:interactive_map/main_buildings/home.dart';
import 'package:interactive_map/main_buildings/school.dart';
import 'package:interactive_map/widgets/custom_text_container.dart';
import 'package:interactive_map/widgets/custom_topic.dart';
import 'package:interactive_map/widgets/shared_widgets.dart';
import 'package:interactive_map/widgets/text_area.dart';
import 'package:interactive_map/widgets/text_area_with_clip.dart';
import 'package:video_player/video_player.dart';

class Motor extends StatefulWidget {
  const Motor({Key? key}) : super(key: key);

  @override
  _MotorState createState() => _MotorState();
}

class _MotorState extends State<Motor> {
  late VideoPlayerController _controller;

  late VideoPlayerController _backVideoController;
  bool _backVideoPlaying = false;
  // late VideoPlayerController _menueVideoController;
  // bool _menueVideoPlaying = false;

  bool _isPlaying = false;
  int index = 0;
  bool nextIndex = false;
  bool show = false;
  final String url = 'assets/videos/motor_MAIN.mp4';

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
    nextIndex = false;
    show = false;
    _controller = VideoPlayerController.asset(url)
      ..initialize().then((_) => {
            setState(() {
              _controller.setVolume(0);
              _controller.play();
              show = true;
            })
          });
    _backVideoController =
        VideoPlayerController.asset("assets/videos/school_MOTOR.mp4")
          ..initialize().then((_) => {
                setState(() {
                  _backVideoController.setVolume(0);
                  _backVideoController.setLooping(false);
                })
              });

    _controller.setLooping(true);

    super.initState();
  }

  @override
  void dispose() {
    _controller.dispose();
    _backVideoController.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    var screenSize = MediaQuery.of(context).size;
    return Scaffold(
      body: SingleChildScrollView(
        child: Stack(
          children: [
            AspectRatio(
              aspectRatio: _controller.value.aspectRatio,
              // Use the VideoPlayer widget to display the video.
              child: VideoPlayer(_controller),
            ),
            show ? nextButton() : Container(),
            //show ? backButton() : Container(),
            show ? menuButton() : Container(),
            show
                ? Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      const SizedBox(
                        height: 50,
                      ),
                      const Padding(
                        padding: EdgeInsets.only(left: 25),
                        child: CustomTopic(
                            topic: "Smart Motor System - V Series",
                            subTopic:
                                "Includes: Smart Motor, Motor Controller, and Hub"),
                      ),
                      const SizedBox(
                        height: 25,
                      ),
                      TextAreaWithClip(
                        screenSize: screenSize,
                        texts: const [
                          "Optimal efficiency switched reluctance motor",
                          "Standard NEMA dimensions",
                          "Available in 1-10 HP"
                        ],
                        topic: "",
                        description: "",
                      ),
                      const SizedBox(
                        height: 45,
                      ),
                      nextIndex
                          ? Container(
                              width: screenSize.width * 0.30,
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.start,
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  Container(
                                    width: screenSize.width * 0.30,
                                    child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      children: [
                                        CustomTextContainer(
                                          topic: "IE5+",
                                          description: "ACROSS MOST HP",
                                        ),
                                        SizedBox(
                                          width: 25,
                                        ),
                                        CustomTextContainer(
                                          topic: "Up to 13%",
                                          description:
                                              "ETRA ENERGY SAVINGS OVER VFD",
                                        ),
                                      ],
                                    ),
                                  ),
                                  SizedBox(
                                    height: 25,
                                  ),
                                  Container(
                                    width: screenSize.width * 0.35,
                                    child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      children: [
                                        CustomTextContainer(
                                          topic: "92%",
                                          description:
                                              "PEAK EFFICIENCY AT 3 HP",
                                        ),
                                      ],
                                    ),
                                  ),
                                ],
                              ),
                            )
                          : Container(
                              width: screenSize.width * 0.35,
                              child: Stack(
                                children: [
                                  Container(
                                    width: screenSize.width * 0.20,
                                    height: screenSize.width * 0.15,
                                    decoration: const BoxDecoration(
                                      image: DecorationImage(
                                        image: AssetImage(
                                            'assets/graphics/router.png'),
                                        fit: BoxFit.contain,
                                      ),
                                    ),
                                  ),
                                  Positioned(
                                    left: screenSize.width * 0.1,
                                    child: Container(
                                      width: screenSize.width * 0.15,
                                      height: screenSize.width * 0.1,
                                      padding: const EdgeInsets.all(1),
                                      decoration: const BoxDecoration(
                                        image: DecorationImage(
                                          image: AssetImage(
                                              'assets/graphics/Motor_controller.png'),
                                          fit: BoxFit.contain,
                                        ),
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                    ],
                  )
                : Container(),
            _backVideoPlaying
                ? AspectRatio(
                    aspectRatio: _backVideoController.value.aspectRatio,
                    // Use the VideoPlayer widget to display the video.
                    child: VideoPlayer(_backVideoController),
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
            _controller.pause();
            _controller.removeListener(() {});
            Navigator.pushReplacement(
              context,
              PageRouteBuilder(
                pageBuilder: (context, animation1, animation2) => SchoolVideo(),
                transitionDuration: Duration(seconds: 2),
                transitionsBuilder:
                    (context, animation, secondaryAnimation, child) =>
                        FadeTransition(
                  opacity: animation,
                  child: child,
                ),
              ),
            );
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
  //         onTap: () async {
  //           if (nextIndex) {
  //             setState(() {
  //               nextIndex = false;
  //             });
  //           } else {
  //             setShow();
  //             setState(() {
  //               _backVideoPlaying = true;
  //             });
  //             _backVideoController.play();

  //             _backVideoController.addListener(() {
  //               final bool isPlaying = _backVideoController.value.isPlaying;
  //               print(isPlaying);
  //               if (isPlaying != _isPlaying) {
  //                 setState(() {
  //                   _isPlaying = isPlaying;
  //                   setIndex(++index);
  //                 });
  //                 if (index > 1) {
  //                   _backVideoController.removeListener(() {});

  //                   Navigator.pushReplacement(
  //                     context,
  //                     PageRouteBuilder(
  //                       pageBuilder: (context, animation1, animation2) =>
  //                           SchoolVideo(),
  //                       transitionDuration: Duration(seconds: 2),
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

  // Widget buttonArea() {
  //   var screenSize = MediaQuery.of(context).size;
  //   return SizedBox(
  //     height: screenSize.width * 0.58,
  //     child: Align(
  //       alignment: Alignment.centerLeft,
  //       child: Column(
  //         mainAxisSize: MainAxisSize.max,
  //         mainAxisAlignment: MainAxisAlignment.center,
  //         crossAxisAlignment: CrossAxisAlignment.start,
  //         children: [
  //           Container(
  //             width: screenSize.width * 0.35,
  //             height: screenSize.width * 0.22,
  //             padding: const EdgeInsets.all(10),
  //             decoration: BoxDecoration(
  //               boxShadow: [
  //                 BoxShadow(
  //                   color: Colors.grey.withOpacity(0.5),
  //                   spreadRadius: 5,
  //                   blurRadius: 7,
  //                   offset: const Offset(0, 3), // changes position of shadow
  //                 ),
  //               ],
  //               color: const Color(0xFF131438),
  //             ),
  //             child: const Text(
  //               'dfsdfsf dfsdf sdfds dsfsd fsfsdfsdfs sdfdf sdfsdfs dfsdfsdf dsfsdfs sdfsdfs'
  //               'dsfsfd dfsd sdfdsfs df sd f sdfs sdfsdf sfd sd fdsf sdfds dsf gffgd dfdf dfds s sfssdf sf '
  //               'dfsdfs fsfs sfs fsfsfsdf dfs fs f',
  //               style: TextStyle(color: Colors.white),
  //             ),
  //           ),
  //           Row(
  //             mainAxisSize: MainAxisSize.min,
  //             mainAxisAlignment: MainAxisAlignment.center,
  //             children: [
  //               SizedBox(height: screenSize.width * 0.12),
  //               GestureDetector(
  //                 onTap: () {},
  //                 child: Container(
  //                   width: screenSize.width * 0.091,
  //                   height: screenSize.width * 0.040,
  //                   margin: EdgeInsets.only(left: screenSize.width * 0.05),
  //                   decoration: BoxDecoration(
  //                     boxShadow: [
  //                       BoxShadow(
  //                         color: Colors.grey.withOpacity(0.5),
  //                         spreadRadius: 5,
  //                         blurRadius: 7,
  //                         offset:
  //                             const Offset(0, 3), // changes position of shadow
  //                       ),
  //                     ],
  //                     image: const DecorationImage(
  //                       image: AssetImage('assets/graphics/Next.png'),
  //                       fit: BoxFit.cover,
  //                     ),
  //                   ),
  //                 ),
  //               ),
  //               GestureDetector(
  //                 onTap: () {},
  //                 child: Container(
  //                   width: screenSize.width * 0.091,
  //                   height: screenSize.width * 0.040,
  //                   margin: EdgeInsets.only(left: screenSize.width * 0.06),
  //                   decoration: BoxDecoration(
  //                     boxShadow: [
  //                       BoxShadow(
  //                         color: Colors.grey.withOpacity(0.5),
  //                         spreadRadius: 5,
  //                         blurRadius: 7,
  //                         offset:
  //                             const Offset(0, 3), // changes position of shadow
  //                       ),
  //                     ],
  //                     image: const DecorationImage(
  //                       image: AssetImage('assets/graphics/Next.png'),
  //                       fit: BoxFit.cover,
  //                     ),
  //                   ),
  //                 ),
  //               ),
  //             ],
  //           ),
  //           GestureDetector(
  //             onTap: () {
  //               showDialog(
  //                 context: context,
  //                 builder: (context) {
  //                   return Dialog(
  //                     shape: RoundedRectangleBorder(
  //                         borderRadius: BorderRadius.circular(5)),
  //                     elevation: 16,
  //                     insetPadding: EdgeInsets.all(screenSize.width * 0.2),
  //                     child: Container(
  //                       decoration: const BoxDecoration(
  //                         image: DecorationImage(
  //                           image: AssetImage('assets/images/QR.png'),
  //                           fit: BoxFit.contain,
  //                         ),
  //                       ),
  //                     ),
  //                   );
  //                 },
  //               );
  //             },
  //             child: Container(
  //               width: screenSize.width * 0.091,
  //               height: screenSize.width * 0.040,
  //               margin: EdgeInsets.only(left: screenSize.width * 0.12),
  //               decoration: BoxDecoration(
  //                 boxShadow: [
  //                   BoxShadow(
  //                     color: Colors.grey.withOpacity(0.5),
  //                     spreadRadius: 5,
  //                     blurRadius: 7,
  //                     offset: const Offset(0, 3), // changes position of shadow
  //                   ),
  //                 ],
  //                 image: const DecorationImage(
  //                   image: AssetImage('assets/graphics/Next.png'),
  //                   fit: BoxFit.cover,
  //                 ),
  //               ),
  //             ),
  //           ),
  //         ],
  //       ),
  //     ),
  //   );
  // }
}
