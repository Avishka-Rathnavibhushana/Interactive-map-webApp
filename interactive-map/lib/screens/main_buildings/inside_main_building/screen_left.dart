import 'package:flutter/material.dart';
import 'package:interactive_map/constants/constants.dart';
import 'package:interactive_map/screens/main_buildings/buildings_home.dart';
import 'package:interactive_map/screens/main_buildings/inside_main_building/map_main_screen.dart';
import 'package:interactive_map/widgets/text_area_with_clip.dart';
import 'package:video_player/video_player.dart';
import 'package:interactive_map/utills/utils.dart';
import 'package:get/get.dart';
import 'package:interactive_map/controller/controller.dart';
import 'package:interactive_map/widgets/full_screen_button.dart';

class ScreenLeft extends StatefulWidget {
  const ScreenLeft({Key? key, this.to, this.offsetHor, this.offsetVer})
      : super(key: key);
  final to;
  final offsetHor;
  final offsetVer;
  @override
  _ScreenLeftState createState() => _ScreenLeftState();
}

class _ScreenLeftState extends State<ScreenLeft> {
  late VideoPlayerController _controller;
  int index = 0;
  bool show = false;
  bool _isPlaying = false;
  int nextIndex = 0;
  String url = 'assets/videos/buildings/screen_LEFT_REV.mp4';

  String screenLeftImage_1 = 'assets/tempory images/screen_LEFT.png';
  String screenLeftImage_2 = 'assets/tempory images/screen_LEFT_2.png';
  String screenLeftImage_3 = 'assets/tempory images/screen_LEFT_3.png';

  setIndex(value) {
    index = value;
    setState(() {});
  }

  setShow() {
    setState(() {
      show = !show;
    });
  }

  static double offsetHor = 0;
  static double offsetVer = 0;

  @override
  void initState() {
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

    offsetHor = widget.offsetHor;
    offsetVer = widget.offsetVer;
    super.initState();
  }

