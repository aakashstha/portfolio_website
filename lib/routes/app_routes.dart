import 'package:get/get.dart';
import 'package:portfolio_website/views/homepage.dart';
import 'package:portfolio_website/views/individual_project.dart';

class AppRoutes {
  static const String splashScreen = '/splash_screen';

  // initial route is the Home Route
  static const String initialRoute = '/initialRoute';

  static const String individualProjectRoute = '/individual_project_route';

  static List<GetPage> pages = [
    GetPage(
      name: initialRoute,
      page: () => HomePage(),
      transition: Transition.noTransition,
    ),
    GetPage(
      name: individualProjectRoute,
      page: () => const IndividualProjectPage(),
      transition: Transition.noTransition,
    ),

    // GetPage(
    //   name: initialRoute,
    //   page: () => SplashScreen(),
    //   bindings: [
    //     SplashBinding(),
    //   ],
    // )
  ];
}
