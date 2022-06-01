import 'package:flutter/material.dart';
import 'package:interactive_map/constants/constants.dart';
import 'package:get/get.dart';
import 'package:interactive_map/controller/controller.dart';
import 'package:interactive_map/main_buildings/bank.dart';
import 'package:interactive_map/main_buildings/datacentre.dart';
import 'package:interactive_map/main_buildings/fastfood.dart';
import 'package:interactive_map/main_buildings/groceryshop.dart';
import 'package:interactive_map/main_buildings/retail.dart';
import 'package:interactive_map/main_buildings/school.dart';
import 'package:interactive_map/main_buildings/warehouse.dart';
import 'package:interactive_map/utills/utils.dart';
import 'package:interactive_map/widgets/custom_button_label.dart';
import 'package:interactive_map/widgets/custom_button_label_mobile.dart';
import 'package:interactive_map/widgets/custom_button_label_with_clip.dart';
import 'package:interactive_map/widgets/shared_widgets.dart';
import 'package:interactive_map/widgets/text_area_small_with_clip.dart';
import 'package:interactive_map/widgets/text_area_with_QR_with_clip.dart';
import 'package:interactive_map/widgets/text_area_with_clip.dart';
import 'package:video_player/video_player.dart';

import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';

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
  bool showNext = false;
  late String nextPage;

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
                          child: VideoPlayer(_timerVideoController),
                        ),
                        SizedBox(
                          width: Utils.getVideoScreenWidth(screenSizeMobile1),
                          height: Utils.getVideoScreenHeight(screenSizeMobile1),
                          child: Stack(
                            children: [
                              _bankVideoPlaying
                                  ? SizedBox(
                                      width: Utils.getVideoScreenWidth(
                                          screenSizeMobile1),
                                      height: Utils.getVideoScreenHeight(
                                          screenSizeMobile1),
                                      child: VideoPlayer(_bankVideoController),
                                    )
                                  : Container(),
                              _dataCentreVideoPlaying
                                  ? SizedBox(
                                      width: Utils.getVideoScreenWidth(
                                          screenSizeMobile1),
                                      height: Utils.getVideoScreenHeight(
                                          screenSizeMobile1),
                                      child: VideoPlayer(
                                          _dataCentreVideoController),
                                    )
                                  : Container(),
                              _schoolVideoPlaying
                                  ? SizedBox(
                                      width: Utils.getVideoScreenWidth(
                                          screenSizeMobile1),
                                      height: Utils.getVideoScreenHeight(
                                          screenSizeMobile1),
                                      child:
                                          VideoPlayer(_schoolVideoController),
                                    )
                                  : Container(),
                              _retailVideoPlaying
                                  ? SizedBox(
                                      width: Utils.getVideoScreenWidth(
                                          screenSizeMobile1),
                                      height: Utils.getVideoScreenHeight(
                                          screenSizeMobile1),
                                      child:
                                          VideoPlayer(_retailVideoController),
                                    )
                                  : Container(),
                              _warehouseVideoPlaying
                                  ? SizedBox(
                                      width: Utils.getVideoScreenWidth(
                                          screenSizeMobile1),
                                      height: Utils.getVideoScreenHeight(
                                          screenSizeMobile1),
                                      child: VideoPlayer(
                                          _warehouseVideoController),
                                    )
                                  : Container(),
                              _groceryShopVideoPlaying
                                  ? SizedBox(
                                      width: Utils.getVideoScreenWidth(
                                          screenSizeMobile1),
                                      height: Utils.getVideoScreenHeight(
                                          screenSizeMobile1),
                                      child: VideoPlayer(
                                          _groceryShopVideoController),
                                    )
                                  : Container(),
                              _fastFoodVideoPlaying
                                  ? SizedBox(
                                      width: Utils.getVideoScreenWidth(
                                          screenSizeMobile1),
                                      height: Utils.getVideoScreenHeight(
                                          screenSizeMobile1),
                                      child:
                                          VideoPlayer(_fastFoodVideoController),
                                    )
                                  : Container(),
                            ],
                          ),
                        ),
                        loading
                            ? SizedBox(
                                width: Utils.getVideoScreenWidth(screenSize),
                                height: Utils.getVideoScreenHeight(screenSize),
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
                                  width: Utils.getVideoScreenWidth(screenSize),
                                  height:
                                      Utils.getVideoScreenHeight(screenSize),
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
                          showNext
                              ? Padding(
                                  padding:
                                      const EdgeInsets.symmetric(vertical: 10),
                                  child: GestureDetector(
                                    onTap: () {
                                      switch (nextPage) {
                                        case 'Schools':
                                          customPushReplacement(
                                              context,
                                              SchoolVideo(
                                                from: Pages.home,
                                                offsetHor: offsetHor,
                                                offsetVer: offsetVer,
                                              ));
                                          break;
                                        case 'bank':
                                          customPushReplacement(
                                              context,
                                              BankVideo(
                                                from: Pages.home,
                                                offsetHor: offsetHor,
                                                offsetVer: offsetVer,
                                              ));
                                          break;
                                        case 'grocery':
                                          customPushReplacement(
                                              context,
                                              GroceryShopVideo(
                                                from: Pages.home,
                                                offsetHor: offsetHor,
                                                offsetVer: offsetVer,
                                              ));
                                          break;
                                        case 'dataCenter':
                                          customPushReplacement(
                                              context,
                                              DataCentreVideo(
                                                from: Pages.home,
                                                offsetHor: offsetHor,
                                                offsetVer: offsetVer,
                                              ));
                                          break;
                                        case 'fastfoods':
                                          customPushReplacement(
                                              context,
                                              FastFoodVideo(
                                                from: Pages.home,
                                                offsetHor: offsetHor,
                                                offsetVer: offsetVer,
                                              ));
                                          break;
                                        case 'werehouse':
                                          customPushReplacement(
                                              context,
                                              WarehouseVideo(
                                                from: Pages.home,
                                                offsetHor: offsetHor,
                                                offsetVer: offsetVer,
                                              ));
                                          break;
                                        case 'retail':
                                          customPushReplacement(
                                              context,
                                              RetailVideo(
                                                from: Pages.home,
                                                offsetHor: offsetHor,
                                                offsetVer: offsetVer,
                                              ));
                                          break;
                                        default:
                                      }
                                      setState(() {
                                        showNext = false;
                                      });
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
                                )
                              : Container(),
                          show
                              ? Container()
                              : schoolMobile(
                                  screenSize.width - screenSize.width * 0.3),
                          show
                              ? Container()
                              : bankMobile(
                                  screenSize.width - screenSize.width * 0.3),
                          show
                              ? Container()
                              : dataCentreMobile(
                                  screenSize.width - screenSize.width * 0.3),
                          show
                              ? Container()
                              : retailMobile(
                                  screenSize.width - screenSize.width * 0.3),
                          show
                              ? Container()
                              : warehouseMobile(
                                  screenSize.width - screenSize.width * 0.3),
                          show
                              ? Container()
                              : groceryShopMobile(
                                  screenSize.width - screenSize.width * 0.3),
                          show
                              ? Container()
                              : fastFoodMobile(
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
                          child: VideoPlayer(_timerVideoController),
                        ),
                        SizedBox(
                          width: Utils.getVideoScreenWidth(screenSizeMobile2),
                          height: Utils.getVideoScreenHeight(screenSizeMobile2),
                          child: Stack(
                            children: [
                              _bankVideoPlaying
                                  ? SizedBox(
                                      width: Utils.getVideoScreenWidth(
                                          screenSizeMobile2),
                                      height: Utils.getVideoScreenHeight(
                                          screenSizeMobile2),
                                      child: VideoPlayer(_bankVideoController),
                                    )
                                  : Container(),
                              _dataCentreVideoPlaying
                                  ? SizedBox(
                                      width: Utils.getVideoScreenWidth(
                                          screenSizeMobile2),
                                      height: Utils.getVideoScreenHeight(
                                          screenSizeMobile2),
                                      child: VideoPlayer(
                                          _dataCentreVideoController),
                                    )
                                  : Container(),
                              _schoolVideoPlaying
                                  ? SizedBox(
                                      width: Utils.getVideoScreenWidth(
                                          screenSizeMobile2),
                                      height: Utils.getVideoScreenHeight(
                                          screenSizeMobile2),
                                      child:
                                          VideoPlayer(_schoolVideoController),
                                    )
                                  : Container(),
                              _retailVideoPlaying
                                  ? SizedBox(
                                      width: Utils.getVideoScreenWidth(
                                          screenSizeMobile2),
                                      height: Utils.getVideoScreenHeight(
                                          screenSizeMobile2),
                                      child:
                                          VideoPlayer(_retailVideoController),
                                    )
                                  : Container(),
                              _warehouseVideoPlaying
                                  ? SizedBox(
                                      width: Utils.getVideoScreenWidth(
                                          screenSizeMobile2),
                                      height: Utils.getVideoScreenHeight(
                                          screenSizeMobile2),
                                      child: VideoPlayer(
                                          _warehouseVideoController),
                                    )
                                  : Container(),
                              _groceryShopVideoPlaying
                                  ? SizedBox(
                                      width: Utils.getVideoScreenWidth(
                                          screenSizeMobile2),
                                      height: Utils.getVideoScreenHeight(
                                          screenSizeMobile2),
                                      child: VideoPlayer(
                                          _groceryShopVideoController),
                                    )
                                  : Container(),
                              _fastFoodVideoPlaying
                                  ? SizedBox(
                                      width: Utils.getVideoScreenWidth(
                                          screenSizeMobile2),
                                      height: Utils.getVideoScreenHeight(
                                          screenSizeMobile2),
                                      child:
                                          VideoPlayer(_fastFoodVideoController),
                                    )
                                  : Container(),
                            ],
                          ),
                        ),
                        loading
                            ? SizedBox(
                                width: Utils.getVideoScreenWidth(screenSize),
                                height: Utils.getVideoScreenHeight(screenSize),
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
                                  width: Utils.getVideoScreenWidth(screenSize),
                                  height:
                                      Utils.getVideoScreenHeight(screenSize),
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
                          showNext
                              ? Padding(
                                  padding:
                                      const EdgeInsets.symmetric(vertical: 10),
                                  child: GestureDetector(
                                    onTap: () {
                                      switch (nextPage) {
                                        case 'Schools':
                                          customPushReplacement(
                                              context,
                                              SchoolVideo(
                                                from: Pages.home,
                                                offsetHor: offsetHor,
                                                offsetVer: offsetVer,
                                              ));
                                          break;
                                        case 'bank':
                                          customPushReplacement(
                                              context,
                                              BankVideo(
                                                from: Pages.home,
                                                offsetHor: offsetHor,
                                                offsetVer: offsetVer,
                                              ));
                                          break;
                                        case 'grocery':
                                          customPushReplacement(
                                              context,
                                              GroceryShopVideo(
                                                from: Pages.home,
                                                offsetHor: offsetHor,
                                                offsetVer: offsetVer,
                                              ));
                                          break;
                                        case 'dataCenter':
                                          customPushReplacement(
                                              context,
                                              DataCentreVideo(
                                                from: Pages.home,
                                                offsetHor: offsetHor,
                                                offsetVer: offsetVer,
                                              ));
                                          break;
                                        case 'fastfoods':
                                          customPushReplacement(
                                              context,
                                              FastFoodVideo(
                                                from: Pages.home,
                                                offsetHor: offsetHor,
                                                offsetVer: offsetVer,
                                              ));
                                          break;
                                        case 'werehouse':
                                          customPushReplacement(
                                              context,
                                              WarehouseVideo(
                                                from: Pages.home,
                                                offsetHor: offsetHor,
                                                offsetVer: offsetVer,
                                              ));
                                          break;
                                        case 'retail':
                                          customPushReplacement(
                                              context,
                                              RetailVideo(
                                                from: Pages.home,
                                                offsetHor: offsetHor,
                                                offsetVer: offsetVer,
                                              ));
                                          break;
                                        default:
                                      }
                                      setState(() {
                                        showNext = false;
                                      });
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
                                )
                              : Container(),
                          show ? Container() : schoolMobile(screenSize.width),
                          show ? Container() : bankMobile(screenSize.width),
                          show
                              ? Container()
                              : dataCentreMobile(screenSize.width),
                          show ? Container() : retailMobile(screenSize.width),
                          show
                              ? Container()
                              : warehouseMobile(screenSize.width),
                          show
                              ? Container()
                              : groceryShopMobile(screenSize.width),
                          show ? Container() : fastFoodMobile(screenSize.width),
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
                    width: Utils.getVideoScreenWidth(screenSize),
                    height: Utils.getVideoScreenHeight(screenSize),
                    child: Stack(
                      children: [
                        _bankVideoPlaying
                            ? SizedBox(
                                width: Utils.getVideoScreenWidth(screenSize),
                                height: Utils.getVideoScreenHeight(screenSize),
                                child: VideoPlayer(_bankVideoController),
                              )
                            : Container(),
                        _dataCentreVideoPlaying
                            ? SizedBox(
                                width: Utils.getVideoScreenWidth(screenSize),
                                height: Utils.getVideoScreenHeight(screenSize),
                                child: VideoPlayer(_dataCentreVideoController),
                              )
                            : Container(),
                        _schoolVideoPlaying
                            ? SizedBox(
                                width: Utils.getVideoScreenWidth(screenSize),
                                height: Utils.getVideoScreenHeight(screenSize),
                                child: VideoPlayer(_schoolVideoController),
                              )
                            : Container(),
                        _retailVideoPlaying
                            ? SizedBox(
                                width: Utils.getVideoScreenWidth(screenSize),
                                height: Utils.getVideoScreenHeight(screenSize),
                                child: VideoPlayer(_retailVideoController),
                              )
                            : Container(),
                        _warehouseVideoPlaying
                            ? SizedBox(
                                width: Utils.getVideoScreenWidth(screenSize),
                                height: Utils.getVideoScreenHeight(screenSize),
                                child: VideoPlayer(_warehouseVideoController),
                              )
                            : Container(),
                        _groceryShopVideoPlaying
                            ? SizedBox(
                                width: Utils.getVideoScreenWidth(screenSize),
                                height: Utils.getVideoScreenHeight(screenSize),
                                child: VideoPlayer(_groceryShopVideoController),
                              )
                            : Container(),
                        _fastFoodVideoPlaying
                            ? SizedBox(
                                width: Utils.getVideoScreenWidth(screenSize),
                                height: Utils.getVideoScreenHeight(screenSize),
                                child: VideoPlayer(_fastFoodVideoController),
                              )
                            : Container(),
                      ],
                    ),
                  ),
                  loading
                      ? SizedBox(
                          width: Utils.getVideoScreenWidth(screenSize),
                          height: Utils.getVideoScreenHeight(screenSize),
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
                            width: Utils.getVideoScreenWidth(screenSize),
                            height: Utils.getVideoScreenHeight(screenSize),
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
  }

  Widget floatingButtonPanel() {
    var screenSize = MediaQuery.of(context).size;
    return Container(
      child: Stack(
        alignment: Alignment.topCenter,
        fit: StackFit.expand,
        children: [
          Padding(
            padding:
                EdgeInsets.only(bottom: Utils.getBottomPadding(screenSize, 50)),
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
          showTextAreaSmall && _schoolVideoPlaying
              ? Padding(
                  padding: EdgeInsets.only(
                      bottom: Utils.getBottomPadding(screenSize, 200)),
                  child: Container(
                    alignment: Alignment.bottomLeft,
                    child: TextAreaSmallWithClip(
                      width: screenSize.width * 0.35,
                      screenSize: screenSize,
                      prefixText: "64%",
                      description:
                          "of energy in school is used by HVAC and lightning",
                    ),
                  ),
                )
              : Container(),
          showTextAreaSmall && _fastFoodVideoPlaying
              ? Padding(
                  padding: EdgeInsets.only(
                      bottom: Utils.getBottomPadding(screenSize, 200)),
                  child: Container(
                    alignment: Alignment.bottomLeft,
                    child: TextAreaSmallWithClip(
                      width: screenSize.width * 0.35,
                      screenSize: screenSize,
                      prefixText: "28%",
                      description:
                          "of restuarant energy costs are from HVAC on avarage",
                    ),
                  ),
                )
              : Container(),
          showTextAreaSmall && _bankVideoPlaying
              ? Padding(
                  padding: EdgeInsets.only(
                      bottom: Utils.getBottomPadding(screenSize, 200)),
                  child: Container(
                    alignment: Alignment.bottomLeft,
                    child: TextAreaSmallWithClip(
                      width: screenSize.width * 0.35,
                      screenSize: screenSize,
                      prefixText: "40-60%",
                      description:
                          "of energy in bank branches is used by HVAC and lightning",
                    ),
                  ),
                )
              : Container(),
          showTextAreaSmall && _retailVideoPlaying
              ? Padding(
                  padding: EdgeInsets.only(
                      bottom: Utils.getBottomPadding(screenSize, 200)),
                  child: Container(
                    alignment: Alignment.bottomLeft,
                    child: TextAreaSmallWithClip(
                      width: screenSize.width * 0.35,
                      screenSize: screenSize,
                      prefixText: "70%",
                      description:
                          "of energy in retail is used by HVAC and lightning",
                    ),
                  ),
                )
              : Container(),
          showTextAreaSmall && _warehouseVideoPlaying
              ? Padding(
                  padding: EdgeInsets.only(
                      bottom: Utils.getBottomPadding(screenSize, 200)),
                  child: Container(
                    alignment: Alignment.bottomLeft,
                    child: TextAreaSmallWithClip(
                      width: screenSize.width * 0.35,
                      screenSize: screenSize,
                      prefixText: "75%",
                      description:
                          "of energy in warehouse is used by HVAC and lightning",
                    ),
                  ),
                )
              : Container(),
          showTextAreaSmall && _dataCentreVideoPlaying
              ? Padding(
                  padding: EdgeInsets.only(
                      bottom: Utils.getBottomPadding(screenSize, 200)),
                  child: Container(
                    alignment: Alignment.bottomLeft,
                    child: TextAreaSmallWithClip(
                      width: screenSize.width * 0.35,
                      screenSize: screenSize,
                      prefixText: "37%",
                      description:
                          "of energy in data centers is used by HVAC and lightning",
                    ),
                  ),
                )
              : Container(),
          showTextAreaSmall && _groceryShopVideoPlaying
              ? Padding(
                  padding: EdgeInsets.only(
                      bottom: Utils.getBottomPadding(screenSize, 200)),
                  child: Container(
                    alignment: Alignment.bottomLeft,
                    child: TextAreaSmallWithClip(
                      width: screenSize.width * 0.35,
                      screenSize: screenSize,
                      prefixText: "37%",
                      description:
                          "of energy in data centers is used by HVAC and lightning",
                    ),
                  ),
                )
              : Container(),
          showNext && screenSize.width >= 500 && screenSize.height >= 500
              ? Positioned(
                  right: 0,
                  bottom: Utils.getBottomPadding(screenSize, 200),
                  child: Container(
                    alignment: Alignment.bottomRight,
                    child: GestureDetector(
                      onTap: () {
                        switch (nextPage) {
                          case 'Schools':
                            customPushReplacement(
                                context,
                                SchoolVideo(
                                  from: Pages.home,
                                  offsetHor: offsetHor,
                                  offsetVer: offsetVer,
                                ));
                            break;
                          case 'bank':
                            customPushReplacement(
                                context,
                                BankVideo(
                                  from: Pages.home,
                                  offsetHor: offsetHor,
                                  offsetVer: offsetVer,
                                ));
                            break;
                          case 'grocery':
                            customPushReplacement(
                                context,
                                GroceryShopVideo(
                                  from: Pages.home,
                                  offsetHor: offsetHor,
                                  offsetVer: offsetVer,
                                ));
                            break;
                          case 'dataCenter':
                            customPushReplacement(
                                context,
                                DataCentreVideo(
                                  from: Pages.home,
                                  offsetHor: offsetHor,
                                  offsetVer: offsetVer,
                                ));
                            break;
                          case 'fastfoods':
                            customPushReplacement(
                                context,
                                FastFoodVideo(
                                  from: Pages.home,
                                  offsetHor: offsetHor,
                                  offsetVer: offsetVer,
                                ));
                            break;
                          case 'werehouse':
                            customPushReplacement(
                                context,
                                WarehouseVideo(
                                  from: Pages.home,
                                  offsetHor: offsetHor,
                                  offsetVer: offsetVer,
                                ));
                            break;
                          case 'retail':
                            customPushReplacement(
                                context,
                                RetailVideo(
                                  from: Pages.home,
                                  offsetHor: offsetHor,
                                  offsetVer: offsetVer,
                                ));
                            break;
                          default:
                        }
                        setState(() {
                          showNext = false;
                        });
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
                )
              : Container(),
        ],
      ),
    );
  }

  Widget qrButton() {
    var screenSize = MediaQuery.of(context).size;
    return Positioned(
      right: Utils.getRightPadding(screenSize, 0),
      child: Container(
        alignment: Alignment.topRight,
        height:
            screenSize.width * 0.070 * Utils.getMultiplier(screenSize.width),
        width: screenSize.width * 0.070 * Utils.getMultiplier(screenSize.width),
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
            height: screenSize.width *
                0.070 *
                Utils.getMultiplier(screenSize.width),
            width: screenSize.width *
                0.070 *
                Utils.getMultiplier(screenSize.width),
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
      ),
    );
  }

  Widget school() {
    var screenSize = MediaQuery.of(context).size;
    return Positioned(
        left: Utils.getVideoScreenWidth(screenSize) * 0.445,
        top: Utils.getVideoScreenHeight(screenSize) * 0.825,
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

                      setState(() {
                        showNext = true;
                        nextPage = Pages.school;
                      });
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

  Widget schoolMobile(width) {
    var screenSize = MediaQuery.of(context).size;
    return CustomButtonLabelMobile(
      width: width,
      title: "Schools",
      onPressed: () async {
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
          width = screenSize.width * 0.2;
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

              setState(() {
                showNext = true;
                nextPage = Pages.school;
              });
            }
          }
        });
      },
    );
  }

  Widget bank() {
    var screenSize = MediaQuery.of(context).size;
    return Positioned(
        left: Utils.getVideoScreenWidth(screenSize) * 0.615,
        top: Utils.getVideoScreenHeight(screenSize) * 0.75,
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
                        setState(() {
                          showNext = true;
                          nextPage = Pages.bank;
                        });
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

  Widget bankMobile(width) {
    var screenSize = MediaQuery.of(context).size;
    return CustomButtonLabelMobile(
      width: width,
      title: "Banks",
      onPressed: () async {
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
              setState(() {
                showNext = true;
                nextPage = Pages.bank;
              });
            }
          }
        });
      },
    );
  }

  Widget dataCentre() {
    var screenSize = MediaQuery.of(context).size;
    return Positioned(
        left: Utils.getVideoScreenWidth(screenSize) * 0.12,
        top: Utils.getVideoScreenHeight(screenSize) * 0.459,
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
                      setState(() {
                        showNext = true;
                        nextPage = Pages.dataCenter;
                      });
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

  Widget dataCentreMobile(width) {
    var screenSize = MediaQuery.of(context).size;
    return CustomButtonLabelMobile(
      width: width,
      title: "Data Centers",
      onPressed: () async {
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
          final bool isPlaying = _dataCentreVideoController.value.isPlaying;
          print(isPlaying);
          if (isPlaying != _isPlaying) {
            setState(() {
              _isPlaying = isPlaying;
              setIndex(++index);
            });
            if (index > 1) {
              _dataCentreVideoController.removeListener(() {});
              setState(() {
                showNext = true;
                nextPage = Pages.dataCenter;
              });
            }
          }
        });
      },
    );
  }

  Widget warehouse() {
    var screenSize = MediaQuery.of(context).size;
    return Positioned(
        left: Utils.getVideoScreenWidth(screenSize) * 0.269,
        top: Utils.getVideoScreenHeight(screenSize) * 0.22,
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
                      setState(() {
                        showNext = true;
                        nextPage = Pages.werehouse;
                      });
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

  Widget warehouseMobile(width) {
    var screenSize = MediaQuery.of(context).size;
    return CustomButtonLabelMobile(
      width: width,
      title: "Warehouses",
      onPressed: () async {
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
          final bool isPlaying = _warehouseVideoController.value.isPlaying;
          print(isPlaying);
          if (isPlaying != _isPlaying) {
            setState(() {
              _isPlaying = isPlaying;
              setIndex(++index);
            });
            if (index > 1) {
              _warehouseVideoController.removeListener(() {});
              setState(() {
                showNext = true;
                nextPage = Pages.werehouse;
              });
            }
          }
        });
      },
    );
  }

  Widget retail() {
    var screenSize = MediaQuery.of(context).size;
    return Positioned(
        left: Utils.getVideoScreenWidth(screenSize) * 0.62,
        top: Utils.getVideoScreenHeight(screenSize) * 0.13,
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

                      setState(() {
                        showNext = true;
                        nextPage = Pages.retail;
                      });
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

  Widget retailMobile(width) {
    var screenSize = MediaQuery.of(context).size;
    return CustomButtonLabelMobile(
      width: width,
      title: "Retail Stores",
      onPressed: () async {
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

              setState(() {
                showNext = true;
                nextPage = Pages.retail;
              });
            }
          }
        });
      },
    );
  }

  Widget groceryShop() {
    var screenSize = MediaQuery.of(context).size;
    return Positioned(
        left: Utils.getVideoScreenWidth(screenSize) * 0.75,
        top: Utils.getVideoScreenHeight(screenSize) * 0.64,
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
                      setState(() {
                        showNext = true;
                        nextPage = Pages.grocery;
                      });
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

  Widget groceryShopMobile(width) {
    var screenSize = MediaQuery.of(context).size;
    return CustomButtonLabelMobile(
      width: width,
      title: "Grocery Stores",
      onPressed: () async {
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
          final bool isPlaying = _groceryShopVideoController.value.isPlaying;
          print(isPlaying);
          if (isPlaying != _isPlaying) {
            setState(() {
              _isPlaying = isPlaying;
              setIndex(++index);
            });
            if (index > 1) {
              _groceryShopVideoController.removeListener(() {});
              setState(() {
                showNext = true;
                nextPage = Pages.grocery;
              });
            }
          }
        });
      },
    );
  }

  Widget fastFood() {
    var screenSize = MediaQuery.of(context).size;
    return Positioned(
        left: Utils.getVideoScreenWidth(screenSize) * 0.346,
        top: Utils.getVideoScreenHeight(screenSize) * 0.35,
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
                      setState(() {
                        showNext = true;
                        nextPage = Pages.fastfoods;
                      });
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

  Widget fastFoodMobile(width) {
    var screenSize = MediaQuery.of(context).size;
    return CustomButtonLabelMobile(
      width: width,
      title: "Quick Serve Resturants",
      onPressed: () async {
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
          final bool isPlaying = _fastFoodVideoController.value.isPlaying;
          print(isPlaying);
          if (isPlaying != _isPlaying) {
            setState(() {
              _isPlaying = isPlaying;
              setIndex(++index);
            });
            if (index > 1) {
              _fastFoodVideoController.removeListener(() {});
              setState(() {
                showNext = true;
                nextPage = Pages.fastfoods;
              });
            }
          }
        });
      },
    );
  }
}
