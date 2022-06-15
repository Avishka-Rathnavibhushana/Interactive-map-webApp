import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:interactive_map/constants/constants.dart';
import 'package:interactive_map/controller/controller.dart';
import 'package:interactive_map/screens/vechicles/inside_vehicle/transition.dart';
import 'package:interactive_map/screens/vechicles/vechicles_home.dart';
import 'package:interactive_map/widgets/custom_button_label_mobile.dart';
import 'package:interactive_map/widgets/custom_button_label_with_clip.dart';
import 'package:interactive_map/widgets/shared_widgets.dart';
import 'package:interactive_map/widgets/text_area_with_clip.dart';
import 'package:video_player/video_player.dart';
import 'package:interactive_map/utills/utils.dart';

class AvgNArmVideo extends StatefulWidget {
  const AvgNArmVideo({Key? key, this.from, this.offsetHor, this.offsetVer})
      : super(key: key);
  final offsetHor;
  final offsetVer;
  final from;
  @override
  _AvgNArmVideoState createState() => _AvgNArmVideoState();
}

class _AvgNArmVideoState extends State<AvgNArmVideo> {
  late VideoPlayerController _controller;

  late VideoPlayerController _transition1VideoController;
  bool _transition1VideoPlaying = false;

  int index = 0;
  bool show = false;
  bool _isPlaying = false;

  final String url = 'assets/videos/vehicles/Veh_To_AGV_REV.m4v';

  final String transition1Video =
      'assets/videos/vehicles/Product_transition/AGV_To_Battery.m4v';

