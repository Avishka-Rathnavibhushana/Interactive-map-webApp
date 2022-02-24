import 'package:flutter/material.dart';
import 'package:interactive_map/constants/constants.dart';
import 'package:interactive_map/main_buildings/bank.dart';
import 'package:interactive_map/main_buildings/datacentre.dart';
import 'package:interactive_map/main_buildings/fastfood.dart';
import 'package:interactive_map/main_buildings/groceryshop.dart';
import 'package:interactive_map/main_buildings/retail.dart';
import 'package:interactive_map/main_buildings/school.dart';
import 'package:interactive_map/main_buildings/warehouse.dart';
import 'package:interactive_map/widgets/custom_button_label_with_clip.dart';
import 'package:interactive_map/widgets/shared_widgets.dart';
import 'package:interactive_map/widgets/text_area_small_with_clip.dart';
import 'package:interactive_map/widgets/text_area_with_QR_with_clip.dart';
import 'package:video_player/video_player.dart';

class HomeVideo extends StatefulWidget {
  const HomeVideo({Key? key, this.offsetHor, this.offsetVer}) : super(key: key);
  final offsetHor;
  final offsetVer;
  @override
  _HomeVideoState createState() => _HomeVideoState();
}

class _HomeVideoState extends State<HomeVideo> {
  bool loading = false;

  late VideoPlayerController _timerVideoController;

  late VideoPlayerController _bankVideoController;
  bool _bankVideoPlaying = false;
  late VideoPlayerController _dataCentreVideoController;
  bool _dataCentreVideoPlaying = false;
  late VideoPlayerController _schoolVideoController;
  bool _schoolVideoPlaying = false;
  late VideoPlayerController _retailVideoController;
  bool _retailVideoPlaying = false;
  late VideoPlayerController _warehouseVideoController;
  bool _warehouseVideoPlaying = false;
  late VideoPlayerController _groceryShopVideoController;
  bool _groceryShopVideoPlaying = false;
  late VideoPlayerController _fastFoodVideoController;
  bool _fastFoodVideoPlaying = false;

  bool _isPlaying = false;
  int index = 0;
  bool show = false;

  final String timerVideoUrl = 'assets/videos/Buildings_menu_loop.mp4';

  final String bankVideoUrl = 'assets/videos/bank.mp4';
  final String dataCentreVideoUrl = 'assets/videos/datacentre.mp4';
  final String schoolVideoUrl = 'assets/videos/school.mp4';
  final String retailVideoUrl = 'assets/videos/retail.mp4';
  final String warehouseVideoUrl = 'assets/videos/warehouse.mp4';
  final String groceryShopVideoUrl = 'assets/videos/groceryshop.mp4';
  final String fastFoodVideoUrl = 'assets/videos/fastfood.mp4';

  final String buildingImage = 'assets/tempory images/Buildings_menu_still.png';
  final String qrBackgroundImage =
      'assets/tempory images/Buildings_menu_QR.png';

  bool timerOFF = false;

  bool showQR = false;
  bool showTextAreaSmall = false;

  double width = 0;

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
    setState(() {
      loading = true;
    });

    index = 0;
    show = true;

    videoHandler();

