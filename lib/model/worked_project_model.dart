import 'dart:ui';
import 'package:portfolio_website/constants/url_constants.dart';

class WorkedProject {
  final int id;
  final String image;
  final String projectName;
  final String projectSubTitle;
  final String appIconImageName;
  final String iosIcon;
  final String androidIcon;
  final String githubIcon;
  final Size appIconSize;
  final Color appIconBackgroundColor;
  final LaunchAppsProjectURL? iosAppLink;
  final LaunchAppsProjectURL? androidAppLink;
  final LaunchAppsProjectURL? githubProjectLink;

  WorkedProject({
    required this.id,
    required this.image,
    required this.projectName,
    required this.projectSubTitle,
    required this.appIconImageName,
    required this.iosIcon,
    required this.androidIcon,
    required this.githubIcon,
    required this.appIconSize,
    required this.appIconBackgroundColor,
    required this.iosAppLink,
    required this.androidAppLink,
    required this.githubProjectLink,
  });
}
