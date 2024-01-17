import 'package:portfolio_website/constants/url_constants.dart';

class IndividualProject {
  final int id;
  final String image;
  final String projectName;
  final String projectSubTitle;
  final String iosIcon;
  final LaunchAppsProjectURL? iosAppLink;
  final String androidIcon;
  final LaunchAppsProjectURL? androidAppLink;
  final String githubIcon;
  final LaunchAppsProjectURL? githubProjectLink;
  final List<String> listofScreenshot;
  final String aboutTheProject;
  final String techStack;

  IndividualProject({
    required this.id,
    required this.image,
    required this.projectName,
    required this.projectSubTitle,
    required this.iosIcon,
    required this.iosAppLink,
    required this.androidIcon,
    required this.androidAppLink,
    required this.githubIcon,
    required this.githubProjectLink,
    required this.listofScreenshot,
    required this.aboutTheProject,
    required this.techStack,
  });
}
