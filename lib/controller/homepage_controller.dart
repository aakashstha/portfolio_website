import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:portfolio_website/model/worked_project_generator.dart';

class HomepageController extends GetxController {
  final getXStorage = GetStorage();

  Future<void> initializeGetStorage() async {
    await GetStorage.init();
  }

  void writeIndividualProjectId(int projectId) {
    getXStorage.write('individualProjectId', projectId);
  }

  int readIndividualProjectId() {
    return getXStorage.read('individualProjectId');
  }

  void writeImageCached(bool projectId) {
    getXStorage.write('imageCached', projectId);
  }

  bool readImageCached() {
    return getXStorage.read('imageCached');
  }

  RxList<double> headerSocialScale = List.generate(4, (index) => 1.0).obs;

  RxList<double> doneProjectsScale = List.generate(
          WorkedProjectGenerator.generateWorkedProject().length, (index) => 1.0)
      .obs;

  RxList<List<double>> insideProjectsIconScale = List.generate(
      WorkedProjectGenerator.generateWorkedProject().length, (index) {
    return List.generate(3, (index) => 1.0);
  }).obs;

  void handleProjectIconHover(int projectIndex, int iconIndex, double scale) {
    insideProjectsIconScale[projectIndex][iconIndex] = scale;
  }

  Future<void> cachedAllIndividualAssetImage(
      String imageFolderName, List imageList, BuildContext context) async {
    for (var i = 0; i < imageList.length; i++) {
      try {
        await precacheImage(
            AssetImage("assets/images/$imageFolderName/${imageList[i]}"),
            context);
        print('Image loaded and cached successfully!');
      } catch (e) {
        print('Failed to load and cache the image: $e');
      }
    }
  }

  Future<void> cachedAllWorkdedProjectImage(
      String imageName, BuildContext context) async {
    try {
      await precacheImage(AssetImage("assets/images/$imageName"), context);
      print('Image loaded and cached successfully!');
    } catch (e) {
      print('Failed to load and cache the image: $e');
    }
  }
}
