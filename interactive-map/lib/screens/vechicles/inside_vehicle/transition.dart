import 'package:flutter/material.dart';
import 'package:interactive_map/constants/constants.dart';
import 'package:interactive_map/screens/vechicles/avgNarm.dart';
import 'package:interactive_map/screens/vechicles/bus.dart';
import 'package:interactive_map/screens/vechicles/excavator.dart';
import 'package:interactive_map/screens/vechicles/sportsCar.dart';
import 'package:interactive_map/screens/vechicles/tractor.dart';
import 'package:interactive_map/screens/vechicles/train.dart';
import 'package:interactive_map/screens/vechicles/truck.dart';
import 'package:interactive_map/widgets/custom_text_container.dart';
import 'package:interactive_map/widgets/custom_topic.dart';
import 'package:interactive_map/widgets/text_area_with_clip.dart';
import 'package:video_player/video_player.dart';
import 'package:interactive_map/utills/utils.dart';
import 'package:get/get.dart';
import 'package:interactive_map/controller/controller.dart';

class TransitionPage extends StatefulWidget {
  const TransitionPage(
      {Key? key,
      this.from,
      this.offsetHor,
      this.offsetVer,
      required this.url,
      required this.back})
      : super(key: key);
  final offsetHor;
  final offsetVer;
  final from;
  final url;
  final back;
  @override
  _TransitionPageState createState() => _TransitionPageState();
}

class _TransitionPageState extends State<TransitionPage> {
  late VideoPlayerController _controller;

  late VideoPlayerController _backVideoController;
  bool _backVideoPlaying = false;

  bool _isPlaying = false;

  late String url;
  bool show = false;

  setShow() {
    setState(() {
      show = !show;
    });
  }

  toNavigate(String from, String current) {
    if (from == Pages.avgNarm) {
      return AvgNArmVideo(
        from: current,
        offsetHor: offsetHor,
        offsetVer: offsetVer,
      );
    } else if (from == Pages.train) {
      return TrainVideo(
        from: current,
        offsetHor: offsetHor,
        offsetVer: offsetVer,
      );
    } else if (from == Pages.excavator) {
      return ExcavatorVideo(
        from: current,
        offsetHor: offsetHor,
        offsetVer: offsetVer,
      );
    } else if (from == Pages.sportsCar) {
      return SportsCarVideo(
        from: current,
        offsetHor: offsetHor,
        offsetVer: offsetVer,
      );
    } else if (from == Pages.truck) {
      return TruckVideo(
        from: current,
        offsetHor: offsetHor,
        offsetVer: offsetVer,
      );
    } else if (from == Pages.tractor) {
      return TractorVideo(
        from: current,
        offsetHor: offsetHor,
        offsetVer: offsetVer,
      );
    } else if (from == Pages.bus) {
      return BusVideo(
        from: current,
        offsetHor: offsetHor,
        offsetVer: offsetVer,
      );
    }
    
  }

