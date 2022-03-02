import 'package:flutter/material.dart';
import 'package:interactive_map/constants/constants.dart';
import 'package:interactive_map/main_buildings/home.dart';
import 'package:interactive_map/main_buildings/inside_main_building/motor.dart';
import 'package:interactive_map/main_buildings/inside_main_building/map_main_screen.dart';
import 'package:interactive_map/widgets/custom_button_label_with_clip.dart';
import 'package:interactive_map/widgets/shared_widgets.dart';
import 'package:interactive_map/widgets/text_area_small_with_clip.dart';
import 'package:interactive_map/widgets/text_area_with_clip.dart';
import 'package:video_player/video_player.dart';
import 'package:interactive_map/utills/utils.dart';

class SchoolVideo extends StatefulWidget {
  const SchoolVideo({Key? key, this.from, this.offsetHor, this.offsetVer})
      : super(key: key);
  final offsetHor;
  final offsetVer;
  final from;
  @override
  _SchoolVideoState createState() => _SchoolVideoState();
}

class _SchoolVideoState extends State<SchoolVideo> {
  late VideoPlayerController _controller;

  late VideoPlayerController _motorVideoController;
  bool _motorVideoPlaying = false;
  late VideoPlayerController _energySavingVideoController;
  bool _energySavingVideoPlaying = false;
  late VideoPlayerController _mapVideoController;
  bool _mapVideoPlaying = false;

  int index = 0;
  bool show = false;
  bool _isPlaying = false;

  final String url = 'assets/videos/school_REV.mp4';

  final String motorVideo = 'assets/videos/school_MOTOR.mp4';
  final String energySavingVideo = 'assets/videos/school_MOTOR.mp4';
  final String mapVideo = 'assets/videos/school_MAP.mp4';

  final String schoolImage = 'assets/tempory images/School_Plain.png';
  final String mapScreenImage = 'assets/tempory images/screen_MAIN.png';

