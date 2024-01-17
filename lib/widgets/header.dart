import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:portfolio_website/constants/url_constants.dart';
import 'package:portfolio_website/constants/image_constants.dart';
import 'package:portfolio_website/routes/app_routes.dart';
import 'package:portfolio_website/widgets/build_svg.dart';
import 'package:portfolio_website/widgets/custom_text.dart';

Widget buildHeader() {
  return Column(
    children: [
      InkWell(
        onTap: () {
          Get.offAllNamed(AppRoutes.initialRoute);
        },
        child: Column(
          children: [
            customText(
              "Aakash Shrestha",
              fontSize: 30,
              textDecoration: TextDecoration.underline,
            ),
            customText(
              "Full-Stack Mobile Developer for iOS and Android",
              fontSize: 18,
            ),
          ],
        ),
      ),

      // Finde Me
      const SizedBox(height: 20),
      Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          buildSVGHeaderSocial(
            ImageConstant.svgTwitter,
            rightPadding: 20,
            launchURLType: LaunchSocialURL.twitter,
            index: 0,
          ),
          buildSVGHeaderSocial(
            ImageConstant.svgLinkedin,
            rightPadding: 20,
            launchURLType: LaunchSocialURL.linkedin,
            index: 1,
          ),
          buildSVGHeaderSocial(
            ImageConstant.svgGithub,
            rightPadding: 20,
            launchURLType: LaunchSocialURL.github,
            index: 2,
          ),
          buildSVGHeaderSocial(
            ImageConstant.svgMedium,
            rightPadding: 20,
            launchURLType: LaunchSocialURL.medium,
            index: 3,
          ),
        ],
      ),
    ],
  );
}