  @override
  void initState() {
    url = widget.url;

    _controller = VideoPlayerController.asset(url)
      ..initialize().then((_) => {
            setState(() {
              _controller.setVolume(0);
              _controller.play();
              show = true;
            })
          });

    _backVideoController = VideoPlayerController.asset(widget.back)
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
                              _backVideoPlaying
                                  ? SizedBox(
                                      width: Utils.getVideoScreenWidth(
                                          screenSizeMobile1),
                                      height: Utils.getVideoScreenHeight(
                                          screenSizeMobile1),
                                      child: VideoPlayer(_backVideoController),
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
                              _backVideoPlaying
                                  ? SizedBox(
                                      width: Utils.getVideoScreenWidth(
                                          screenSizeMobile2),
                                      height: Utils.getVideoScreenHeight(
                                          screenSizeMobile2),
                                      child: VideoPlayer(_backVideoController),
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
                        _backVideoPlaying
                            ? SizedBox(
                                width: Utils.getVideoScreenWidth(screenSize),
                                height: Utils.getVideoScreenHeight(screenSize),
                                child: VideoPlayer(_backVideoController),
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
          show && screenSize.width > 500 && screenSize.height > 500
              ? nextButton()
              : Container(),
          show ? menuButton() : Container(),
          show
              ? Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    SizedBox(
                      height:
                          50 * (screenSize.height / VideoAspectRatio.height),
                    ),
                    Padding(
                      padding: EdgeInsets.only(left: 25),
                      child: CustomTopic(
                        topic: "Smart Motor System - V Series",
                        subTopic:
                            "Includes: Smart Motor, Motor Controller, and Hub",
                        screenSize: screenSize,
                      ),
                    ),
                    SizedBox(
                      height:
                          25 * (screenSize.height / VideoAspectRatio.height),
                    ),
                    TextAreaWithClip(
                      screenSize: screenSize,
                      texts: const [
                        "Optimal efficiency switched reluctance motor",
                        "Standerd NEMA dimensions",
                        "Available in 1-10 HP",
                      ],
                      topic: "",
                      description: "",
                      ratio: 0.38,
                    ),
                    SizedBox(
                      height:
                          45 * (screenSize.height / VideoAspectRatio.height),
                    ),
                    screenSize.width < 500 || screenSize.height < 500
                        ? Container()
                        : Container(
                            width: screenSize.width *
                                0.25 *
                                Utils.getMultiplier(screenSize.width),
                            child: widget.from == Pages.avgNarm
                                ? Column(
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.center,
                                    children: [
                                      Container(
                                        width: screenSize.width *
                                            0.25 *
                                            Utils.getMultiplier(
                                                screenSize.width),
                                        child: Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.center,
                                          children: [
                                            CustomTextContainer(
                                              screenSize: screenSize,
                                              topic: "93.2%",
                                              description:
                                                  "PEAK MOTOR EFFICIENCY",
                                            ),
                                            SizedBox(
                                              width: 25 *
                                                  (screenSize.width /
                                                      VideoAspectRatio.width),
                                            ),
                                            CustomTextContainer(
                                              screenSize: screenSize,
                                              topic: "0%",
                                              description: "RARE EARTH METALS",
                                            ),
                                          ],
                                        ),
                                      ),
                                      SizedBox(
                                        height: 25 *
                                            (screenSize.height /
                                                VideoAspectRatio.height),
                                      ),
                                      Container(
                                        width: screenSize.width *
                                            0.25 *
                                            Utils.getMultiplier(
                                                screenSize.width),
                                        child: Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.center,
                                          children: [
                                            CustomTextContainer(
                                              screenSize: screenSize,
                                              topic: "50%",
                                              description: "LIGHTER WEIGHT",
                                            ),
                                          ],
                                        ),
                                      ),
                                    ],
                                  )
                                : Column(
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.center,
                                    children: [
                                      Container(
                                        width: screenSize.width *
                                            0.25 *
                                            Utils.getMultiplier(
                                                screenSize.width),
                                        child: Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.center,
                                          children: [
                                            CustomTextContainer(
                                              screenSize: screenSize,
                                              topic: "IE5+",
                                              description: "ACROSS MOST HP",
                                            ),
                                            SizedBox(
                                              width: 25 *
                                                  (screenSize.width /
                                                      VideoAspectRatio.width),
                                            ),
                                            CustomTextContainer(
                                              screenSize: screenSize,
                                              topic: "Up to 13%",
                                              description:
                                                  "ETRA ENERGY SAVINGS OVER VFD",
                                            ),
                                          ],
                                        ),
                                      ),
                                      SizedBox(
                                        height: 25 *
                                            (screenSize.height /
                                                VideoAspectRatio.height),
                                      ),
                                      Container(
                                        width: screenSize.width *
                                            0.25 *
                                            Utils.getMultiplier(
                                                screenSize.width),
                                        child: Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.center,
                                          children: [
                                            CustomTextContainer(
                                              screenSize: screenSize,
                                              topic: "92%",
                                              description:
                                                  "PEAK EFFICIENCY AT 3 HP",
                                            ),
                                          ],
                                        ),
                                      ),
                                    ],
                                  ),
                          ),
                    //  screenSize.width < 500 || screenSize.height < 500
                    //     ? Container()
                    //     : widget.from == Pages.dataCenter
                    //         ? Container(
                    //             width: screenSize.width *
                    //                 0.35 *
                    //                 Utils.getMultiplier(screenSize.width),
                    //             child: Row(
                    //               children: [
                    //                 Container(
                    //                   width: screenSize.width *
                    //                       0.13 *
                    //                       Utils.getMultiplier(
                    //                           screenSize.width),
                    //                   height: screenSize.width *
                    //                       0.15 *
                    //                       Utils.getMultiplier(
                    //                           screenSize.width),
                    //                   decoration: const BoxDecoration(
                    //                     image: DecorationImage(
                    //                       image: AssetImage(
                    //                           'assets/graphics/TX_front.png'),
                    //                       fit: BoxFit.contain,
                    //                     ),
                    //                   ),
                    //                 ),
                    //                 Container(
                    //                   width: screenSize.width *
                    //                       0.13 *
                    //                       Utils.getMultiplier(
                    //                           screenSize.width),
                    //                   height: screenSize.width *
                    //                       0.15 *
                    //                       Utils.getMultiplier(
                    //                           screenSize.width),
                    //                   padding: const EdgeInsets.all(1),
                    //                   decoration: const BoxDecoration(
                    //                     image: DecorationImage(
                    //                       image: AssetImage(
                    //                           'assets/graphics/TX_side.png'),
                    //                       fit: BoxFit.contain,
                    //                     ),
                    //                   ),
                    //                 ),
                    //               ],
                    //             ),
                    //           )
                    //         : Container(
                    //             width: screenSize.width *
                    //                 0.35 *
                    //                 Utils.getMultiplier(screenSize.width),
                    //             child: Stack(
                    //               children: [
                    //                 Container(
                    //                   width: screenSize.width *
                    //                       0.20 *
                    //                       Utils.getMultiplier(
                    //                           screenSize.width),
                    //                   height: screenSize.width *
                    //                       0.15 *
                    //                       Utils.getMultiplier(
                    //                           screenSize.width),
                    //                   decoration: const BoxDecoration(
                    //                     image: DecorationImage(
                    //                       image: AssetImage(
                    //                           'assets/graphics/router.png'),
                    //                       fit: BoxFit.contain,
                    //                     ),
                    //                   ),
                    //                 ),
                    //                 Positioned(
                    //                   left: screenSize.width *
                    //                       0.1 *
                    //                       Utils.getMultiplier(
                    //                           screenSize.width),
                    //                   child: Container(
                    //                     width: screenSize.width *
                    //                         0.15 *
                    //                         Utils.getMultiplier(
                    //                             screenSize.width),
                    //                     height: screenSize.width *
                    //                         0.1 *
                    //                         Utils.getMultiplier(
                    //                             screenSize.width),
                    //                     padding: const EdgeInsets.all(1),
                    //                     decoration: const BoxDecoration(
                    //                       image: DecorationImage(
                    //                         image: AssetImage(
                    //                             'assets/graphics/Motor_controller.png'),
                    //                         fit: BoxFit.contain,
                    //                       ),
                    //                     ),
                    //                   ),
                    //                 ),
                    //               ],
                    //             ),
                    //           ),
                  ],
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
            setShow();
            _controller.pause();
            _controller.removeListener(() {});
            Navigator.pushReplacement(
              context,
              PageRouteBuilder(
                pageBuilder: (context, animation1, animation2) =>
                    toNavigate(widget.from, Pages.transition),
                transitionDuration: Duration(seconds: 2),
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
          if (screenSize.width < 500 || screenSize.height < 500) {
            setShow();
            _controller.pause();
            _controller.removeListener(() {});
            Navigator.pushReplacement(
              context,
              PageRouteBuilder(
                pageBuilder: (context, animation1, animation2) =>
                    toNavigate(widget.from, Pages.motor),
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
            screenSize.width * 0.070 * Utils.getMultiplier(screenSize.width),
        width: screenSize.width * 0.070 * Utils.getMultiplier(screenSize.width),
        child: GestureDetector(
          onTap: () {
            _controller.pause();
            _controller.removeListener(() {});
            Navigator.pushReplacement(
              context,
              PageRouteBuilder(
                pageBuilder: (context, animation1, animation2) =>
                    toNavigate(widget.from, Pages.transitionPageToHome),
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
}