  bool showTextAreaSmall = false;
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
    if (widget.from == Pages.map || widget.from == Pages.motorToHome) {
      await Future.delayed(Duration(milliseconds: 1000));
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

            customPushReplacement(
                context,
                HomeVideo(
                  offsetHor: offsetHor,
                  offsetVer: offsetVer,
                ));
          }
        }
      });
    } else if (widget.from == Pages.home) {
      setState(() {
        showTextAreaSmall = true;
      });
    } else {
      setShow();
    }

    _motorVideoController = VideoPlayerController.asset(motorVideo)
      ..initialize().then((_) => {
            setState(() {
              _motorVideoController.setVolume(0);
              _motorVideoController.setLooping(false);
            })
          });
    _energySavingVideoController =
        VideoPlayerController.asset(energySavingVideo)
          ..initialize().then((_) => {
                setState(() {
                  _energySavingVideoController.setVolume(0);
                  _energySavingVideoController.setLooping(false);
                })
              });
    _mapVideoController = VideoPlayerController.asset(mapVideo)
      ..initialize().then((_) => {
            setState(() {
              _mapVideoController.setVolume(0);
              _mapVideoController.setLooping(false);
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
    _mapVideoController.dispose();

    super.dispose();
  }

  bool h = false;
  bool v = false;

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

    if (screenSize.width / screenSize.height ==
        VideoAspectRatio.width / VideoAspectRatio.height) {
      v = false;
      h = false;
    } else if (screenSize.width / screenSize.height <
        VideoAspectRatio.width / VideoAspectRatio.height) {
      v = false;
      h = true;
    } else {
      v = true;
      h = false;
    }

    return Scaffold(
      backgroundColor: Colors.transparent,
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      floatingActionButton: Container(
        child: Stack(
          alignment: Alignment.topCenter,
          fit: StackFit.expand,
          children: [
            show
                ? Padding(
                    padding: const EdgeInsets.only(top: 100),
                    child: Container(
                      alignment: Alignment.topLeft,
                      child: TextAreaWithClip(
                          screenSize: screenSize,
                          texts: const [
                            "Smart Motor System",
                            "Smart HVAC",
                            "Smart Building Operations"
                          ],
                          topic: "Turntide for Schools",
                          description:
                              "Maximize energy efficiency and lower operating costs with smart equipment, controls, and insights"),
                    ),
                  )
                : Container(),
            showTextAreaSmall
                ? Padding(
                    padding: const EdgeInsets.only(bottom: 100),
                    child: Container(
                      alignment: Alignment.bottomLeft,
                      child: TextAreaSmallWithClip(
                          width: screenSize.width * 0.25,
                          screenSize: screenSize,
                          prefixText: "64%",
                          description:
                              "of energy in school is used by HVAC and lightning"),
                    ),
                  )
                : Container(),
            showTextAreaSmall
                ? Padding(
                    padding: const EdgeInsets.only(bottom: 100),
                    child: Container(
                      alignment: Alignment.bottomRight,
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
                              image: AssetImage(nextImage),
                              fit: BoxFit.cover,
                            ),
                          ),
                        ),
                      ),
                    ),
                  )
                : Container(),
            showEnergySaving
                ? Padding(
                    padding: const EdgeInsets.only(top: 100),
                    child: Container(
                      alignment: Alignment.topLeft,
                      child: TextAreaWithClip(
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
                    ),
                  )
                : Container(),
            showEnergySaving
                ? Padding(
                    padding: const EdgeInsets.only(bottom: 100),
                    child: Container(
                      alignment: Alignment.bottomRight,
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
                              image: AssetImage(nextImage),
                              fit: BoxFit.cover,
                            ),
                          ),
                        ),
                      ),
                    ),
                  )
                : Container(),
            show ? menuButton() : Container(),
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
            width: Utils.getVideoScreenWidth(screenSize),
            height: Utils.getVideoScreenHeight(screenSize),
            child: Stack(
              children: [
                SizedBox(
                  width: Utils.getVideoScreenWidth(screenSize),
                  height: Utils.getVideoScreenHeight(screenSize),
                  child: VideoPlayer(_controller),
                ),
                show ? motor() : Container(),
                show ? energySaving() : Container(),
                show ? mapScreen() : Container(),
                _motorVideoPlaying
                    ? SizedBox(
                        width: Utils.getVideoScreenWidth(screenSize),
                        height: Utils.getVideoScreenHeight(screenSize),
                        child: VideoPlayer(_motorVideoController),
                      )
                    : Container(),
                _energySavingVideoPlaying
                    ? SizedBox(
                        width: Utils.getVideoScreenWidth(screenSize),
                        height: Utils.getVideoScreenHeight(screenSize),
                        child: VideoPlayer(_energySavingVideoController),
                      )
                    : Container(),
                _mapVideoPlaying
                    ? SizedBox(
                        width: Utils.getVideoScreenWidth(screenSize),
                        height: Utils.getVideoScreenHeight(screenSize),
                        child: VideoPlayer(_mapVideoController),
                      )
                    : Container(),
                loading
                    ? SizedBox(
                        width: Utils.getVideoScreenWidth(screenSize),
                        height: Utils.getVideoScreenHeight(screenSize),
                        child: Image.asset(
                          schoolImage,
                          fit: BoxFit.fill,
                        ),
                      )
                    : Container(),
                show
                    ? Positioned(
                        left: Utils.getVideoScreenWidth(screenSize) * 0.5,
                        child: Container(
                          width: Utils.getVideoScreenWidth(screenSize) * 0.075,
                          height: Utils.getVideoScreenHeight(screenSize) * 0.3,
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
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget menuButton() {
    var screenSize = MediaQuery.of(context).size;
    return Container(
      alignment: Alignment.topRight,
      height: screenSize.width * 0.050,
      width: screenSize.width * 0.050,
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
                customPushReplacement(
                    context,
                    HomeVideo(
                      offsetHor: offsetHor,
                      offsetVer: offsetVer,
                    ));
              }
            }
          });
        },
        child: Container(
          width: screenSize.width * 0.050,
          height: screenSize.width * 0.050,
          decoration: const BoxDecoration(
            image: DecorationImage(
              image: AssetImage(homeImage),
              fit: BoxFit.cover,
            ),
          ),
        ),
      ),
    );
  }

  Widget motor() {
    var screenSize = MediaQuery.of(context).size;
    return Positioned(
        left: Utils.getVideoScreenWidth(screenSize) * 0.536,
        top: Utils.getVideoScreenHeight(screenSize) * 0.325,
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
                      customPushReplacement(
                          context,
                          Motor(
                            from: Pages.school,
                            offsetHor: offsetHor,
                            offsetVer: offsetVer,
                          ));
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

  Widget energySaving() {
    var screenSize = MediaQuery.of(context).size;
    return Positioned(
        left: Utils.getVideoScreenWidth(screenSize) * 0.439,
        top: Utils.getVideoScreenHeight(screenSize) * 0.647,
        child: Stack(
          children: [
            InkWell(
              onTap: () async {
                setShow();
                setState(() {
                  showEnergySaving = true;
                });
              },
              child: CustomButtonLabelWithClip(
                screenSize: screenSize,
                text: "Energy-Saving Stratergies",
                type: 1,
              ),
            ),
          ],
        ));
  }

  Widget mapScreen() {
    var screenSize = MediaQuery.of(context).size;
    return Positioned(
        left: Utils.getVideoScreenWidth(screenSize) * 0.57,
        top: Utils.getVideoScreenHeight(screenSize) * 0.15,
        child: Stack(
          children: [
            InkWell(
              onTap: () async {
                setShow();
                setState(() {
                  _mapVideoPlaying = true;
                });
                _mapVideoController.play();

                _mapVideoController.addListener(() {
                  final bool isPlaying = _mapVideoController.value.isPlaying;
                  print(isPlaying);
                  if (isPlaying != _isPlaying) {
                    setState(() {
                      _isPlaying = isPlaying;
                      setIndex(++index);
                    });
                    if (index > 1) {
                      customPushReplacement(
                          context,
                          MapMainScreens(
                            from: Pages.school,
                            offsetHor: offsetHor,
                            offsetVer: offsetVer,
                          ));
                    }
                  }
                });
              },
              child: CustomButtonLabelWithClip(
                screenSize: screenSize,
                text: "TurntideApp",
                type: 3,
              ),
            ),
          ],
        ));
  }
}
