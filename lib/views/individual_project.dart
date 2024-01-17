import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:portfolio_website/constants/color_constants.dart';
import 'package:portfolio_website/controller/homepage_controller.dart';
import 'package:portfolio_website/model/individual_project_generator.dart';
import 'package:portfolio_website/model/individual_project_model.dart';
import 'package:portfolio_website/widgets/build_svg.dart';
import 'package:portfolio_website/widgets/custom_text.dart';
import 'package:portfolio_website/widgets/header.dart';

class IndividualProjectPage extends StatefulWidget {
  const IndividualProjectPage({Key? key}) : super(key: key);

  @override
  State<IndividualProjectPage> createState() => _IndividualProjectPageState();
}

class _IndividualProjectPageState extends State<IndividualProjectPage> {
  final HomepageController _homepageController = Get.put(HomepageController());
  late IndividualProject _individualProject;
  late double screenWidth;

  @override
  void initState() {
    int projectId = _homepageController.readIndividualProjectId();
    _individualProject =
        IndividualProjectGenerator.generateWorkedProject()[projectId];

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    screenWidth = MediaQuery.of(context).size.width;

    return Scaffold(
      backgroundColor: AppColors.white,
      body: SafeArea(
        child: ListView(
          children: [
            const SizedBox(height: 60),
            buildHeader(),

            // App icon, title, AppStore, PlayStore
            const SizedBox(height: 120),
            _buildIconTitle(_individualProject),

            // App All Images
            const SizedBox(height: 40),
            _buildAllImages(_individualProject),

            // App Project Description
            const SizedBox(height: 50),
            _buildProjectDescription(_individualProject),

            // Bottom white space
            const SizedBox(height: 60),
          ],
        ),
      ),
    );
  }

  Widget _buildIconTitle(IndividualProject individualProject) {
    return Column(
      children: [
        Container(
          padding: const EdgeInsets.all(0.5), // Border width
          decoration: BoxDecoration(
              color: Colors.grey, borderRadius: BorderRadius.circular(10)),
          child: ClipRRect(
            borderRadius: const BorderRadius.all(Radius.circular(10)),
            child: Image.asset(
              individualProject.image,
              width: 60,
              height: 60,
            ),
          ),
        ),
        const SizedBox(height: 15),
        customText(
          individualProject.projectName,
          fontSize: 20,
          fontWeight: FontWeight.w600,
          textDecoration: TextDecoration.underline,
        ),
        const SizedBox(height: 15),
        customText(
          individualProject.projectSubTitle,
          fontSize: 20,
        ),
        const SizedBox(height: 15),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            individualProject.iosAppLink == null
                ? const SizedBox()
                : buildSVG(
                    individualProject.iosIcon,
                    rightPadding: 20,
                    svgIconSize: 48,
                    launchURLType: individualProject.iosAppLink,
                  ),
            individualProject.androidAppLink == null
                ? const SizedBox()
                : buildSVG(
                    individualProject.androidIcon,
                    rightPadding: 20,
                    svgIconSize: 48,
                    launchURLType: individualProject.androidAppLink,
                  ),
            individualProject.githubProjectLink == null
                ? const SizedBox()
                : buildSVG(
                    individualProject.githubIcon,
                    rightPadding: 20,
                    svgIconSize: 48,
                    launchURLType: individualProject.githubProjectLink,
                  ),
          ],
        )
      ],
    );
  }

  Widget _buildAllImages(IndividualProject individualProject) {
    double width = screenWidth < 500 ? 20 : 50;

    return Container(
      // for outer padding
      margin: const EdgeInsets.symmetric(horizontal: 100),
      decoration: const BoxDecoration(color: AppColors.grey),
      padding: EdgeInsets.symmetric(
        vertical: width,
        horizontal: screenWidth < 500 ? 5 : 0,
      ),
      child: Wrap(
        // Row Spacing
        spacing: 20,
        // Column Spacing
        runSpacing: screenWidth < 500 ? 5 : 20,
        alignment: WrapAlignment.center,
        children: [
          for (var i = 0; i < individualProject.listofScreenshot.length; i++)
            Image.asset(
              'assets/images/${individualProject.listofScreenshot[i]}',
              height: screenWidth < 500 ? 400 : 600,
            ),
        ],
      ),
    );
  }

  Widget _buildProjectDescription(IndividualProject individualProject) {
    double width = screenWidth < 600 ? 20 : 100;
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: width),
      child: Column(
        children: [
          customText(
            "About the Project",
            fontSize: 40,
            color: AppColors.lightBlack,
          ),
          const SizedBox(height: 10),
          customText(
            individualProject.aboutTheProject,
            fontSize: 18,
            textAlign: TextAlign.justify,
          ),
          const SizedBox(height: 50),
          customText(
            "Tech Stack",
            fontSize: 40,
            color: AppColors.lightBlack,
          ),
          const SizedBox(height: 10),
          customText(
            individualProject.techStack,
            fontSize: 18,
            textAlign: TextAlign.justify,
          ),
        ],
      ),
    );
  }
}
