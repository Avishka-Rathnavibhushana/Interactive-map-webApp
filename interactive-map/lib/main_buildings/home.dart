import 'dart:html';

import 'package:flutter/material.dart';
import 'package:interactive_map/constants/constants.dart';
import 'package:interactive_map/main_buildings/bank.dart';
import 'package:interactive_map/main_buildings/datacentre.dart';
import 'package:interactive_map/main_buildings/fastfood.dart';
import 'package:interactive_map/main_buildings/groceryshop.dart';
import 'package:interactive_map/main_buildings/retail.dart';
import 'package:interactive_map/main_buildings/school.dart';
import 'package:interactive_map/main_buildings/warehouse.dart';
import 'package:interactive_map/widgets/custom_button_label.dart';
import 'package:interactive_map/widgets/custom_button_label_with_clip.dart';
import 'package:interactive_map/widgets/custom_text_container.dart';
import 'package:interactive_map/widgets/custom_topic.dart';
import 'package:interactive_map/widgets/shared_widgets.dart';
import 'package:interactive_map/widgets/squre_shaped_custom_container.dart';
import 'package:interactive_map/widgets/textArea_text_Topic.dart';
import 'package:interactive_map/widgets/textArea_text_description.dart';
import 'package:interactive_map/widgets/textArea_text_row.dart';
import 'package:interactive_map/widgets/text_area.dart';
import 'package:interactive_map/widgets/text_area_small.dart';
import 'package:interactive_map/widgets/text_area_with_QR.dart';
import 'package:video_player/video_player.dart';

class HomeVideo extends StatefulWidget {
  const HomeVideo({Key? key}) : super(key: key);
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

  @override
  Widget build(BuildContext context) {
    var screenSize = MediaQuery.of(context).size;
    return Scaffold(
      body: SingleChildScrollView(
        child: Stack(
          children: [
            FittedBox(
              fit: BoxFit.fitHeight,
              child: Container(
                width: 3840,
                height: 2160,
                child: VideoPlayer(_timerVideoController),
              ),
            ),
            show ? Container() : bank(),
            show ? Container() : dataCentre(),
            show ? Container() : school(),
            show ? Container() : retail(),
            show ? Container() : warehouse(),
            show ? Container() : groceryShop(),
            show ? Container() : fastFood(),
            show ? Container() : qrButton(),

            Stack(
              children: [
                _bankVideoPlaying
                    ? AspectRatio(
                        aspectRatio: _bankVideoController.value.aspectRatio,
                        child: VideoPlayer(_bankVideoController),
                      )
                    : Container(),
                _dataCentreVideoPlaying
                    ? AspectRatio(
                        aspectRatio:
                            _dataCentreVideoController.value.aspectRatio,
                        child: VideoPlayer(_dataCentreVideoController),
                      )
                    : Container(),
                _schoolVideoPlaying
                    ? AspectRatio(
                        aspectRatio: _schoolVideoController.value.aspectRatio,
                        child: VideoPlayer(_schoolVideoController),
                      )
                    : Container(),
                _retailVideoPlaying
                    ? AspectRatio(
                        aspectRatio: _retailVideoController.value.aspectRatio,
                        child: VideoPlayer(_retailVideoController),
                      )
                    : Container(),
                _warehouseVideoPlaying
                    ? AspectRatio(
                        aspectRatio:
                            _warehouseVideoController.value.aspectRatio,
                        child: VideoPlayer(_warehouseVideoController),
                      )
                    : Container(),
                _groceryShopVideoPlaying
                    ? AspectRatio(
                        aspectRatio:
                            _groceryShopVideoController.value.aspectRatio,
                        child: VideoPlayer(_groceryShopVideoController),
                      )
                    : Container(),
                _fastFoodVideoPlaying
                    ? AspectRatio(
                        aspectRatio: _fastFoodVideoController.value.aspectRatio,
                        child: VideoPlayer(_fastFoodVideoController),
                      )
                    : Container(),
              ],
            ),
            loading
                ? Container(
                    width: screenSize.width,
                    child: Image.asset(
                      buildingImage,
                      fit: BoxFit.fill,
                    ),
                  )
                : Container(),
            // showQR
            //     ? Container(
            //         width: screenSize.width,
            //         child: Expanded(
            //           child: Image.asset(
            //             schoolSelected,
            //             fit: BoxFit.fill,
            //           ),
            //         ),
            //       )
            //     : Container(),
            showQR
                ? GestureDetector(
                    onTap: () async {
                      setState(() {
                        width = 0;
                      });

                      await Future.delayed(const Duration(milliseconds: 200));
                      setState(() {
                        showQR = false;
                      });
                      setShow();
                    },
                    child: Container(
                      width: screenSize.width,
                      child: Image.asset(
                        qrBackgroundImage,
                        fit: BoxFit.fill,
                      ),
                    ),
                  )
                : Container(),
            showQR
                ? Positioned(
                    bottom: screenSize.height * (0.2),
                    child: TextAreaWithQR(
                      screenSize: screenSize,
                      width: width,
                      height: screenSize.width * (0.2),
                    ),
                  )
                : Container(),
            showTextAreaSmall
                ? Positioned(
                    bottom: screenSize.height * (0.2),
                    child: TextAreaSmall(
                      width: width,
                      screenSize: screenSize,
                      prefixText: "64%",
                      description:
                          "of energy in school is used by HVAC and lightning",
                    ),
                  )
                : Container(),
          ],
        ),
      ),
    );
  }

