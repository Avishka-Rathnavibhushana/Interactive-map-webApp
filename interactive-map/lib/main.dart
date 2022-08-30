import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:interactive_map/controller/appBind.dart';
import 'package:interactive_map/controller/controller.dart';
import 'package:interactive_map/screens/home.dart';

Future main() async {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(const InteractiveMap());
  window.onKeyData = (final keyData) {
    if (keyData.logical == LogicalKeyboardKey.escape.keyId) {
      // if (isfullscreen) {
      //   isfullscreen = false;
      // }
      if (Get.find<Controller>().isFullScreen.value) {
        Get.find<Controller>().isFullScreen.value =
            !Get.find<Controller>().isFullScreen.value;
      }

      return true;
    }

    /// Let event pass to other focuses if it is not the key we looking for
    return false;
  };
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
