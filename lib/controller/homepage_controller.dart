import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:portfolio_website/model/worked_project_generator.dart';

class HomepageController extends GetxController {
  final individualProjectId = GetStorage();

  Future<void> initializeGetStorage() async {
    await GetStorage.init();
  }

  void writeIndividualProjectId(int projectId) {
    individualProjectId.write('individualProjectId', projectId);
  }

  int readIndividualProjectId() {
    return individualProjectId.read('individualProjectId');
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
}
