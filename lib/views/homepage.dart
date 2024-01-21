import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:portfolio_website/constants/color_constants.dart';
import 'package:portfolio_website/constants/image_constants.dart';
import 'package:portfolio_website/controller/homepage_controller.dart';
import 'package:portfolio_website/model/individual_project_generator.dart';
import 'package:portfolio_website/model/individual_project_model.dart';
import 'package:portfolio_website/model/worked_project_generator.dart';
import 'package:portfolio_website/model/worked_project_model.dart';
import 'package:portfolio_website/routes/app_routes.dart';
import 'package:portfolio_website/widgets/build_svg.dart';
import 'package:portfolio_website/widgets/custom_text.dart';
import 'package:portfolio_website/widgets/header.dart';
import 'package:scrolls_to_top/scrolls_to_top.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final HomepageController _homepageController = Get.put(HomepageController());
  late List<IndividualProject> _allIndividualProject;
  late List<WorkedProject> _allWorkedProject;
  List<Image> allWorkedAppIconImages = [];
  late double screenWidth;

  @override
  void initState() {
    _allWorkedProject = WorkedProjectGenerator.generateWorkedProject();

    for (var element in _allWorkedProject) {
      allWorkedAppIconImages.add(
        Image.asset(
          element.image,
          fit: BoxFit.fitWidth,
          width: element.appIconSize.width,
          height: element.appIconSize.height,
        ),
      );
    }

    _homepageController.delayForLoadingImagesAtFirst();
    super.initState();
  }

  @override
  void didChangeDependencies() {
    _homepageController.writeImageCached(false);

    if (!_homepageController.readImageCached()) {
      // For Caching all Worked Projects App Icons Images in a home page for instantly viewing images.
      for (var i = 0; i < _allWorkedProject.length; i++) {
        String appIconImageName = _allWorkedProject[i].appIconImageName;

        _homepageController.cachedAllWorkdedProjectImage(
            appIconImageName, context);
      }

      // For Caching all individual Projects Images in a home page for instantly viewing images.
      _allIndividualProject =
          IndividualProjectGenerator.generateWorkedProject();
      for (var i = 0; i < _allIndividualProject.length; i++) {
        String folderName = _allIndividualProject[i].screenshotFolderName;
        List<String> imageList = _allIndividualProject[i].listofScreenshot;

        _homepageController.cachedAllIndividualAssetImage(
            folderName, imageList, context);
      }

      _homepageController.writeImageCached(true);
    }
    super.didChangeDependencies();
  }

  final _scrollController = ScrollController();
  @override
  Widget build(BuildContext context) {
    screenWidth = MediaQuery.of(context).size.width;

    return Obx(
      () => _homepageController.isLoadingAtFirst.value
          ? const Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [CircularProgressIndicator()],
              ),
            )
          : ScrollsToTop(
              onScrollsToTop: (event) async {
                await _scrollController.animateTo(
                  event.to,
                  duration: event.duration,
                  curve: event.curve,
                );
              },
              child: Scaffold(
                backgroundColor: AppColors.white,
                body: SafeArea(
                  child: ListView(
                    primary: false,
                    controller: ScrollController(),
                    physics: const BouncingScrollPhysics(),
                    children: [
                      const SizedBox(height: 60),
                      buildHeader(),

                      // My Best Recent Projects
                      const SizedBox(height: 120),
                      _buildBestProjects(),

                      // Bio and FrameWork
                      const SizedBox(height: 60),
                      _buildBioAndFramework(),

                      // Programming Languages and Technologies
                      const SizedBox(height: 80),
                      _buildProgLangAndTech(),

                      // About Me
                      const SizedBox(height: 80),
                      _buildAboutMe(),

                      // Bottom white space
                      const SizedBox(height: 60),
                    ],
                  ),
                ),
              ),
            ),
    );
  }

  Widget _buildBestProjects() {
    return Column(
      children: [
        customText(
          "Projects",
          fontSize: 40,
          color: AppColors.lightBlack,
          fontWeight: FontWeight.w600,
        ),
        customText(
          "some of my best work",
          fontSize: 18,
          color: AppColors.lightBlack,
        ),

        // List of Projects
        const SizedBox(height: 25),
        Wrap(
          // Row Spacing
          spacing: 40,
          // Column Spacing
          runSpacing: 40,
          alignment: WrapAlignment.center,
          children: List.generate(
            WorkedProjectGenerator.generateWorkedProject().length,
            // 3,
            (index) {
              List<WorkedProject> listOfProjects =
                  WorkedProjectGenerator.generateWorkedProject();

              return _buildIndividualProject(listOfProjects[index], index);
            },
          ),
        ),
      ],
    );
  }

  Widget _buildIndividualProject(WorkedProject workedProject, int projectId) {
    return Obx(
      () => AnimatedScale(
        scale: homepageController.doneProjectsScale[projectId],
        duration: const Duration(milliseconds: 500),
        child: InkWell(
          onHover: (isHovering) {
            if (isHovering) {
              homepageController.doneProjectsScale[projectId] = 1.06;
            } else {
              homepageController.doneProjectsScale[projectId] = 1.0;
            }
          },
          onTap: () {
            homepageController.writeIndividualProjectId(projectId);

            Get.toNamed(AppRoutes.individualProjectRoute);
          },
          child: Container(
            width: 300,
            height: 300,
            decoration: BoxDecoration(
              border: Border.all(color: AppColors.black),
              borderRadius: BorderRadius.circular(20),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Stack(
                  alignment: AlignmentDirectional.center,
                  children: [
                    Center(
                      child: Padding(
                        padding: const EdgeInsets.only(top: 4),
                        child: Container(
                          width: 290,
                          height: 132,
                          decoration: BoxDecoration(
                            borderRadius: const BorderRadius.only(
                              topLeft: Radius.circular(20),
                              topRight: Radius.circular(20),
                              bottomLeft: Radius.circular(0),
                              bottomRight: Radius.circular(0),
                            ),
                            color: workedProject.appIconBackgroundColor,
                          ),
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: 4),
                      // child: Image.asset(
                      //   workedProject.image,
                      //   fit: BoxFit.fitWidth,
                      //   width: workedProject.appIconSize.width,
                      //   height: workedProject.appIconSize.height,
                      // ),
                      child: allWorkedAppIconImages[projectId],
                    ),
                  ],
                ),
                const Divider(thickness: 2, color: AppColors.grey),
                const SizedBox(height: 20),
                Padding(
                  padding: const EdgeInsets.only(left: 10),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      customText(workedProject.projectName,
                          fontSize: 16, fontWeight: FontWeight.w500),
                      const SizedBox(height: 15),
                      customText(workedProject.projectSubTitle, fontSize: 16),
                      const SizedBox(height: 15),
                      Row(
                        children: [
                          workedProject.iosAppLink == null
                              ? const SizedBox()
                              : buildProjectIconSVG(
                                  workedProject.iosIcon,
                                  rightPadding: 10,
                                  launchURLType: workedProject.iosAppLink,
                                  projectIndex: projectId,
                                  iconIndex: 0,
                                ),
                          workedProject.androidAppLink == null
                              ? const SizedBox()
                              : buildProjectIconSVG(
                                  workedProject.androidIcon,
                                  rightPadding: 10,
                                  launchURLType: workedProject.androidAppLink,
                                  projectIndex: projectId,
                                  iconIndex: 1,
                                ),
                          workedProject.githubProjectLink == null
                              ? const SizedBox()
                              : buildProjectIconSVG(
                                  workedProject.githubIcon,
                                  rightPadding: 10,
                                  launchURLType:
                                      workedProject.githubProjectLink,
                                  projectIndex: projectId,
                                  iconIndex: 2,
                                ),
                        ],
                      )
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildBioAndFramework() {
    double width = screenWidth > 600 ? 156 : 40;
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: width),
      child: Column(
        children: [
          customText(
            "I have been active in the technology field since 2018 up to the present day. My interest in the STEAM field dates back to my school days. After completing school, I joined the Robotics Association of Nepal. I pursued Computer Science during A Levels and eventually graduated in Computer Science from the University of Wolverhampton in Nepal. Throughout my academic journey, I acquired various problem-solving techniques in different programming languages and self-taught frameworks, such as Flutter, Firebase, and Node.js.",
            fontSize: 18,
            textAlign: TextAlign.justify,
          ),
          const SizedBox(height: 40),
          Wrap(
            // Row Spacing
            spacing: 32,
            // Column Spacing
            runSpacing: 30,
            alignment: WrapAlignment.center,
            children: [
              _buildTechIcon(ImageConstant.svgFlutter, "Flutter"),
              _buildTechIcon(ImageConstant.svgNodejs, "Node.js"),
              _buildTechIcon(ImageConstant.svgFirebase, "Firebase"),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildTechIcon(String techIcon, String title) {
    return Column(
      children: [
        buildSVG(techIcon),
        const SizedBox(height: 8),
        customText(
          title,
          fontSize: 19,
          fontWeight: FontWeight.w600,
          color: AppColors.lightBlack,
        ),
      ],
    );
  }

  Widget _buildProgLangAndTech() {
    return Column(
      children: [
        // Programming Languages
        customText(
          "Programming Languages",
          fontSize: 40,
          fontWeight: FontWeight.w600,
          color: AppColors.lightBlack,
        ),
        const SizedBox(height: 40),
        Wrap(
          // Row Spacing
          spacing: 32,
          // Column Spacing
          runSpacing: 30,
          alignment: WrapAlignment.center,
          children: [
            _buildTechIcon(ImageConstant.svgHtml, "HTML"),
            _buildTechIcon(ImageConstant.svgCss, "CSS"),
            _buildTechIcon(ImageConstant.svgJavascript, "JavaScript"),
            _buildTechIcon(ImageConstant.svgDart, "Dart"),
            _buildTechIcon(ImageConstant.svgPython, "Python"),
            _buildTechIcon(ImageConstant.svgC, "C"),
            _buildTechIcon(ImageConstant.svgJava, "Java"),
          ],
        ),

        // Technologies
        const SizedBox(height: 80),
        Center(
          child: customText(
            "Technologies",
            fontSize: 40,
            fontWeight: FontWeight.w600,
            color: AppColors.lightBlack,
          ),
        ),
        const SizedBox(height: 40),
        Wrap(
          // Row Spacing
          spacing: 32,
          // Column Spacing
          runSpacing: 30,
          alignment: WrapAlignment.center,
          children: [
            _buildTechIcon(ImageConstant.svgFigma, "Figma"),
            _buildTechIcon(ImageConstant.svgVscode, "VS Code"),
            _buildTechIcon(ImageConstant.svgXcode, "Xcode"),
            _buildTechIcon(ImageConstant.svgGit, "Git"),
          ],
        ),
      ],
    );
  }

  Widget _buildAboutMe() {
    double width = screenWidth < 600 ? 20 : 0;

    return Column(
      children: [
        // Title
        Center(
          child: customText(
            "About Me",
            fontSize: 40,
            fontWeight: FontWeight.w600,
            color: AppColors.lightBlack,
          ),
        ),
        const SizedBox(height: 40),

        // Cards
        Padding(
          padding: EdgeInsets.symmetric(horizontal: width),
          child: Wrap(
            // Row Spacing
            spacing: 20,
            // Column Spacing
            runSpacing: 20,
            alignment: WrapAlignment.center,
            children: [
              Container(
                width: 600,
                // height: 270,
                decoration: const BoxDecoration(color: AppColors.grey),
                child: Column(
                  children: [
                    const SizedBox(height: 10),
                    customText(
                      "Education",
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                      textDecoration: TextDecoration.underline,
                    ),
                    // const Spacer(),
                    const SizedBox(height: 20),
                    customText(
                      "High School",
                      fontSize: 18,
                      fontWeight: FontWeight.w500,
                    ),
                    customText(
                      "A-Level (Physics) Computer Science\nUniversity of Cambridge (Xavier International College)",
                      fontSize: 18,
                    ),
                    const SizedBox(height: 20),
                    customText(
                      "Undergraduate",
                      fontSize: 18,
                      fontWeight: FontWeight.w500,
                    ),
                    customText(
                      "Bachelors in Information Technology (Hons) Computer Science\nUniversity of Wolverhampton (Herald College Kathmandu)",
                      fontSize: 18,
                    ),
                    const SizedBox(height: 38)
                  ],
                ),
              ),
              Container(
                width: 600,
                height: 270,
                decoration: const BoxDecoration(color: AppColors.grey),
                child: Column(
                  children: [
                    const SizedBox(height: 10),
                    customText(
                      "Contact Info",
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                      textDecoration: TextDecoration.underline,
                    ),
                    const Spacer(),
                    selectableCustomText("contactaakash10@gmail.com",
                        fontSize: 18),
                    selectableCustomText("+9779869266662", fontSize: 18),
                    selectableCustomText("Bhaktapur, Nepal", fontSize: 18),
                    const Spacer(),
                    const SizedBox(height: 30),
                  ],
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
