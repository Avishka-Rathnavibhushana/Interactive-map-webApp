import 'package:flick_video_player/flick_video_player.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:interactive_map/controller/appBind.dart';
import 'package:interactive_map/main_buildings/home.dart';
import 'package:video_player/video_player.dart';
import 'package:chewie/chewie.dart';

Future main() async {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(InteractiveMap());
}

class InteractiveMap extends StatefulWidget {
  @override
  _InteractiveMapState createState() => _InteractiveMapState();
}

class _InteractiveMapState extends State<InteractiveMap> {
  bool home = true;

  final String url = 'assets/videos/bank_v001.mp4';
  late VideoPlayerController _controller = VideoPlayerController.asset(url);
  bool frontPlaying = true;
  final String backUrl = 'assets/videos/bank_REV_v001.mp4';
  late VideoPlayerController _backcontroller = VideoPlayerController.asset(url);
  bool backPlaying = false;
  late ChewieController _chewieController;

  @override
  void initState() {
    super.initState();
    addControllers();
  }

  Future<void> addControllers() async {
    _controller = VideoPlayerController.asset(url);
    await Future.wait([
      _controller.initialize(),
    ]);

    _backcontroller = VideoPlayerController.asset(backUrl);
    await Future.wait([
      _backcontroller.initialize(),
    ]);
  }

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'Video app',
      initialBinding: AppBinding(),
      home: HomeVideo(),
    );
  }
}
