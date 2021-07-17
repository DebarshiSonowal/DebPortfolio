import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:nimbus/presentation/layout/adaptive.dart';
import 'package:nimbus/presentation/pages/home/sections/about_me_section.dart';
import 'package:nimbus/presentation/pages/home/sections/awards_section.dart';
import 'package:nimbus/presentation/pages/home/sections/footer_section.dart';
import 'package:nimbus/presentation/pages/home/sections/header_section.dart';
import 'package:nimbus/presentation/pages/home/sections/nav_section/nav_section_mobile.dart';
import 'package:nimbus/presentation/pages/home/sections/nav_section/nav_section_web.dart';
import 'package:nimbus/presentation/pages/home/sections/projects_section.dart';
import 'package:nimbus/presentation/pages/home/sections/skills_section.dart';
import 'package:nimbus/presentation/pages/home/sections/statistics_section.dart';
import 'package:nimbus/presentation/widgets/nav_item.dart';
import 'package:nimbus/values/values.dart';
import 'package:sizer/sizer.dart';
import 'package:responsive_builder/responsive_builder.dart';

//TODO:: Add ash background blob (esp the one that extends between header and about section
//TODO:: Add huge ash background blob (the one that extends between skills section and projects
//TODO:: Add FAB that takes user to the top page
//TODO:: Try and use Monoton for my signature in the future
List<GlobalKey> listKey = [];

class HomePage extends StatelessWidget {
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey();
  final ScrollController _scrollController = ScrollController();

  final List<NavItemData> navItems = [
    NavItemData(name: StringConst.HOME, key: giveKey(), isSelected: true),
    NavItemData(name: StringConst.ABOUT, key: giveKey()),
    NavItemData(name: StringConst.SKILLS, key: giveKey()),
    NavItemData(name: StringConst.PROJECTS, key: giveKey()),
    NavItemData(name: StringConst.Academics_Certifications, key: giveKey()),
    NavItemData(name: StringConst.CONTACT, key: giveKey()),
  ];

  final List<IconData> icons = [
    Icons.home,
    FontAwesomeIcons.info,
    FontAwesomeIcons.laptop,
    FontAwesomeIcons.file,
    FontAwesomeIcons.certificate,
    FontAwesomeIcons.phone
  ];

  @override
  Widget build(BuildContext context) {
    double screenHeight = heightOfScreen(context);
    double spacerHeight = screenHeight * 0.10;
    TextTheme textTheme = Theme.of(context).textTheme;
    double headerIntroTextSize = responsiveSize(
      context,
      Sizes.TEXT_SIZE_24,
      Sizes.TEXT_SIZE_50,
      md: Sizes.TEXT_SIZE_36,
    );
    return Scaffold(
      key: _scaffoldKey,
      drawer: Drawer(
        child: Column(

          children: [
            Container(
              width: double.infinity,
              height: 100,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Text(StringConst.FULL_NAME,   style: textTheme.headline2?.copyWith(
                    fontSize: headerIntroTextSize,
                  ),),
                  Text(StringConst.FIRST_NAME),
                ],
              ),
            ),
            SizedBox(
              height: 1,
              width: double.infinity,
              child: Container(
                color: Colors.black,
              ),
            ),
            ListView.builder(
                itemCount: navItems.length,
                shrinkWrap: true,
                itemBuilder: (context, int) => ListTile(
                    enableFeedback: true,
                    hoverColor: Colors.white70,
                    leading: Icon(icons[int]),
                    title: Text(
                      '${navItems[int].name}',
                      style: TextStyle(
                          color: Colors.black, fontWeight: FontWeight.bold),
                    ),
                    onTap: () {
                      switch (int) {
                        case 0:
                          _scrollController.animateTo(15.h,
                              duration: Duration(milliseconds: 800),
                              curve: Curves.easeIn);
                          Navigator.of(context).pop();
                          break;
                        case 1:
                          _scrollController.animateTo(75.h,
                              duration: Duration(milliseconds: 800),
                              curve: Curves.easeIn);
                          Navigator.of(context).pop();
                          break;
                        case 2:
                          _scrollController.animateTo(190.h,
                              duration: Duration(milliseconds: 800),
                              curve: Curves.easeIn);
                          Navigator.of(context).pop();
                          break;
                        case 3:
                          _scrollController.animateTo(370.h,
                              duration: Duration(milliseconds: 1000),
                              curve: Curves.easeIn);
                          Navigator.of(context).pop();
                          break;
                        case 4:
                          _scrollController.animateTo(520.h,
                              duration: Duration(milliseconds: 1000),
                              curve: Curves.easeIn);
                          Navigator.of(context).pop();
                          break;
                        case 5:
                          _scrollController.animateTo(770.h,
                              duration: Duration(milliseconds: 1000),
                              curve: Curves.easeIn);
                          Navigator.of(context).pop();
                          break;
                      }
                    })),
          ],
        ),
      ),
      body: Column(
        children: [
          ResponsiveBuilder(
            refinedBreakpoints: RefinedBreakpoints(),
            builder: (context, sizingInformation) {
              double screenWidth = sizingInformation.screenSize.width;
              if (screenWidth < RefinedBreakpoints().desktopSmall) {
                return NavSectionMobile(
                  scaffoldKey: _scaffoldKey,
                  navItems: navItems,
                  scrollController: _scrollController,
                  icons: icons,
                );
              } else {
                return NavSectionWeb(
                  navItems: navItems,
                  scrollController: _scrollController,
                );
              }
            },
          ),
          Expanded(
            child: SingleChildScrollView(
              controller: _scrollController,
              child: Column(
                children: [
                  HeaderSection(),
                  AboutMeSection(),
                  SizedBox(height: spacerHeight),
                  SkillsSection(),
                  SizedBox(height: spacerHeight),
                  StatisticsSection(),
                  SizedBox(height: spacerHeight),
                  ProjectsSection(),
                  SizedBox(height: spacerHeight),
                  AwardsSection(),
                  SizedBox(height: spacerHeight),
//                  BrandSection(),
//                  SizedBox(height: spacerHeight),
//                  TestimonialsSection(),
//                  SizedBox(height: spacerHeight),
//                  BlogSection(),
//                  SizedBox(height: spacerHeight),
                  FooterSection(),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  static giveKey() {
    var a = GlobalKey();
    listKey.add(a);
    print("${a}");
    return a;
  }

  getkey() {
    for (int i = 0; i < navItems.length; i++) {
      if (navItems[i].isSelected) {
        return listKey[i];
      }
    }
  }
}
