import 'package:url_launcher/url_launcher.dart';

class AllURLs {
  // Social Links
  static const String myTwitter = 'https://twitter.com/aakash_shtha';
  static const String myLinkedin =
      'https://www.linkedin.com/in/aakash-shrestha-336817a6/';
  static const String myGithub = 'https://github.com/aakashstha';
  static const String myMedium = 'https://medium.com/@aakashstha';

  // Apps and Project Links
  static const String iosLinkPerr =
      'https://apps.apple.com/np/app/perr/id1664666597';
  static const String androidLinkPerr =
      'https://play.google.com/store/apps/details?id=com.peers.app';

  static const String iosLinkTechnicalTalent =
      'https://apps.apple.com/us/app/technical-talent/id6463626084';
  static const String androidLinkTechnicalTalent =
      'https://play.google.com/store/apps/details?id=com.technicaltalent.appaus';

  static const String githubLinkHamroBank =
      'https://github.com/aakashstha/Bank-Application';

  static const String iosLinkXchange =
      'https://apps.apple.com/us/app/xchange/id1355283480?ls=1';
  static const String androidLinkXchange =
      'https://play.google.com/store/apps/details?id=com.xchange.appnp';
  static const String githubLinkXchange =
      'https://github.com/aakashstha/Xchange_Frontend';
}

enum LaunchSocialURL { twitter, linkedin, github, medium }

Future<void> launchSocailUrl(LaunchSocialURL launchURLType) async {
  switch (launchURLType) {
    case LaunchSocialURL.twitter:
      final Uri url = Uri.parse(AllURLs.myTwitter);
      launchUrl(url);
      break;

    case LaunchSocialURL.linkedin:
      final Uri url = Uri.parse(AllURLs.myLinkedin);
      launchUrl(url);
      break;

    case LaunchSocialURL.github:
      final Uri url = Uri.parse(AllURLs.myGithub);
      launchUrl(url);
      break;

    case LaunchSocialURL.medium:
      final Uri url = Uri.parse(AllURLs.myMedium);
      launchUrl(url);
      break;

    default:
      print('Unknown URL');
  }
}

enum LaunchAppsProjectURL {
  iosLinkPerr,
  androidLinkPerr,
  iosLinkTechnicalTalent,
  androidLinkTechnicalTalent,
  githubLinkHamroBank,
  iosLinkXchange,
  androidLinkXchange,
  githubLinkXchange
}

Future<void> launchAppsProjectUrl(LaunchAppsProjectURL launchURLType) async {
  switch (launchURLType) {
    case LaunchAppsProjectURL.iosLinkPerr:
      final Uri url = Uri.parse(AllURLs.iosLinkPerr);
      launchUrl(url);
      break;

    case LaunchAppsProjectURL.androidLinkPerr:
      final Uri url = Uri.parse(AllURLs.androidLinkPerr);
      launchUrl(url);
      break;

    case LaunchAppsProjectURL.iosLinkTechnicalTalent:
      final Uri url = Uri.parse(AllURLs.iosLinkTechnicalTalent);
      launchUrl(url);
      break;

    case LaunchAppsProjectURL.androidLinkTechnicalTalent:
      final Uri url = Uri.parse(AllURLs.androidLinkTechnicalTalent);
      launchUrl(url);
      break;

    case LaunchAppsProjectURL.githubLinkHamroBank:
      final Uri url = Uri.parse(AllURLs.githubLinkHamroBank);
      launchUrl(url);
      break;

    case LaunchAppsProjectURL.iosLinkXchange:
      final Uri url = Uri.parse(AllURLs.iosLinkXchange);
      launchUrl(url);
      break;

    case LaunchAppsProjectURL.androidLinkXchange:
      final Uri url = Uri.parse(AllURLs.androidLinkXchange);
      launchUrl(url);
      break;

    case LaunchAppsProjectURL.githubLinkXchange:
      final Uri url = Uri.parse(AllURLs.githubLinkXchange);
      launchUrl(url);
      break;

    default:
      print('Unknown URL');
  }
}