  // final String schoolImage = 'assets/tempory images/School_Plain.png';

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
    setState(() {
      offsetHor = widget.offsetHor;
      offsetVer = widget.offsetVer;
    });
  }

  videoHandler() async {
    _controller = VideoPlayerController.asset(url);
    await _controller.initialize();
    setState(() {
      _controller.setVolume(0);
      _controller.setLooping(false);
    });
    if (widget.from == Pages.transitionPageToHome) {
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
                VechiclesHomeVideo(
                  offsetHor: offsetHor,
                  offsetVer: offsetVer,
                ));
          }
        }
      });
    } else {
      setShow();
    }

    _transition1VideoController = VideoPlayerController.asset(transition1Video)
      ..initialize().then((_) => {
            setState(() {
              _transition1VideoController.setVolume(0);
              _transition1VideoController.setLooping(false);
            })
          });
    setState(() {
      loading = false;
    });
  }

  @override
  void dispose() {
    _controller.dispose();
    _transition1VideoController.dispose();

    super.dispose();
  }

  bool h = false;
  bool v = false;

  final ScrollController _scrollControllerHrizontal = ScrollController(
    initialScrollOffset: Get.find<Controller>().horizontalOffset.value,
  );

  final ScrollController _scrollControllerVertical = ScrollController(
    initialScrollOffset: Get.find<Controller>().verticalOffset.value,
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
      Get.find<Controller>().horizontalOffset.value = offsetHor;
    }

    if (_scrollControllerVertical.hasClients) {
      _scrollControllerVertical.animateTo(
          _scrollControllerVertical.position.maxScrollExtent / 2,
          duration: const Duration(milliseconds: 1000),
          curve: Curves.easeInOut);
      offsetVer = _scrollControllerVertical.position.maxScrollExtent / 2;
      Get.find<Controller>().verticalOffset.value = offsetVer;
    }

    if (screenSize.height < 500 && screenSize.width > 500) {
      if (screenSize.width - screenSize.width * 0.3 / screenSize.height ==
          VideoAspectRatio.width / VideoAspectRatio.height) {
        v = false;
        h = false;
      } else if (screenSize.width - screenSize.width * 0.3 / screenSize.height <
          VideoAspectRatio.width / VideoAspectRatio.height) {
        v = false;
        h = true;
      } else {
        v = true;
        h = false;
      }
      var screenSizeMobile1 =
          Size(screenSize.width - screenSize.width * 0.3, screenSize.height);
      return Scaffold(
        backgroundColor: Colors.transparent,
        floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
        floatingActionButton: floatingButtonPanel(),
        body: Row(
          children: [
            Container(
              width: screenSize.width - screenSize.width * 0.3,
              height: screenSize.height,
              child: SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                controller: _scrollControllerHrizontal,
                child: SingleChildScrollView(
                  scrollDirection: Axis.vertical,
                  controller: _scrollControllerVertical,
                  child: SizedBox(
                    width: Utils.getVideoScreenWidth(screenSizeMobile1),
                    height: Utils.getVideoScreenHeight(screenSizeMobile1),
                    child: Stack(
                      children: [
                        SizedBox(
                          width: Utils.getVideoScreenWidth(screenSizeMobile1),
                          height: Utils.getVideoScreenHeight(screenSizeMobile1),
                          child: Stack(
                            children: [
                              SizedBox(
                                width: Utils.getVideoScreenWidth(
                                    screenSizeMobile1),
                                height: Utils.getVideoScreenHeight(
                                    screenSizeMobile1),
                                child: VideoPlayer(_controller),
                              ),
                              _transition1VideoPlaying
                                  ? SizedBox(
                                      width: Utils.getVideoScreenWidth(
                                          screenSizeMobile1),
                                      height: Utils.getVideoScreenHeight(
                                          screenSizeMobile1),
                                      child: VideoPlayer(
                                          _transition1VideoController),
                                    )
                                  : Container(),

                              // loading
                              //     ? SizedBox(
                              //         width: Utils.getVideoScreenWidth(
                              //             screenSizeMobile1),
                              //         height: Utils.getVideoScreenHeight(
                              //             screenSizeMobile1),
                              //         child: Image.asset(
                              //           schoolImage,
                              //           fit: BoxFit.fill,
                              //         ),
                              //       )
                              //     : Container(),
                              show
                                  ? Positioned(
                                      left: Utils.getVideoScreenWidth(
                                              screenSizeMobile1) *
                                          0.5,
                                      child: Container(
                                        width: Utils.getVideoScreenWidth(
                                                screenSizeMobile1) *
                                            0.075,
                                        height: Utils.getVideoScreenHeight(
                                                screenSizeMobile1) *
                                            0.3,
                                        decoration: const BoxDecoration(
                                          image: DecorationImage(
                                            image: AssetImage(dataAnimationGif),
                                            fit: BoxFit.cover,
                                          ),
                                        ),
                                      ),
                                    )
                                  : Container(),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
            Expanded(
              child: Container(
                height: screenSize.height,
                width: screenSize.width - screenSize.width * 0.3,
                alignment: Alignment.topRight,
                child: SingleChildScrollView(
                  scrollDirection: Axis.vertical,
                  physics: const BouncingScrollPhysics(),
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 30),
                    child: Container(
                      width: screenSize.width - screenSize.width * 0.3,
                      child: Column(
                        children: [
                          !show
                              ? Container()
                              : transition1Mobile(
                                  screenSize.width - screenSize.width * 0.3),
                        ],
                      ),
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      );
    } else if (screenSize.width < 500) {
      if (screenSize.width / screenSize.height - screenSize.height * 0.3 ==
          VideoAspectRatio.width / VideoAspectRatio.height) {
        v = false;
        h = false;
      } else if (screenSize.width / screenSize.height -
              screenSize.height * 0.3 <
          VideoAspectRatio.width / VideoAspectRatio.height) {
        v = false;
        h = true;
      } else {
        v = true;
        h = false;
      }
      var screenSizeMobile2 =
          Size(screenSize.width, screenSize.height - screenSize.height * 0.3);
      return Scaffold(
        backgroundColor: Colors.transparent,
        floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
        floatingActionButton: floatingButtonPanel(),
        body: Column(
          children: [
            Container(
              width: screenSize.width,
              height: screenSize.height - screenSize.height * 0.3,
              child: SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                controller: _scrollControllerHrizontal,
                child: SingleChildScrollView(
                  scrollDirection: Axis.vertical,
                  controller: _scrollControllerVertical,
                  child: SizedBox(
                    width: Utils.getVideoScreenWidth(screenSizeMobile2),
                    height: Utils.getVideoScreenHeight(screenSizeMobile2),
                    child: Stack(
                      children: [
                        SizedBox(
                          width: Utils.getVideoScreenWidth(screenSizeMobile2),
                          height: Utils.getVideoScreenHeight(screenSizeMobile2),
                          child: Stack(
                            children: [
                              SizedBox(
                                width: Utils.getVideoScreenWidth(
                                    screenSizeMobile2),
                                height: Utils.getVideoScreenHeight(
                                    screenSizeMobile2),
                                child: VideoPlayer(_controller),
                              ),
                              _transition1VideoPlaying
                                  ? SizedBox(
                                      width: Utils.getVideoScreenWidth(
                                          screenSizeMobile2),
                                      height: Utils.getVideoScreenHeight(
                                          screenSizeMobile2),
                                      child: VideoPlayer(
                                          _transition1VideoController),
                                    )
                                  : Container(),

                              // loading
                              //     ? SizedBox(
                              //         width: Utils.getVideoScreenWidth(
                              //             screenSizeMobile2),
                              //         height: Utils.getVideoScreenHeight(
                              //             screenSizeMobile2),
                              //         child: Image.asset(
                              //           schoolImage,
                              //           fit: BoxFit.fill,
                              //         ),
                              //       )
                              //     : Container(),
                              show
                                  ? Positioned(
                                      left: Utils.getVideoScreenWidth(
                                              screenSizeMobile2) *
                                          0.5,
                                      child: Container(
                                        width: Utils.getVideoScreenWidth(
                                                screenSizeMobile2) *
                                            0.075,
                                        height: Utils.getVideoScreenHeight(
                                                screenSizeMobile2) *
                                            0.3,
                                        decoration: const BoxDecoration(
                                          image: DecorationImage(
                                            image: AssetImage(dataAnimationGif),
                                            fit: BoxFit.cover,
                                          ),
                                        ),
                                      ),
                                    )
                                  : Container(),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
            Expanded(
              child: Container(
                height: screenSize.height * 0.3,
                width: screenSize.width,
                alignment: Alignment.topCenter,
                child: SingleChildScrollView(
                  physics: const BouncingScrollPhysics(),
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 30),
                    child: Container(
                      width: screenSize.width,
                      child: Column(
                        children: [
                          !show
                              ? Container()
                              : transition1Mobile(screenSize.width),
                        ],
                      ),
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      );
    } else {
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
        floatingActionButton: floatingButtonPanel(),
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
                    child: Stack(
                      children: [
                        SizedBox(
                          width: Utils.getVideoScreenWidth(screenSize),
                          height: Utils.getVideoScreenHeight(screenSize),
                          child: VideoPlayer(_controller),
                        ),
                        show ? transition1() : Container(),
                        _transition1VideoPlaying
                            ? SizedBox(
                                width: Utils.getVideoScreenWidth(screenSize),
                                height: Utils.getVideoScreenHeight(screenSize),
                                child: VideoPlayer(_transition1VideoController),
                              )
                            : Container(),

                        // loading
                        //     ? SizedBox(
                        //         width: Utils.getVideoScreenWidth(screenSize),
                        //         height: Utils.getVideoScreenHeight(screenSize),
                        //         child: Image.asset(
                        //           schoolImage,
                        //           fit: BoxFit.fill,
                        //         ),
                        //       )
                        //     : Container(),
                        show
                            ? Positioned(
                                left:
                                    Utils.getVideoScreenWidth(screenSize) * 0.5,
                                child: Container(
                                  width: Utils.getVideoScreenWidth(screenSize) *
                                      0.075,
                                  height:
                                      Utils.getVideoScreenHeight(screenSize) *
                                          0.3,
                                  decoration: const BoxDecoration(
                                    image: DecorationImage(
                                      image: AssetImage(dataAnimationGif),
                                      fit: BoxFit.cover,
                                    ),
                                  ),
                                ),
                              )
                            : Container(),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      );
    }
  }

  Widget floatingButtonPanel() {
    var screenSize = MediaQuery.of(context).size;
    return Container(
      child: Stack(
        alignment: Alignment.topCenter,
        fit: StackFit.expand,
        children: [
          show
              ? Padding(
                  padding: EdgeInsets.only(
                      top: Utils.getTopPadding(screenSize, 100)),
                  child: Container(
                    alignment: Alignment.topLeft,
                    child: TextAreaWithClip(
                      screenSize: screenSize,
                      texts: TextsConstants.avgNarmTexts["TextAreaWithClipMain"]
                          ["texts"],
                      topic: TextsConstants.avgNarmTexts["TextAreaWithClipMain"]
                          ["topic"],
                      description: TextsConstants
                          .avgNarmTexts["TextAreaWithClipMain"]["description"],
                    ),
                  ),
                )
              : Container(),
          show ? menuButton() : Container(),
        ],
      ),
    );
  }

  Widget transition1Mobile(width) {
    var screenSize = MediaQuery.of(context).size;
    return CustomButtonLabelMobile(
      width: width,
      title: TextsConstants.avgNarmTexts["subTopics"][0],
      onPressed: () async {
        setShow();
        setState(() {
          _transition1VideoPlaying = true;
        });
        _transition1VideoController.play();

        _transition1VideoController.addListener(() {
          final bool isPlaying = _transition1VideoController.value.isPlaying;
          print(isPlaying);
          if (isPlaying != _isPlaying) {
            setState(() {
              _isPlaying = isPlaying;
              setIndex(++index);
            });
            if (index > 1) {
              _transition1VideoController.removeListener(() {});
              customPushReplacement(
                  context,
                  TransitionPage(
                    from: Pages.avgNarm,
                    offsetHor: offsetHor,
                    offsetVer: offsetVer,
                    url:
                        "assets/videos/vehicles/Product_loops/Battery_Loop.m4v",
                    back:
                        "assets/videos/vehicles/Product_transition/AGV_To_Battery.m4v",
                  ));
            }
          }
        });
      },
    );
  }

  Widget menuButton() {
    var screenSize = MediaQuery.of(context).size;
    return Positioned(
      right: Utils.getRightPadding(screenSize, 0),
      child: Container(
        alignment: Alignment.topRight,
        height:
            screenSize.width * 0.070 * Utils.getMultiplier(screenSize.width),
        width: screenSize.width * 0.070 * Utils.getMultiplier(screenSize.width),
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
                      VechiclesHomeVideo(
                        offsetHor: offsetHor,
                        offsetVer: offsetVer,
                      ));
                }
              }
            });
          },
          child: Container(
            height: screenSize.width *
                0.070 *
                Utils.getMultiplier(screenSize.width),
            width: screenSize.width *
                0.070 *
                Utils.getMultiplier(screenSize.width),
            decoration: const BoxDecoration(
              image: DecorationImage(
                image: AssetImage(homeImage),
                fit: BoxFit.cover,
              ),
            ),
          ),
        ),
      ),
    );
  }

  Widget transition1() {
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
                  _transition1VideoPlaying = true;
                });
                _transition1VideoController.play();

                _transition1VideoController.addListener(() {
                  final bool isPlaying =
                      _transition1VideoController.value.isPlaying;
                  print(isPlaying);
                  if (isPlaying != _isPlaying) {
                    setState(() {
                      _isPlaying = isPlaying;
                      setIndex(++index);
                    });
                    if (index > 1) {
                      _transition1VideoController.removeListener(() {});
                      customPushReplacement(
                          context,
                          TransitionPage(
                            from: Pages.avgNarm,
                            offsetHor: offsetHor,
                            offsetVer: offsetVer,
                            url:
                                "assets/videos/vehicles/Product_loops/Battery_Loop.m4v",
                            back:
                                "assets/videos/vehicles/Product_transition/AGV_To_Battery.m4v",
                          ));
                    }
                  }
                });
              },
              child: CustomButtonLabelWithClip(
                screenSize: screenSize,
                text: TextsConstants.avgNarmTexts["subTopics"][0],
                type: 1,
              ),
            ),
          ],
        ));
  }
}