  Widget qrButton() {
    var screenSize = MediaQuery.of(context).size;
    return SizedBox(
      height: screenSize.height * 0.95,
      child: Align(
        alignment: Alignment.topRight,
        child: GestureDetector(
          onTap: () async {
            setShow();
            setState(() {
              width = 0;
              showQR = true;
            });

            await Future.delayed(const Duration(milliseconds: 200));

            setState(() {
              width = screenSize.width * 0.2;
            });
          },
          child: Container(
            width: screenSize.width * 0.050,
            height: screenSize.width * 0.050,
            decoration: const BoxDecoration(
              image: DecorationImage(
                image: AssetImage('assets/graphics/MORE.png'),
                fit: BoxFit.cover,
              ),
            ),
          ),
        ),
      ),
    );
  }

  Widget bank() {
    var screenSize = MediaQuery.of(context).size;
    return Positioned(
        left: screenSize.width * (0.61),
        top: screenSize.width * (0.42),
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
                  _bankVideoController.play();

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

                        customPushReplacement(context, BankVideo());
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
        left: screenSize.width * (0.12),
        top: screenSize.width * (0.26),
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
                _dataCentreVideoController.play();

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

                      customPushReplacement(context, const DataCentreVideo());
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
        left: screenSize.width * (0.28),
        top: screenSize.width * (0.125),
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
                _warehouseVideoController.play();

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

                      customPushReplacement(context, const WarehouseVideo());
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

  Widget school() {
    var screenSize = MediaQuery.of(context).size;
    return Positioned(
        left: screenSize.width * (0.445),
        top: screenSize.width * (0.46),
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

                      customPushReplacement(context, const SchoolVideo());
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

  Widget retail() {
    var screenSize = MediaQuery.of(context).size;
    return Positioned(
        left: screenSize.width * (0.618),
        top: screenSize.width * (0.073),
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
                _retailVideoController.play();

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

                      customPushReplacement(context, const RetailVideo());
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
        left: screenSize.width * (0.755),
        top: screenSize.width * (0.363),
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
                _groceryShopVideoController.play();

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

                      customPushReplacement(context, const GroceryShopVideo());
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
        left: screenSize.width * (0.345),
        top: screenSize.width * (0.195),
        child: Stack(
          children: [
            InkWell(
              onTap: () async {
                setShow();
                setShow();
                setState(() {
                  timerOFF = true;
                });

                _timerVideoController.pause();

                setState(() {
                  _fastFoodVideoPlaying = true;
                });
                _fastFoodVideoController.play();

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

                      customPushReplacement(context, const FastFoodVideo());
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
