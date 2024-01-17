import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/route_manager.dart';
import 'package:get_storage/get_storage.dart';
import 'package:portfolio_website/constants/color_constants.dart';
import 'package:portfolio_website/routes/app_routes.dart';

void main() async {
  await GetStorage.init();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Aakash Shrestha',
      theme: ThemeData(
        primaryColor: AppColors.white,
        splashColor: AppColors.transparent,
        hoverColor: AppColors.transparent,
        highlightColor: AppColors.transparent,
        useMaterial3: true,
      ),
      initialRoute: AppRoutes.initialRoute,
      getPages: AppRoutes.pages,
      // home: const OverallProjectsPage(),
    );
  }
}
