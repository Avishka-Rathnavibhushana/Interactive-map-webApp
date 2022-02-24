import 'package:flutter/material.dart';
import 'package:interactive_map/constants/constants.dart';
import 'package:interactive_map/main_buildings/bank.dart';
import 'package:interactive_map/main_buildings/datacentre.dart';
import 'package:interactive_map/main_buildings/fastfood.dart';
import 'package:interactive_map/main_buildings/groceryshop.dart';
import 'package:interactive_map/main_buildings/retail.dart';
import 'package:interactive_map/main_buildings/school.dart';
import 'package:interactive_map/main_buildings/inside_main_building/screen_left.dart';
import 'package:interactive_map/main_buildings/inside_main_building/screen_right.dart';
import 'package:interactive_map/main_buildings/warehouse.dart';
import 'package:interactive_map/widgets/custom_button_label_with_clip.dart';
import 'package:interactive_map/widgets/text_area_with_clip.dart';
import 'package:video_player/video_player.dart';

class MapMainScreens extends StatefulWidget {
  const MapMainScreens({Key? key, this.from, this.offsetHor, this.offsetVer})
      : super(key: key);
  final offsetHor;
  final offsetVer;
  final from;
  @override
  _MapMainScreensState createState() => _MapMainScreensState();
}

class _MapMainScreensState extends State<MapMainScreens> {
  late VideoPlayerController _controller;

  late VideoPlayerController _leftScreenVideoController;
  bool _leftScreenVideoPlaying = false;
  late VideoPlayerController _rightScreenVideoController;
  bool _rightScreenVideoPlaying = false;

  bool _isPlaying = false;
  int index = 0;
  bool show = false;
  String url = '';

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

  toNavigate(String from) {
    if (from == Pages.school) {
      return SchoolVideo(
        from: Pages.map,
        offsetHor: offsetHor,
        offsetVer: offsetVer,
      );
    } else if (from == Pages.bank) {
      return BankVideo(
        from: Pages.map,
        offsetHor: offsetHor,
        offsetVer: offsetVer,
      );
    } else if (from == Pages.grocery) {
      return GroceryShopVideo(
        from: Pages.map,
        offsetHor: offsetHor,
        offsetVer: offsetVer,
      );
    } else if (from == Pages.dataCenter) {
      return DataCentreVideo(
        from: Pages.map,
        offsetHor: offsetHor,
        offsetVer: offsetVer,
      );
    } else if (from == Pages.fastfoods) {
      return FastFoodVideo(
        from: Pages.map,
        offsetHor: offsetHor,
        offsetVer: offsetVer,
      );
    } else if (from == Pages.werehouse) {
      return WarehouseVideo(
        from: Pages.map,
        offsetHor: offsetHor,
        offsetVer: offsetVer,
      );
    } else if (from == Pages.retail) {
      return RetailVideo(
        from: Pages.map,
        offsetHor: offsetHor,
        offsetVer: offsetVer,
      );
    }
  }

  videoHandler() async {
    if (widget.from == Pages.school) {
      url = 'assets/videos/school_REV.mp4';
    } else if (widget.from == Pages.bank) {
      url = 'assets/videos/bank_REV.mp4';
    } else if (widget.from == Pages.grocery) {
      url = 'assets/videos/groceryshop_REV.mp4';
    } else if (widget.from == Pages.dataCenter) {
      url = 'assets/videos/datacentre_REV.mp4';
    } else if (widget.from == Pages.fastfoods) {
      url = 'assets/videos/fastfood_REV.mp4';
    } else if (widget.from == Pages.werehouse) {
      url = 'assets/videos/warehouse_REV.mp4';
    } else if (widget.from == Pages.retail) {
      url = 'assets/videos/retail_REV.mp4';
    }
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
                                  to: widget.from,
                                  offsetHor: offsetHor,
                                  offsetVer: offsetVer),
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
                              ScreenRight(
                            to: widget.from,
                            offsetHor: offsetHor,
                            offsetVer: offsetVer,
                          ),
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
                  toNavigate(widget.from),
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
              image: AssetImage(homeImage),
              fit: BoxFit.cover,
            ),
          ),
        ),
      ),
    );
  }
}
