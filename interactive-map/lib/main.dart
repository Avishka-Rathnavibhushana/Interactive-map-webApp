import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:interactive_map/controller/appBind.dart';
import 'package:interactive_map/main_buildings/home.dart';
import 'package:interactive_map/main_buildings/inside_school/school_main_screens.dart';
import 'package:interactive_map/main_buildings/inside_school/screen_left.dart';
import 'package:interactive_map/main_buildings/inside_school/screen_right.dart';

Future main() async {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(const InteractiveMap());
}

class InteractiveMap extends StatefulWidget {
  const InteractiveMap({Key? key}) : super(key: key);

  @override
  _InteractiveMapState createState() => _InteractiveMapState();
}

class _InteractiveMapState extends State<InteractiveMap> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Video app',
      initialBinding: AppBinding(),
      home: const HomeVideo(),
    );
  }
}