    super.initState();
  }

  videoHandler() async {
    _timerVideoController = VideoPlayerController.asset(timerVideoUrl);
    await _timerVideoController.initialize();
    setState(() {
      _timerVideoController.setVolume(0);
      _timerVideoController.play();
      _timerVideoController.setLooping(true);
      setShow();
    });

    _bankVideoController = VideoPlayerController.asset(bankVideoUrl)
      ..initialize().then((_) => {
            setState(() {
              _bankVideoController.setVolume(0);
              _bankVideoController.setLooping(false);
            })
          });
    _dataCentreVideoController = VideoPlayerController.asset(dataCentreVideoUrl)
      ..initialize().then((_) => {
            setState(() {
              _dataCentreVideoController.setVolume(0);
              _dataCentreVideoController.setLooping(false);
            })
          });
    _schoolVideoController = VideoPlayerController.asset(schoolVideoUrl)
      ..initialize().then((_) => {
            setState(() {
              _schoolVideoController.setVolume(0);
              _schoolVideoController.setLooping(false);
            })
          });
    _retailVideoController = VideoPlayerController.asset(retailVideoUrl)
      ..initialize().then((_) => {
            setState(() {
              _retailVideoController.setVolume(0);
              _retailVideoController.setLooping(false);
            })
          });
    _warehouseVideoController = VideoPlayerController.asset(warehouseVideoUrl)
      ..initialize().then((_) => {
            setState(() {
              _warehouseVideoController.setVolume(0);
              _warehouseVideoController.setLooping(false);
            })
          });
    _groceryShopVideoController =
        VideoPlayerController.asset(groceryShopVideoUrl)
          ..initialize().then((_) => {
                setState(() {
                  _groceryShopVideoController.setVolume(0);
                  _groceryShopVideoController.setLooping(false);
                })
              });
    _fastFoodVideoController = VideoPlayerController.asset(fastFoodVideoUrl)
      ..initialize().then((_) => {
            setState(() {
              _fastFoodVideoController.setVolume(0);
              _fastFoodVideoController.setLooping(false);
            })
          });

    await Future.delayed(const Duration(seconds: 2));

    setState(() {
      loading = false;
    });
  }

  @override
  void dispose() {
    _timerVideoController.dispose();
    _bankVideoController.dispose();
    _dataCentreVideoController.dispose();
    _schoolVideoController.dispose();
    _retailVideoController.dispose();
    _warehouseVideoController.dispose();
    _groceryShopVideoController.dispose();
    _fastFoodVideoController.dispose();

    super.dispose();
  }

  // double getWidth(Size size) {
  //   if (size.width > 1920 && size.height > 1080) {
  //     return 3840;
  //   } else if (size.width > 1366 && size.height > 768) {
  //     return 1920;
  //   } else if (size.width < 1366 && size.height < 768) {
  //     return 1920 * 0.5;
  //   }

  //   return 1920;
  // }

  // double getHeight(Size size) {
  //   if (size.width > 1920 && size.height > 1080) {
  //     return 2160;
  //   } else if (size.width > 1366 && size.height > 768) {
  //     return 1080;
  //   } else if (size.width < 1366 && size.height < 768) {
  //     return 1080 * 0.5;
  //   }

  //   return 1080;
  // }

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
            Padding(
              padding: const EdgeInsets.only(bottom: 100),
              child: Container(
                alignment: Alignment.centerLeft,
                height: screenSize.width * (0.2),
                child: showQR
                    ? TextAreaWithQRWithClip(
                        screenSize: screenSize,
                        width: width == 0 ? 0 : screenSize.width * (0.2),
                        height: screenSize.width * (0.2),
                      )
                    : Container(),
              ),
            ),
            showQR ? qrButton() : Container(),
            show ? Container() : qrButton(),
            showTextAreaSmall
                ? Padding(
                    padding: const EdgeInsets.only(bottom: 100),
                    child: Container(
                      alignment: Alignment.bottomLeft,
                      child: TextAreaSmallWithClip(
                        width: width,
                        screenSize: screenSize,
                        prefixText: "64%",
                        description:
                            "of energy in school is used by HVAC and lightning",
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
                  child: VideoPlayer(_timerVideoController),
                ),
                show ? Container() : bank(),
                show ? Container() : dataCentre(),
                show ? Container() : school(),
                show ? Container() : retail(),
                show ? Container() : warehouse(),
                show ? Container() : groceryShop(),
                show ? Container() : fastFood(),
                SizedBox(
                  width: screenWidth,
                  height: screenHeight,
                  child: Stack(
                    children: [
                      _bankVideoPlaying
                          ? SizedBox(
                              width: screenWidth,
                              height: screenHeight,
                              child: VideoPlayer(_bankVideoController),
                            )
                          : Container(),
                      _dataCentreVideoPlaying
                          ? SizedBox(
                              width: screenWidth,
                              height: screenHeight,
                              child: VideoPlayer(_dataCentreVideoController),
                            )
                          : Container(),
                      _schoolVideoPlaying
                          ? SizedBox(
                              width: screenWidth,
                              height: screenHeight,
                              child: VideoPlayer(_schoolVideoController),
                            )
                          : Container(),
                      _retailVideoPlaying
                          ? SizedBox(
                              width: screenWidth,
                              height: screenHeight,
                              child: VideoPlayer(_retailVideoController),
                            )
                          : Container(),
                      _warehouseVideoPlaying
                          ? SizedBox(
                              width: screenWidth,
                              height: screenHeight,
                              child: VideoPlayer(_warehouseVideoController),
                            )
                          : Container(),
                      _groceryShopVideoPlaying
                          ? SizedBox(
                              width: screenWidth,
                              height: screenHeight,
                              child: VideoPlayer(_groceryShopVideoController),
                            )
                          : Container(),
                      _fastFoodVideoPlaying
                          ? SizedBox(
                              width: screenWidth,
                              height: screenHeight,
                              child: VideoPlayer(_fastFoodVideoController),
                            )
                          : Container(),
                    ],
                  ),
                ),
                loading
                    ? SizedBox(
                        width: screenWidth,
                        height: screenHeight,
                        child: Image.asset(
                          buildingImage,
                          fit: BoxFit.fill,
                        ),
                      )
                    : Container(),
                showQR
                    ? GestureDetector(
                        onTap: () async {
                          setState(() {
                            width = 0;
                          });

                          await Future.delayed(
                              const Duration(milliseconds: 200));
                          setState(() {
                            showQR = false;
                          });
                          setShow();
                        },
                        child: SizedBox(
                          width: screenWidth,
                          height: screenHeight,
                          child: Image.asset(
                            qrBackgroundImage,
                            fit: BoxFit.fill,
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

  Widget qrButton() {
    var screenSize = MediaQuery.of(context).size;
    return Container(
      alignment: Alignment.topRight,
      height: screenSize.width * 0.050,
      width: screenSize.width * 0.050,
      child: GestureDetector(
        onTap: () async {
          if (showQR) {
            setState(() {
              width = 0;
            });

            await Future.delayed(const Duration(milliseconds: 200));
            setState(() {
              showQR = false;
            });
            setShow();
          } else {
            setShow();
            setState(() {
              width = 0;
              showQR = true;
            });

            await Future.delayed(const Duration(milliseconds: 200));

            setState(() {
              width = screenSize.width * 0.2;
            });
          }
        },
        child: Container(
          width: screenSize.width * 0.050,
          height: screenSize.width * 0.050,
          decoration: BoxDecoration(
            image: DecorationImage(
              image: showQR
                  ? const AssetImage(homeImage)
                  : const AssetImage(moreImage),
              fit: BoxFit.cover,
            ),
          ),
        ),
      ),
    );
  }

  Widget school() {
    var screenSize = MediaQuery.of(context).size;
    return Positioned(
        left: screenWidth * 0.445,
        top: screenHeight * 0.825,
        child: Stack(
          children: [
            InkWell(
              onTap: () async {
                setShow();
                setState(() {
                  timerOFF = true;
                });

                _timerVideoController.pause();

                setState(() {
                  _schoolVideoPlaying = true;
                });

                setState(() {
                  width = 0;
                });

                _schoolVideoController.play();

                setState(() {
                  showTextAreaSmall = true;
                });

                await Future.delayed(const Duration(milliseconds: 200));

                setState(() {
                  width = screenSize.width * 0.25;
                });

                _schoolVideoController.addListener(() {
                  final bool isPlaying = _schoolVideoController.value.isPlaying;
                  print(isPlaying);
                  if (isPlaying != _isPlaying) {
                    setState(() {
                      _isPlaying = isPlaying;
                      setIndex(++index);
                    });
                    if (index > 1) {
                      _schoolVideoController.removeListener(() {});

                      customPushReplacement(
                          context,
                          SchoolVideo(
                            from: Pages.home,
                            offsetHor: offsetHor,
                            offsetVer: offsetVer,
                          ));
                    }
                  }
                });
              },
              child: CustomButtonLabelWithClip(
                screenSize: screenSize,
                text: "Schools",
                type: 0,
              ),
            ),
          ],
        ));
  }

  Widget bank() {
    var screenSize = MediaQuery.of(context).size;
    return Positioned(
        left: screenWidth * 0.615,
        top: screenHeight * 0.75,
        child: Stack(
          children: [
            Center(
              child: InkWell(
                onTap: () async {
                  setShow();
                  setState(() {
                    timerOFF = true;
                  });

                  _timerVideoController.pause();

                  setState(() {
                    _bankVideoPlaying = true;
                  });

                  setState(() {
                    width = 0;
                  });

                  _bankVideoController.play();

                  setState(() {
                    showTextAreaSmall = true;
                  });

                  await Future.delayed(const Duration(milliseconds: 200));

                  setState(() {
                    width = screenSize.width * 0.25;
                  });

                  _bankVideoController.addListener(() {
                    final bool isPlaying = _bankVideoController.value.isPlaying;
                    print(isPlaying);
                    if (isPlaying != _isPlaying) {
                      setState(() {
                        _isPlaying = isPlaying;
                        setIndex(++index);
                      });
                      if (index > 1) {
                        _bankVideoController.removeListener(() {});
                        customPushReplacement(
                            context,
                            BankVideo(
                              from: Pages.home,
                              offsetHor: offsetHor,
                              offsetVer: offsetVer,
                            ));
                      }
                    }
                  });
                },
                child: CustomButtonLabelWithClip(
                  screenSize: screenSize,
                  text: "Banks",
                  type: 0,
                ),
              ),
            ),
          ],
        ));
  }

  Widget dataCentre() {
    var screenSize = MediaQuery.of(context).size;
    return Positioned(
        left: screenWidth * 0.12,
        top: screenHeight * 0.459,
        child: Stack(
          children: [
            InkWell(
              onTap: () async {
                setShow();
                setState(() {
                  timerOFF = true;
                });

                _timerVideoController.pause();

                setState(() {
                  _dataCentreVideoPlaying = true;
                });

                setState(() {
                  width = 0;
                });

                _dataCentreVideoController.play();

                setState(() {
                  showTextAreaSmall = true;
                });

                await Future.delayed(const Duration(milliseconds: 200));

                setState(() {
                  width = screenSize.width * 0.25;
                });
                _dataCentreVideoController.addListener(() {
                  final bool isPlaying =
                      _dataCentreVideoController.value.isPlaying;
                  print(isPlaying);
                  if (isPlaying != _isPlaying) {
                    setState(() {
                      _isPlaying = isPlaying;
                      setIndex(++index);
                    });
                    if (index > 1) {
                      _dataCentreVideoController.removeListener(() {});
                      customPushReplacement(
                          context,
                          DataCentreVideo(
                            from: Pages.home,
                            offsetHor: offsetHor,
                            offsetVer: offsetVer,
                          ));
                    }
                  }
                });
              },
              child: CustomButtonLabelWithClip(
                screenSize: screenSize,
                text: "Data Centers",
                type: 0,
              ),
            ),
          ],
        ));
  }

  Widget warehouse() {
    var screenSize = MediaQuery.of(context).size;
    return Positioned(
        left: screenWidth * 0.269,
        top: screenHeight * 0.22,
        child: Stack(
          children: [
            InkWell(
              onTap: () async {
                setShow();
                setState(() {
                  timerOFF = true;
                });

                _timerVideoController.pause();

                setState(() {
                  _warehouseVideoPlaying = true;
                });

                setState(() {
                  width = 0;
                });

                _warehouseVideoController.play();

                setState(() {
                  showTextAreaSmall = true;
                });

                await Future.delayed(const Duration(milliseconds: 200));

                setState(() {
                  width = screenSize.width * 0.25;
                });

                _warehouseVideoController.addListener(() {
                  final bool isPlaying =
                      _warehouseVideoController.value.isPlaying;
                  print(isPlaying);
                  if (isPlaying != _isPlaying) {
                    setState(() {
                      _isPlaying = isPlaying;
                      setIndex(++index);
                    });
                    if (index > 1) {
                      _warehouseVideoController.removeListener(() {});
                      customPushReplacement(
                          context,
                          WarehouseVideo(
                            from: Pages.home,
                            offsetHor: offsetHor,
                            offsetVer: offsetVer,
                          ));
                    }
                  }
                });
              },
              child: CustomButtonLabelWithClip(
                screenSize: screenSize,
                text: "Warehouses",
                type: 0,
              ),
            ),
          ],
        ));
  }

  Widget retail() {
    var screenSize = MediaQuery.of(context).size;
    return Positioned(
        left: screenWidth * 0.62,
        top: screenHeight * 0.13,
        child: Stack(
          children: [
            InkWell(
              onTap: () async {
                setShow();
                setState(() {
                  timerOFF = true;
                });

                _timerVideoController.pause();

                setState(() {
                  _retailVideoPlaying = true;
                });

                setState(() {
                  width = 0;
                });

                _retailVideoController.play();

                setState(() {
                  showTextAreaSmall = true;
                });

                await Future.delayed(const Duration(milliseconds: 200));

                setState(() {
                  width = screenSize.width * 0.25;
                });

                _retailVideoController.addListener(() {
                  final bool isPlaying = _retailVideoController.value.isPlaying;
                  print(isPlaying);
                  if (isPlaying != _isPlaying) {
                    setState(() {
                      _isPlaying = isPlaying;
                      setIndex(++index);
                    });
                    if (index > 1) {
                      _retailVideoController.removeListener(() {});

                      customPushReplacement(
                          context,
                          RetailVideo(
                            from: Pages.home,
                            offsetHor: offsetHor,
                            offsetVer: offsetVer,
                          ));
                    }
                  }
                });
              },
              child: CustomButtonLabelWithClip(
                screenSize: screenSize,
                text: "Retail Stores",
                type: 0,
              ),
            ),
          ],
        ));
  }

  Widget groceryShop() {
    var screenSize = MediaQuery.of(context).size;
    return Positioned(
        left: screenWidth * 0.75,
        top: screenHeight * 0.64,
        child: Stack(
          children: [
            InkWell(
              onTap: () async {
                setShow();
                setState(() {
                  timerOFF = true;
                });

                _timerVideoController.pause();

                setState(() {
                  _groceryShopVideoPlaying = true;
                });

                setState(() {
                  width = 0;
                });

                _groceryShopVideoController.play();

                setState(() {
                  showTextAreaSmall = true;
                });

                await Future.delayed(const Duration(milliseconds: 200));

                setState(() {
                  width = screenSize.width * 0.25;
                });

                _groceryShopVideoController.addListener(() {
                  final bool isPlaying =
                      _groceryShopVideoController.value.isPlaying;
                  print(isPlaying);
                  if (isPlaying != _isPlaying) {
                    setState(() {
                      _isPlaying = isPlaying;
                      setIndex(++index);
                    });
                    if (index > 1) {
                      _groceryShopVideoController.removeListener(() {});
                      customPushReplacement(
                          context,
                          GroceryShopVideo(
                            from: Pages.home,
                            offsetHor: offsetHor,
                            offsetVer: offsetVer,
                          ));
                    }
                  }
                });
              },
              child: CustomButtonLabelWithClip(
                screenSize: screenSize,
                text: "Grocery Stores",
                type: 0,
              ),
            ),
          ],
        ));
  }

  Widget fastFood() {
    var screenSize = MediaQuery.of(context).size;
    return Positioned(
        left: screenWidth * 0.346,
        top: screenHeight * 0.35,
        child: Stack(
          children: [
            InkWell(
              onTap: () async {
                setShow();
                setState(() {
                  timerOFF = true;
                });

                _timerVideoController.pause();

                setState(() {
                  _fastFoodVideoPlaying = true;
                });

                setState(() {
                  width = 0;
                });

                _fastFoodVideoController.play();

                setState(() {
                  showTextAreaSmall = true;
                });

                await Future.delayed(const Duration(milliseconds: 200));

                setState(() {
                  width = screenSize.width * 0.25;
                });

                _fastFoodVideoController.addListener(() {
                  final bool isPlaying =
                      _fastFoodVideoController.value.isPlaying;
                  print(isPlaying);
                  if (isPlaying != _isPlaying) {
                    setState(() {
                      _isPlaying = isPlaying;
                      setIndex(++index);
                    });
                    if (index > 1) {
                      _fastFoodVideoController.removeListener(() {});
                      customPushReplacement(
                          context,
                          FastFoodVideo(
                            from: Pages.home,
                            offsetHor: offsetHor,
                            offsetVer: offsetVer,
                          ));
                    }
                  }
                });
              },
              child: CustomButtonLabelWithClip(
                screenSize: screenSize,
                text: "Quick Serve Resturants",
                type: 0,
              ),
            ),
          ],
        ));
  }
}
