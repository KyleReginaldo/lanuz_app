import 'package:flutter/material.dart';
import 'package:general/widgets/text.dart';
import '../../../core/theme/color.dart';

import '../helper/helper_widget.dart';

class ModalBuilder extends StatelessWidget {
  final String calamity;
  final String description;
  final String alertDesc;
  final String guideline1;
  final String image1;
  final String guideline2;
  final String image2;
  final String guideline3;
  final String image3;
  const ModalBuilder(
      {super.key,
      required this.calamity,
      required this.description,
      required this.alertDesc,
      required this.guideline1,
      required this.image1,
      required this.guideline2,
      required this.image2,
      required this.guideline3,
      required this.image3});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 680,
      decoration: const BoxDecoration(
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(60),
          topRight: Radius.circular(60),
        ),
        gradient: LinearGradient(
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
          colors: [
            PRIMARY_COLOR,
            PRIMARY_COLOR,
            TERTIARY_COLOR,
          ],
        ),
      ),
      padding: const EdgeInsets.all(12),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Align(
                alignment: Alignment.center,
                child: CustomText(
                  calamity,
                  size: 20,
                  weight: FontWeight.w600,
                  color: Colors.white,
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(12),
                child: CustomText(
                  color: Colors.white,
                  description,
                ),
              ),
              verticalSpace(50),
              Padding(
                padding: const EdgeInsets.all(12),
                child: CustomText(
                  color: Colors.white,
                  alertDesc,
                ),
              ),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              CustomText(
                guideline1,
                color: Colors.white,
              ),
              Image.asset(image1)
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Image.asset(image2),
              CustomText(
                guideline2,
                color: Colors.white,
              )
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              CustomText(
                guideline3,
                color: Colors.white,
              ),
              Image.asset(image3)
            ],
          ),
        ],
      ),
    );
  }
}
