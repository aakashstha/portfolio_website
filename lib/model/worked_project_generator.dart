import 'package:flutter/material.dart';
import 'package:portfolio_website/constants/color_constants.dart';
import 'package:portfolio_website/constants/image_constants.dart';
import 'package:portfolio_website/constants/url_constants.dart';
import 'package:portfolio_website/model/worked_project_model.dart';

class WorkedProjectGenerator {
  static int workedProjectLength = generateWorkedProject().length;
  static List<WorkedProject> generateWorkedProject() {
    return [
      WorkedProject(
        id: 1,
        image: ImageConstant.imgAppIconPerr,
        projectName: "Perr",
        projectSubTitle: "Flutter | Firebase",
        iosIcon: ImageConstant.svgIos,
        androidIcon: ImageConstant.svgAndroid,
        githubIcon: ImageConstant.svgGithub,
        appIconSize: const Size(290, 132),
        appIconBackgroundColor: AppColors.white,
        iosAppLink: LaunchAppsProjectURL.iosLinkPerr,
        androidAppLink: LaunchAppsProjectURL.androidLinkPerr,
        githubProjectLink: null,
      ),
      WorkedProject(
        id: 2,
        image: ImageConstant.imgAppIconTechnicalTalent,
        projectName: "Technical Talent",
        projectSubTitle: "Flutter | Firebase",
        iosIcon: ImageConstant.svgIos,
        androidIcon: ImageConstant.svgAndroid,
        githubIcon: ImageConstant.svgGithub,
        appIconSize: const Size(160, 132),
        appIconBackgroundColor: const Color(0xFF0F67FF),
        iosAppLink: LaunchAppsProjectURL.iosLinkTechnicalTalent,
        androidAppLink: LaunchAppsProjectURL.androidLinkTechnicalTalent,
        githubProjectLink: null,
      ),
      WorkedProject(
        id: 3,
        image: ImageConstant.imgAppIconRayy,
        projectName: "Rayy",
        projectSubTitle: "Flutter | Firebase",
        iosIcon: ImageConstant.svgIos,
        androidIcon: ImageConstant.svgAndroid,
        githubIcon: ImageConstant.svgGithub,
        appIconSize: const Size(180, 132),
        appIconBackgroundColor: const Color(0xFF9FFFF8),
        iosAppLink: null,
        androidAppLink: null,
        githubProjectLink: null,
      ),
      WorkedProject(
        id: 4,
        image: ImageConstant.imgAppIconXchange,
        projectName: "Xchange",
        projectSubTitle: "Flutter | Node.js | Flask",
        iosIcon: ImageConstant.svgIos,
        androidIcon: ImageConstant.svgAndroid,
        githubIcon: ImageConstant.svgGithub,
        appIconSize: const Size(215, 132),
        appIconBackgroundColor: AppColors.white,
        iosAppLink: LaunchAppsProjectURL.iosLinkXchange,
        androidAppLink: LaunchAppsProjectURL.androidLinkXchange,
        githubProjectLink: LaunchAppsProjectURL.githubLinkXchange,
      ),
      WorkedProject(
        id: 5,
        image: ImageConstant.imgAppIconHamroBank,
        projectName: "Hamro Bank",
        projectSubTitle: "Flutter",
        iosIcon: ImageConstant.svgIos,
        androidIcon: ImageConstant.svgAndroid,
        githubIcon: ImageConstant.svgGithub,
        appIconSize: const Size(217, 132),
        appIconBackgroundColor: AppColors.white,
        iosAppLink: null,
        androidAppLink: null,
        githubProjectLink: LaunchAppsProjectURL.githubLinkHamroBank,
      ),
    ];
  }
}
