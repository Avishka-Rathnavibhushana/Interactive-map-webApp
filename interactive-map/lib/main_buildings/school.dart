import 'package:flutter/material.dart';
import 'package:interactive_map/main_buildings/home.dart';
import 'package:interactive_map/main_buildings/inside_school/motor.dart';
import 'package:interactive_map/main_buildings/inside_school/school_main_screens.dart';
import 'package:interactive_map/main_buildings/inside_school/temporary.dart';
import 'package:interactive_map/widgets/shared_widgets.dart';
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
  late VideoPlayerController _temporaryVideoController;
  bool _temporaryVideoPlaying = false;
  late VideoPlayerController _insideVideoController;
  bool _insideVideoPlaying = false;

  int index = 0;
  bool show = false;
  bool _isPlaying = false;

  final String url = 'assets/videos/school_REV_v001.mp4';

  final String motorVideoImage = 'assets/videos/school_MOTOR.mp4';
  final String temporaryVideoImage = 'assets/videos/datacentre_v001.mp4';
  final String insideVideoImage = 'assets/videos/school_MAP_v003.mp4';

  final String schoolImage = 'assets/images/school.jpg';

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
    show = true;

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
    _temporaryVideoController = VideoPlayerController.asset(temporaryVideoImage)
      ..initialize().then((_) => {
            setState(() {
              _temporaryVideoController.setVolume(0);
              _temporaryVideoController.setLooping(false);
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
    _temporaryVideoController.dispose();
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
            show ? temporary() : Container(),
            show ? screenMan2() : Container(),
            show ? menuButton() : Container(),
            show ? backButton() : Container(),
            _motorVideoPlaying
                ? AspectRatio(
                    aspectRatio: _motorVideoController.value.aspectRatio,
                    child: VideoPlayer(_motorVideoController),
                  )
                : Container(),
            _temporaryVideoPlaying
                ? AspectRatio(
                    aspectRatio: _temporaryVideoController.value.aspectRatio,
                    child: VideoPlayer(_temporaryVideoController),
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
                    child: Expanded(
                      child: Image.asset(
                        schoolImage,
                        fit: BoxFit.fill,
                      ),
                    ),
                  )
                : Container()
          ],
        ),
      ),
    );
  }

  Widget backButton() {
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
            decoration: BoxDecoration(
              boxShadow: [
                BoxShadow(
                  color: Colors.grey.withOpacity(0.5),
                  spreadRadius: 5,
                  blurRadius: 7,
                  offset: const Offset(0, 3), // changes position of shadow
                ),
              ],
              image: const DecorationImage(
                image: AssetImage('assets/graphics/back.png'),
                fit: BoxFit.cover,
              ),
            ),
          ),
        ),
      ),
    );
  }

  Widget menuButton() {
    var screenSize = MediaQuery.of(context).size;
    return SizedBox(
      height: screenSize.height * 0.95,
      child: Align(
        alignment: Alignment.topLeft,
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
            decoration: BoxDecoration(
              boxShadow: [
                BoxShadow(
                  color: Colors.grey.withOpacity(0.5),
                  spreadRadius: 5,
                  blurRadius: 7,
                  offset: const Offset(0, 3), // changes position of shadow
                ),
              ],
              image: const DecorationImage(
                image: AssetImage('assets/graphics/Home.png'),
                fit: BoxFit.cover,
              ),
            ),
          ),
        ),
      ),
    );
  }

  Widget motor() {
    var screenSize = MediaQuery.of(context).size;
    return Positioned(
        left: screenSize.width * (0.092),
        top: screenSize.width * (0.138),
        width: 150,
        child: Stack(
          children: [
            ElevatedButton(
              onPressed: () async {
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
              child: Container(
                width: screenSize.width * 0.058,
                height: screenSize.width * 0.058,
                decoration: const BoxDecoration(
                  image: DecorationImage(
                    image: AssetImage('assets/graphics/POINT_1.png'),
                    fit: BoxFit.cover,
                  ),
                ),
              ),
              style: ButtonStyle(
                shape: MaterialStateProperty.all(const CircleBorder()),
                padding: MaterialStateProperty.all(const EdgeInsets.all(0.4)),
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
              left: 48,
              top: 10,
              child: Text('Motor'),
            ),
          ],
        ));
  }

  Widget temporary() {
    var screenSize = MediaQuery.of(context).size;
    return Positioned(
        left: screenSize.width * (0.792),
        top: screenSize.width * (0.155),
        width: 150,
        child: Stack(
          children: [
            ElevatedButton(
              onPressed: () async {
                setShow();
                setState(() {
                  _temporaryVideoPlaying = true;
                });
                _temporaryVideoController.play();

                _temporaryVideoController.addListener(() {
                  final bool isPlaying =
                      _temporaryVideoController.value.isPlaying;
                  print(isPlaying);
                  if (isPlaying != _isPlaying) {
                    setState(() {
                      _isPlaying = isPlaying;
                      setIndex(++index);
                    });
                    if (index > 1) {
                      _temporaryVideoController.removeListener(() {});

                      customPushReplacement(context, const Temporary());
                    }
                  }
                });
              },
              child: Container(
                width: screenSize.width * 0.058,
                height: screenSize.width * 0.058,
                decoration: const BoxDecoration(
                  image: DecorationImage(
                    image: AssetImage('assets/graphics/POINT_2.png'),
                    fit: BoxFit.cover,
                  ),
                ),
              ),
              style: ButtonStyle(
                shape: MaterialStateProperty.all(const CircleBorder()),
                padding: MaterialStateProperty.all(const EdgeInsets.all(0.4)),
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
              left: 48,
              top: 10,
              child: Text('Temporary'),
            ),
          ],
        ));
  }

  Widget screenMan2() {
    var screenSize = MediaQuery.of(context).size;
    return Positioned(
        left: screenSize.width * (0.342),
        top: screenSize.width * (0.428),
        width: 150,
        child: Stack(
          children: [
            ElevatedButton(
              onPressed: () async {
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
                      _insideVideoController.removeListener(() {});

                      customPushReplacement(context, const SchoolMainScreens());
                    }
                  }
                });
              },
              child: Container(
                width: screenSize.width * 0.058,
                height: screenSize.width * 0.058,
                decoration: const BoxDecoration(
                  image: DecorationImage(
                    image: AssetImage('assets/graphics/POINT_3.png'),
                    fit: BoxFit.cover,
                  ),
                ),
              ),
              style: ButtonStyle(
                shape: MaterialStateProperty.all(const CircleBorder()),
                padding: MaterialStateProperty.all(const EdgeInsets.all(0.4)),
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
              left: 48,
              top: 10,
              child: Text('Inside'),
            ),
          ],
        ));
  }
}
