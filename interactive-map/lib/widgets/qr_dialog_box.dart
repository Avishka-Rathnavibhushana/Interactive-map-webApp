import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:interactive_map/controller/controller.dart';

class QRDialogBox extends StatelessWidget {
  const QRDialogBox({
    Key? key,
    required this.asset,
  }) : super(key: key);

  final String asset;

  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: Alignment.center,
      children: [
        GestureDetector(
          onTap: () {
            Get.find<Controller>().showQR.value =
                !Get.find<Controller>().showQR.value;
          },
          child: Container(
            color: Colors.black45,
          ),
        ),
        Container(
          width: 200,
          height: 200,
          decoration: BoxDecoration(
            image: DecorationImage(
              image: AssetImage(asset),
            ),
          ),
        ),
      ],
    );
  }
}