  @override
  void dispose() {
    _controller.dispose();

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

    if (screenSize.height < ScreenSizes.Mobile.height &&
        screenSize.width > ScreenSizes.Mobile.width) {
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
        backgroundColor: Colors.black.withOpacity(0.5),
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
                              show
                                  ? nextIndex == 0
                                      ? SizedBox(
                                          width: Utils.getVideoScreenWidth(
                                              screenSizeMobile1),
                                          height: Utils.getVideoScreenHeight(
                                              screenSizeMobile1),
                                          child: Image.asset(
                                            screenLeftImage_1,
                                            fit: BoxFit.fill,
                                          ),
                                        )
                                      : nextIndex == 1
                                          ? SizedBox(
                                              width: Utils.getVideoScreenWidth(
                                                  screenSizeMobile1),
                                              height:
                                                  Utils.getVideoScreenHeight(
                                                      screenSizeMobile1),
                                              child: Image.asset(
                                                screenLeftImage_2,
                                                fit: BoxFit.fill,
                                              ),
                                            )
                                          : SizedBox(
                                              width: Utils.getVideoScreenWidth(
                                                  screenSizeMobile1),
                                              height:
                                                  Utils.getVideoScreenHeight(
                                                      screenSizeMobile1),
                                              child: Image.asset(
                                                screenLeftImage_3,
                                                fit: BoxFit.fill,
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
                    padding: const EdgeInsets.symmetric(horizontal: 0),
                    child: Container(
                      width: screenSize.width - screenSize.width * 0.3,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          show ? nextButtonMobile() : Container(),
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
    } else if (screenSize.width < ScreenSizes.Mobile.width) {
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
        backgroundColor: Colors.black.withOpacity(0.5),
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
                              show
                                  ? nextIndex == 0
                                      ? SizedBox(
                                          width: Utils.getVideoScreenWidth(
                                              screenSizeMobile2),
                                          height: Utils.getVideoScreenHeight(
                                              screenSizeMobile2),
                                          child: Image.asset(
                                            screenLeftImage_1,
                                            fit: BoxFit.fill,
                                          ),
                                        )
                                      : nextIndex == 1
                                          ? SizedBox(
                                              width: Utils.getVideoScreenWidth(
                                                  screenSizeMobile2),
                                              height:
                                                  Utils.getVideoScreenHeight(
                                                      screenSizeMobile2),
                                              child: Image.asset(
                                                screenLeftImage_2,
                                                fit: BoxFit.fill,
                                              ),
                                            )
                                          : SizedBox(
                                              width: Utils.getVideoScreenWidth(
                                                  screenSizeMobile2),
                                              height:
                                                  Utils.getVideoScreenHeight(
                                                      screenSizeMobile2),
                                              child: Image.asset(
                                                screenLeftImage_3,
                                                fit: BoxFit.fill,
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
                    padding: const EdgeInsets.symmetric(horizontal: 0),
                    child: Container(
                      width: screenSize.width,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          show ? nextButtonMobile() : Container(),
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
                        show
                            ? nextIndex == 0
                                ? SizedBox(
                                    width:
                                        Utils.getVideoScreenWidth(screenSize),
                                    height:
                                        Utils.getVideoScreenHeight(screenSize),
                                    child: Image.asset(
                                      screenLeftImage_1,
                                      fit: BoxFit.fill,
                                    ),
                                  )
                                : nextIndex == 1
                                    ? SizedBox(
                                        width: Utils.getVideoScreenWidth(
                                            screenSize),
                                        height: Utils.getVideoScreenHeight(
                                            screenSize),
                                        child: Image.asset(
                                          screenLeftImage_2,
                                          fit: BoxFit.fill,
                                        ),
                                      )
                                    : SizedBox(
                                        width: Utils.getVideoScreenWidth(
                                            screenSize),
                                        height: Utils.getVideoScreenHeight(
                                            screenSize),
                                        child: Image.asset(
                                          screenLeftImage_3,
                                          fit: BoxFit.fill,
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
          FullScreenButton(),
          show &&
                  screenSize.width > ScreenSizes.Mobile.width &&
                  screenSize.height > ScreenSizes.Mobile.height
              ? nextButton()
              : Container(),
          show ? menuButton() : Container(),
          show
              ? nextIndex == 0
                  ? Padding(
                      padding: EdgeInsets.only(
                          top: Utils.getTopPadding(screenSize, 100)),
                      child: Container(
                        alignment: Alignment.topLeft,
                        child: TextAreaWithClip(
                            screenSize: screenSize,
                            texts: const [
                              [
                                "TEXT",
                                "Multi-site management and global controls allow you to react quickly"
                              ],
                              [
                                "TEXT",
                                "Scale efficiency measures across your entire portfolio"
                              ],
                            ],
                            topic: "Smart Building Operations",
                            description: ""),
                      ),
                    )
                  : nextIndex == 1
                      ? Padding(
                          padding: EdgeInsets.only(
                              top: Utils.getTopPadding(screenSize, 100)),
                          child: Container(
                            alignment: Alignment.topLeft,
                            child: TextAreaWithClip(
                                screenSize: screenSize,
                                texts: const [
                                  [
                                    "TEXT",
                                    "Open-platform works with existing building systems regardless of vendor"
                                  ],
                                  [
                                    "TEXT",
                                    "Complete visibility in a single pane of glass"
                                  ],
                                ],
                                topic: "Smart Building Operations",
                                description: ""),
                          ),
                        )
                      : Padding(
                          padding: EdgeInsets.only(
                              top: Utils.getTopPadding(screenSize, 100)),
                          child: Container(
                            alignment: Alignment.topLeft,
                            child: TextAreaWithClip(
                                screenSize: screenSize,
                                texts: const [
                                  [
                                    "TEXT",
                                    "Monitor Indoor Air Quality (IAQ) standerds"
                                  ],
                                  [
                                    "TEXT",
                                    "Help keep your employees and customers safe"
                                  ],
                                ],
                                topic: "Smart Building Operations",
                                description: ""),
                          ),
                        )
              : Container(),
        ],
      ),
    );
  }

  Widget nextButton() {
    var screenSize = MediaQuery.of(context).size;
    return Padding(
      padding: EdgeInsets.only(bottom: Utils.getBottomPadding(screenSize, 200)),
      child: Container(
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
                            MapMainScreens(
                          from: widget.to,
                          offsetHor: offsetHor,
                          offsetVer: offsetVer,
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
            width: screenSize.width *
                0.091 *
                Utils.getMultiplier(screenSize.width),
            height: screenSize.width *
                0.040 *
                Utils.getMultiplier(screenSize.width),
            decoration: const BoxDecoration(
              image: DecorationImage(
                image: AssetImage(nextImage),
                fit: BoxFit.cover,
              ),
            ),
          ),
        ),
      ),
    );
  }

  Widget nextButtonMobile() {
    var screenSize = MediaQuery.of(context).size;
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 10),
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
                          MapMainScreens(
                        from: widget.to,
                        offsetHor: offsetHor,
                        offsetVer: offsetVer,
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
          width:
              screenSize.width * 0.091 * Utils.getMultiplier(screenSize.width),
          height:
              screenSize.width * 0.040 * Utils.getMultiplier(screenSize.width),
          decoration: const BoxDecoration(
            image: DecorationImage(
              image: AssetImage(nextImage),
              fit: BoxFit.cover,
            ),
          ),
        ),
      ),
    );
  }

  Widget menuButton() {
    var screenSize = MediaQuery.of(context).size;
    return Positioned(
      right: Utils.getRightPadding(screenSize, 0),
      child: Container(
        alignment: Alignment.topRight,
        height:
            screenSize.width *
            0.050 *
            Utils.getTopRightButtonMultiplier(screenSize.width),
        width: screenSize.width *
            0.050 *
            Utils.getTopRightButtonMultiplier(screenSize.width),
        child: GestureDetector(
          onTap: () {
            _controller.pause();
            _controller.removeListener(() {});
            Navigator.pushReplacement(
              context,
              PageRouteBuilder(
                pageBuilder: (context, animation1, animation2) =>
                    BuildingsHomeVideo(
                  offsetHor: offsetHor,
                  offsetVer: offsetVer,
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
            width: screenSize.width *
                0.050 *
                Utils.getTopRightButtonMultiplier(screenSize.width),
            height: screenSize.width *
                0.050 *
                Utils.getTopRightButtonMultiplier(screenSize.width),
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
}
