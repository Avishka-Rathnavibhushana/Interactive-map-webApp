import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:interactive_map/controller/controller.dart';
import 'package:interactive_map/utills/utils.dart';

class FullScreenButton extends StatelessWidget {
  const FullScreenButton({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Obx(
      () => Get.find<Controller>().isFullScreen.value
          ? Container()
          : Align(
      alignment: Alignment.bottomLeft,
              child: GestureDetector(
                onTap: () {
                  Utils.enterFullScreenMode();
                  Get.find<Controller>().isFullScreen.value =
                      !Get.find<Controller>().isFullScreen.value;
                },
                child: Padding(
                  padding: const EdgeInsets.only(
                    left: 10,
                    bottom: 10,
                  ),
                  child: Container(
                    width: 50,
                    height: 50,
                    decoration: BoxDecoration(
                      color: Colors.black.withOpacity(0.7),
                      shape: BoxShape.circle,
                    ),
                    child: Center(
                      child: Icon(
                        Icons.fullscreen_sharp,
                        color: Colors.white,
                      ),
                    ),
                  ),
                ),
              ),
            ),
    );
  }
}
