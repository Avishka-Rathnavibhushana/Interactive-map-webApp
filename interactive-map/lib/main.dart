import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:interactive_map/controller/appBind.dart';
import 'package:interactive_map/screens/home.dart';
import 'package:interactive_map/screens/main_buildings/buildings_home.dart';

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
      title: 'Turntide App',
      initialBinding: AppBinding(),
      scrollBehavior: MyCustomScrollBehavior(),
      home: const Home(),
    );
  }
}

class MyCustomScrollBehavior extends MaterialScrollBehavior {
  // Override behavior methods and getters like dragDevices
  @override
  Set<PointerDeviceKind> get dragDevices => {
        PointerDeviceKind.touch,
        PointerDeviceKind.mouse,
      };
}
