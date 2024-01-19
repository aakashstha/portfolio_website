import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:portfolio_website/constants/color_constants.dart';
import 'package:portfolio_website/controller/homepage_controller.dart';
import 'package:portfolio_website/routes/app_routes.dart';

final HomepageController homepageController = Get.put(HomepageController());
void main() async {
  homepageController.initializeGetStorage();

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Aakash Shrestha: Mobile Developer',
      theme: ThemeData(
        primaryColor: AppColors.white,
        splashColor: AppColors.transparent,
        hoverColor: AppColors.transparent,
        highlightColor: AppColors.transparent,
        useMaterial3: true,
        textSelectionTheme: const TextSelectionThemeData(
          selectionColor: AppColors.selectionColor,
        ),
      ),
      initialRoute: AppRoutes.initialRoute,
      getPages: AppRoutes.pages,
      // home: const OverallProjectsPage(),
    );
  }
}
