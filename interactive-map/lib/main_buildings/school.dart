import 'package:flutter/material.dart';
import 'package:interactive_map/main_buildings/home.dart';
import 'package:interactive_map/main_buildings/inside_school/motor.dart';
import 'package:interactive_map/main_buildings/inside_school/school_main_screens.dart';
import 'package:interactive_map/main_buildings/inside_school/energy_saving.dart';
import 'package:interactive_map/widgets/custom_button_label.dart';
import 'package:interactive_map/widgets/shared_widgets.dart';
import 'package:interactive_map/widgets/text_area.dart';
import 'package:interactive_map/widgets/text_area_small.dart';
import 'package:video_player/video_player.dart';

class SchoolVideo extends StatefulWidget {
  const SchoolVideo({Key? key}) : super(key: key);

  @override
  _SchoolVideoState createState() => _SchoolVideoState();
}

class _SchoolVideoState extends State<SchoolVideo> {
  late VideoPlayerController _controller;

  late VideoPlayerController _motorVideoController;
  bool _motorVideoPlaying = false;
  late VideoPlayerController _energySavingVideoController;
  bool _energySavingVideoPlaying = false;
  late VideoPlayerController _insideVideoController;
  bool _insideVideoPlaying = false;

  int index = 0;
  bool show = false;
  bool _isPlaying = false;

  final String url = 'assets/videos/school_REV.mp4';

  final String motorVideoImage = 'assets/videos/school_MOTOR.mp4';
  final String energySavingVideoImage = 'assets/videos/school_MOTOR.mp4';
  final String insideVideoImage = 'assets/videos/school_MAP.mp4';

  final String schoolImage = 'assets/tempory images/School_Plain.png';
  final String mapScreenImage = 'assets/tempory images/screen_MAIN.png';

