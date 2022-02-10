import 'package:flutter/material.dart';
import 'package:interactive_map/main_buildings/bank.dart';
import 'package:interactive_map/main_buildings/datacentre.dart';
import 'package:interactive_map/main_buildings/fastfood.dart';
import 'package:interactive_map/main_buildings/groceryshop.dart';
import 'package:interactive_map/main_buildings/retail.dart';
import 'package:interactive_map/main_buildings/school.dart';
import 'package:interactive_map/main_buildings/warehouse.dart';
import 'package:interactive_map/widgets/shared_widgets.dart';
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

  final String timerVideoUrl = 'assets/videos/Buildings_menu_looping_v001.mp4';

  final String bankVideoUrl = 'assets/videos/bank_v001.mp4';
  final String dataCentreVideoUrl = 'assets/videos/datacentre_v001.mp4';
  final String schoolVideoUrl = 'assets/videos/school_v001.mp4';
  final String retailVideoUrl = 'assets/videos/retail_v001.mp4';
  final String warehouseVideoUrl = 'assets/videos/warehouse_v001.mp4';
  final String groceryShopVideoUrl = 'assets/videos/groceryshop_v001.mp4';
  final String fastFoodVideoUrl = 'assets/videos/fastfood_v001.mp4';

  final String buildingImage = 'assets/images/buildings.jpg';

  bool timerOFF = false;

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
            Align(
              alignment: Alignment.topCenter,
              child: AspectRatio(
                aspectRatio: _timerVideoController.value.aspectRatio,
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
                    child: Expanded(
                      child: Image.asset(
                        buildingImage,
                        fit: BoxFit.fill,
                      ),
                    ),
                  )
                : Container(),
            // Container(
            //   color: Colors.red[100],
            //   child: Column(
            //     mainAxisSize: MainAxisSize.max,
            //     mainAxisAlignment: MainAxisAlignment.center,
            //     crossAxisAlignment: CrossAxisAlignment.start,
            //     children: [
            //       // CustomPaint(
            //       //   size: Size(screenSize.width * 0.35,
            //       //       400), //You can Replace [WIDTH] with your desired width for Custom Paint and height will be calculated automatically
            //       //   painter: SqureShapedCustomContainer(),
            //       //   child: Container(
            //       //     color: Colors.red[400],
            //       //     width: screenSize.width * 0.35,
            //       //     child: Column(
            //       //       mainAxisSize: MainAxisSize.max,
            //       //       mainAxisAlignment: MainAxisAlignment.center,
            //       //       crossAxisAlignment: CrossAxisAlignment.start,
            //       //       children: [
            //       //         // CustomContainerTextRow(
            //       //         //   screenSize: screenSize,
            //       //         //   text: '',
            //       //         // ),
            //       //       ],
            //       //     ),
            //       //   ),
            //       // ),
            //     ],
            //   ),
            // ),
          ],
        ),
      ),
    );
  }

  Widget bank() {
    var screenSize = MediaQuery.of(context).size;
    return Positioned(
        left: screenSize.width * (0.545),
        top: screenSize.width * (0.401),
        width: 100,
        child: Stack(
          children: [
            Center(
              child: ElevatedButton(
                onPressed: () async {
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
                child: const Icon(Icons.circle, size: 8, color: Colors.red),
                style: ButtonStyle(
                  shape: MaterialStateProperty.all(const CircleBorder()),
                  padding: MaterialStateProperty.all(const EdgeInsets.all(5)),
                  backgroundColor: MaterialStateProperty.all(
                      Colors.transparent), // <-- Button color
                  overlayColor:
                      MaterialStateProperty.resolveWith<Color?>((states) {
                    if (states.contains(MaterialState.pressed))
                      return Colors.red; // <-- Splash color
                  }),
                ),
              ),
            ),
            const Positioned(
              left: 60,
              top: 7,
              child: Text('Bank'),
            ),
          ],
        ));
  }

  Widget dataCentre() {
    var screenSize = MediaQuery.of(context).size;
    return Positioned(
        left: screenSize.width * (0.092),
        top: screenSize.width * (0.238),
        width: 150,
        child: Stack(
          children: [
            ElevatedButton(
              onPressed: () async {
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
              child: const Icon(Icons.circle, size: 8, color: Colors.red),
              style: ButtonStyle(
                shape: MaterialStateProperty.all(const CircleBorder()),
                padding: MaterialStateProperty.all(const EdgeInsets.all(5)),
                backgroundColor: MaterialStateProperty.all(
                    Colors.transparent), // <-- Button color
                overlayColor:
                    MaterialStateProperty.resolveWith<Color?>((states) {
                  if (states.contains(MaterialState.pressed))
                    return Colors.red; // <-- Splash color
                }),
              ),
            ),
            const Positioned(
              left: 40,
              top: 7,
              child: Text('Data Centre'),
            ),
          ],
        ));
  }

  Widget warehouse() {
    var screenSize = MediaQuery.of(context).size;
    return Positioned(
        left: screenSize.width * (0.248),
        top: screenSize.width * (0.151),
        width: 120,
        child: Stack(
          children: [
            ElevatedButton(
              onPressed: () async {
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
              child: const Icon(Icons.circle, size: 8, color: Colors.red),
              style: ButtonStyle(
                shape: MaterialStateProperty.all(const CircleBorder()),
                padding: MaterialStateProperty.all(const EdgeInsets.all(5)),
                backgroundColor: MaterialStateProperty.all(
                    Colors.transparent), // <-- Button color
                overlayColor:
                    MaterialStateProperty.resolveWith<Color?>((states) {
                  if (states.contains(MaterialState.pressed))
                    return Colors.red; // <-- Splash color
                }),
              ),
            ),
            const Positioned(
              left: 40,
              top: 7,
              child: Text('Warehouse'),
            ),
          ],
        ));
  }

  Widget school() {
    var screenSize = MediaQuery.of(context).size;
    return Positioned(
        left: screenSize.width * (0.445),
        top: screenSize.width * (0.411),
        width: 120,
        child: Stack(
          children: [
            ElevatedButton(
              onPressed: () async {
                setShow();
                setState(() {
                  timerOFF = true;
                });

                _timerVideoController.pause();

                setState(() {
                  _schoolVideoPlaying = true;
                });
                _schoolVideoController.play();

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
              child: const Icon(Icons.circle, size: 8, color: Colors.red),
              style: ButtonStyle(
                shape: MaterialStateProperty.all(const CircleBorder()),
                padding: MaterialStateProperty.all(const EdgeInsets.all(5)),
                backgroundColor: MaterialStateProperty.all(
                    Colors.transparent), // <-- Button color
                overlayColor:
                    MaterialStateProperty.resolveWith<Color?>((states) {
                  if (states.contains(MaterialState.pressed))
                    return Colors.red; // <-- Splash color
                }),
              ),
            ),
            const Positioned(
              left: 40,
              top: 7,
              child: Text('School'),
            ),
          ],
        ));
  }

  Widget retail() {
    var screenSize = MediaQuery.of(context).size;
    return Positioned(
        left: screenSize.width * (0.612),
        top: screenSize.width * (0.052),
        width: 130,
        child: Stack(
          children: [
            ElevatedButton(
              onPressed: () async {
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
              child: const Icon(Icons.circle, size: 8, color: Colors.red),
              style: ButtonStyle(
                shape: MaterialStateProperty.all(const CircleBorder()),
                padding: MaterialStateProperty.all(const EdgeInsets.all(5)),
                backgroundColor: MaterialStateProperty.all(
                    Colors.transparent), // <-- Button color
                overlayColor:
                    MaterialStateProperty.resolveWith<Color?>((states) {
                  if (states.contains(MaterialState.pressed))
                    return Colors.red; // <-- Splash color
                }),
              ),
            ),
            const Positioned(
              left: 40,
              top: 7,
              child: Text('Retail'),
            ),
          ],
        ));
  }

  Widget groceryShop() {
    var screenSize = MediaQuery.of(context).size;
    return Positioned(
        left: screenSize.width * (0.728),
        top: screenSize.width * (0.345),
        width: 150,
        child: Stack(
          children: [
            ElevatedButton(
              onPressed: () async {
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
              child: const Icon(Icons.circle, size: 8, color: Colors.red),
              style: ButtonStyle(
                shape: MaterialStateProperty.all(const CircleBorder()),
                padding: MaterialStateProperty.all(const EdgeInsets.all(5)),
                backgroundColor: MaterialStateProperty.all(
                    Colors.transparent), // <-- Button color
                overlayColor:
                    MaterialStateProperty.resolveWith<Color?>((states) {
                  if (states.contains(MaterialState.pressed))
                    return Colors.red; // <-- Splash color
                }),
              ),
            ),
            const Positioned(
              left: 40,
              top: 7,
              child: Text('Grocery Shop'),
            ),
          ],
        ));
  }

  Widget fastFood() {
    var screenSize = MediaQuery.of(context).size;
    return Positioned(
        left: screenSize.width * (0.312),
        top: screenSize.width * (0.201),
        width: 120,
        child: Stack(
          children: [
            ElevatedButton(
              onPressed: () async {
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
              child: const Icon(Icons.circle, size: 8, color: Colors.red),
              style: ButtonStyle(
                shape: MaterialStateProperty.all(const CircleBorder()),
                padding: MaterialStateProperty.all(const EdgeInsets.all(5)),
                backgroundColor: MaterialStateProperty.all(
                    Colors.transparent), // <-- Button color
                overlayColor:
                    MaterialStateProperty.resolveWith<Color?>((states) {
                  if (states.contains(MaterialState.pressed))
                    return Colors.red; // <-- Splash color
                }),
              ),
            ),
            const Positioned(
              left: 40,
              top: 7,
              child: Text('Fast Food'),
            ),
          ],
        ));
  }
}
