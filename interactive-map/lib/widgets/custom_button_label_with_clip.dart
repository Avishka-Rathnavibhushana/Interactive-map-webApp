import 'package:flutter/material.dart';
import 'package:interactive_map/constants/constants.dart';
import 'package:interactive_map/widgets/squre_shaped_custom_container.dart';
import 'package:interactive_map/widgets/squre_shaped_custom_container_2.dart';

class CustomButtonLabelWithClip extends StatelessWidget {
  CustomButtonLabelWithClip({
    Key? key,
    required this.screenSize,
    required this.text,
    required this.type,
  }) : super(key: key);

  final Size screenSize;
  final String text;
  final int type;

  final List<String> prefixIcons = [
    'assets/graphics/Hot_Spot_plain.png',
    'assets/graphics/Hot_Spot_1.png',
    'assets/graphics/Hot_Spot_2.png',
    'assets/graphics/Hot_Spot_3.png'
  ];

  @override
  Widget build(BuildContext context) {
    return Container(
      height: screenSize.width * 0.04,
      child: Column(
        mainAxisSize: MainAxisSize.max,
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            height: screenSize.width * 0.04,
            child: Stack(
              fit: StackFit.loose,
              children: [
                Align(
                  alignment: Alignment.centerLeft,
                  child: Container(
                    margin: EdgeInsets.only(
                      left: screenSize.width * 0.04 / 2,
                    ),
                    child: CustomPaint(
                      //size: Size(700, 700),
                      painter: SqureShapedCustomContainer2(),
                      child: Container(
                        height:
                            screenSize.width * 0.04 - screenSize.width * 0.02,
                        padding: EdgeInsets.only(
                          left: screenSize.width * 0.04 / 2 + 10,
                          right: 35,
                        ),
                        child: Center(
                          child: FittedBox(
                            child: Padding(
                              padding: const EdgeInsets.symmetric(vertical: 5),
                              child: Text(
                                text,
                                style: const TextStyle(
                                  color: AppColors.white,
                                  fontSize: 25,
                                ),
                                maxLines: 1,
                                softWrap: true,
                                overflow: TextOverflow.ellipsis,
                                textAlign: TextAlign.center,
                              ),
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
                Container(
                  width: screenSize.width * 0.04,
                  height: screenSize.width * 0.04,
                  decoration: BoxDecoration(
                    image: DecorationImage(
                      image: AssetImage(prefixIcons[type]),
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