  bool showTextAreaSmall = true;
  bool showEnergySaving = false;

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
    });

    _motorVideoController = VideoPlayerController.asset(motorVideoImage)
      ..initialize().then((_) => {
            setState(() {
              _motorVideoController.setVolume(0);
              _motorVideoController.setLooping(false);
            })
          });
    _energySavingVideoController =
        VideoPlayerController.asset(energySavingVideoImage)
          ..initialize().then((_) => {
                setState(() {
                  _energySavingVideoController.setVolume(0);
                  _energySavingVideoController.setLooping(false);
                })
              });
    _insideVideoController = VideoPlayerController.asset(insideVideoImage)
      ..initialize().then((_) => {
            setState(() {
              _insideVideoController.setVolume(0);
              _insideVideoController.setLooping(false);
            })
          });

    setState(() {
      loading = false;
    });
  }

  @override
  void dispose() {
    _controller.dispose();
    _motorVideoController.dispose();
    _energySavingVideoController.dispose();
    _insideVideoController.dispose();

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
              child: VideoPlayer(_controller),
            ),
            show ? motor() : Container(),
            show ? energySaving() : Container(),
            show ? screenMan2() : Container(),
            show ? menuButton() : Container(),
            // show ? backButton() : Container(),
            _motorVideoPlaying
                ? AspectRatio(
                    aspectRatio: _motorVideoController.value.aspectRatio,
                    child: VideoPlayer(_motorVideoController),
                  )
                : Container(),
            _energySavingVideoPlaying
                ? AspectRatio(
                    aspectRatio: _energySavingVideoController.value.aspectRatio,
                    child: VideoPlayer(_energySavingVideoController),
                  )
                : Container(),
            _insideVideoPlaying
                ? AspectRatio(
                    aspectRatio: _insideVideoController.value.aspectRatio,
                    child: VideoPlayer(_insideVideoController),
                  )
                : Container(),
            loading
                ? Container(
                    width: screenSize.width,
                    child: Image.asset(
                      schoolImage,
                      fit: BoxFit.fill,
                    ),
                  )
                : Container(),
            show
                ? Positioned(
                    top: screenSize.height * (0.1),
                    child: TextArea(
                        screenSize: screenSize,
                        texts: const [
                          "Smart Motor System",
                          "Smart HVAC",
                          "Smart Building Operations"
                        ],
                        topic: "Turntide for Schools",
                        description:
                            "Maximize energy efficiency and lower operating costs with smart equipment, controls, and insights"),
                  )
                : Container(),
            show
                ? Positioned(
                    left: screenSize.width * (0.495),
                    child: Container(
                      width: screenSize.width * 0.06,
                      height: screenSize.width * 0.17,
                      decoration: const BoxDecoration(
                        image: DecorationImage(
                          image: AssetImage(
                              'assets/animations/Data_animation_512.gif'),
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                  )
                : Container(),
            showTextAreaSmall
                ? Positioned(
                    bottom: screenSize.height * (0.2),
                    child: TextAreaSmall(
                        width: screenSize.width * 0.25,
                        screenSize: screenSize,
                        prefixText: "64%",
                        description:
                            "of energy in school is used by HVAC and lightning"),
                  )
                : Container(),
            showTextAreaSmall
                ? Positioned(
                    bottom: screenSize.height * (0.2),
                    right: 0,
                    child: GestureDetector(
                      onTap: () {
                        setShow();
                        setState(() {
                          showTextAreaSmall = false;
                        });
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
                  )
                : Container(),
            showEnergySaving
                ? Positioned(
                    top: screenSize.height * (0.1),
                    child: TextArea(
                        screenSize: screenSize,
                        texts: const [
                          "Improve energy efficiency",
                          "Maintain a comfortable environment",
                          "Automate lighting and HVAC",
                          "Extent equipment life",
                          "Prevent learning disruption"
                        ],
                        topic: "Stratergies for Sustainable Operations",
                        description: ""),
                  )
                : Container(),
            showEnergySaving
                ? Positioned(
                    bottom: screenSize.height * (0.2),
                    right: 0,
                    child: GestureDetector(
                      onTap: () {
                        setShow();
                        setState(() {
                          showEnergySaving = false;
                        });
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
                  )
                : Container(),
          ],
        ),
      ),
    );
  }

  Widget menuButton() {
    var screenSize = MediaQuery.of(context).size;
    return SizedBox(
      height: screenSize.height * 0.95,
      child: Align(
        alignment: Alignment.topRight,
        child: GestureDetector(
          onTap: () {
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

                  customPushReplacement(context, const HomeVideo());
                }
              }
            });
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

  // Widget backButton() {
  //   var screenSize = MediaQuery.of(context).size;
  //   return SizedBox(
  //     height: screenSize.height * 0.95,
  //     child: Align(
  //       alignment: Alignment.topLeft,
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

  //                 customPushReplacement(context, const HomeVideo());
  //               }
  //             }
  //           });
  //         },
  //         child: Container(
  //           width: screenSize.width * 0.050,
  //           height: screenSize.width * 0.050,
  //           decoration: const BoxDecoration(

  //             image:  DecorationImage(
  //               image: AssetImage('assets/graphics/HOME.png'),
  //               fit: BoxFit.cover,
  //             ),
  //           ),
  //         ),
  //       ),
  //     ),
  //   );
  // }

  Widget motor() {
    var screenSize = MediaQuery.of(context).size;
    return Positioned(
        left: screenSize.width * (0.5),
        top: screenSize.width * (0.18),
        child: Stack(
          children: [
            InkWell(
              onTap: () async {
                setShow();
                setState(() {
                  _motorVideoPlaying = true;
                });
                _motorVideoController.play();

                _motorVideoController.addListener(() {
                  final bool isPlaying = _motorVideoController.value.isPlaying;
                  print(isPlaying);
                  if (isPlaying != _isPlaying) {
                    setState(() {
                      _isPlaying = isPlaying;
                      setIndex(++index);
                    });
                    if (index > 1) {
                      _motorVideoController.removeListener(() {});

                      customPushReplacement(context, const Motor());
                    }
                  }
                });
              },
              child: CustomButtonLabel(
                screenSize: screenSize,
                text: "Smart HVAC",
                type: 2,
              ),
            ),
          ],
        ));
  }

  Widget energySaving() {
    var screenSize = MediaQuery.of(context).size;
    return Positioned(
        left: screenSize.width * (0.362),
        top: screenSize.width * (0.428),
        child: Stack(
          children: [
            InkWell(
              onTap: () async {
                setShow();
                setState(() {
                  showEnergySaving = true;
                });
                // setState(() {
                //   _energySavingVideoPlaying = true;
                // });
                // _energySavingVideoController.play();

                // _energySavingVideoController.addListener(() {
                //   final bool isPlaying =
                //       _energySavingVideoController.value.isPlaying;
                //   print(isPlaying);
                //   if (isPlaying != _isPlaying) {
                //     setState(() {
                //       _isPlaying = isPlaying;
                //       setIndex(++index);
                //     });
                //     if (index > 1) {
                //       _energySavingVideoController.removeListener(() {});

                //       customPushReplacement(context, const EnergySaving());
                //     }
                //   }
                // });
              },
              child: CustomButtonLabel(
                screenSize: screenSize,
                text: "Energy-Saving Stratergies",
                type: 1,
              ),
            ),
          ],
        ));
  }

  Widget screenMan2() {
    var screenSize = MediaQuery.of(context).size;
    return Positioned(
        left: screenSize.width * (0.55),
        top: screenSize.width * (0.12),
        child: Stack(
          children: [
            InkWell(
              onTap: () async {
                setShow();
                setState(() {
                  _insideVideoPlaying = true;
                });
                _insideVideoController.play();

                _insideVideoController.addListener(() {
                  final bool isPlaying = _insideVideoController.value.isPlaying;
                  print(isPlaying);
                  if (isPlaying != _isPlaying) {
                    setState(() {
                      _isPlaying = isPlaying;
                      setIndex(++index);
                    });
                    if (index > 1) {
                      //_insideVideoController.removeListener(() {});

                      customPushReplacement(context, const SchoolMainScreens());
                    }
                  }
                });
              },
              child: CustomButtonLabel(
                screenSize: screenSize,
                text: "TurntideApp",
                type: 3,
              ),
            ),
          ],
        ));
  }
}
