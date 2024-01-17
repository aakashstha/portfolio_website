import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:portfolio_website/constants/url_constants.dart';
import 'package:portfolio_website/controller/homepage_controller.dart';

final HomepageController homepageController = Get.put(HomepageController());

Padding buildSVGHeaderSocial(
  String path, {
  double rightPadding = 0,
  double? svgIconSize,
  LaunchSocialURL? launchURLType,
  required int index,
}) {
  return Padding(
    padding: EdgeInsets.only(right: rightPadding),
    child: Obx(
      () => AnimatedScale(
        scale: homepageController.headerSocialScale[index],
        duration: const Duration(milliseconds: 500),
        child: InkWell(
          onHover: (isHovering) {
            if (isHovering) {
              homepageController.headerSocialScale[index] = 1.4;
            } else {
              homepageController.headerSocialScale[index] = 1.0;
            }
          },
          onTap: launchURLType == null
              ? null
              : () {
                  launchSocailUrl(launchURLType);
                },
          child: SvgPicture.asset(
            path,
            width: svgIconSize,
            height: svgIconSize,
          ),
        ),
      ),
    ),
  );
}

Padding buildProjectIconSVG(
  String path, {
  double rightPadding = 0,
  double? svgIconSize,
  LaunchAppsProjectURL? launchURLType,
  required int projectIndex,
  required int iconIndex,
}) {
  return Padding(
    padding: EdgeInsets.only(right: rightPadding),
    child: Obx(
      () => AnimatedScale(
        scale: homepageController.insideProjectsIconScale[projectIndex]
            [iconIndex],
        duration: const Duration(milliseconds: 500),
        child: InkWell(
          // onHover: (isHovering) {
          //   if (isHovering) {
          //     homepageController.insideProjectsIconScale[projectIndex]
          //         [iconIndex] = 2;
          //   } else {
          //     homepageController.insideProjectsIconScale[projectIndex]
          //         [iconIndex] = 1.0;
          //   }
          // },
          onTap: launchURLType == null
              ? null
              : () {
                  launchAppsProjectUrl(launchURLType);
                },
          child: SvgPicture.asset(
            path,
            width: svgIconSize,
            height: svgIconSize,
          ),
        ),
      ),
    ),
  );
}

Padding buildSVG(
  String path, {
  double rightPadding = 0,
  double? svgIconSize,
  LaunchAppsProjectURL? launchURLType,
  int? projectIndex,
  int? iconIndex,
}) {
  return Padding(
    padding: EdgeInsets.only(right: rightPadding),
    child: InkWell(
      onTap: launchURLType == null
          ? null
          : () {
              launchAppsProjectUrl(launchURLType);
            },
      child: SvgPicture.asset(
        path,
        width: svgIconSize,
        height: svgIconSize,
      ),
    ),
  );
}
