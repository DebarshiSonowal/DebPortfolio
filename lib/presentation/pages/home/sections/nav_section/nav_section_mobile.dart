import 'package:feather_icons/feather_icons.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:nimbus/presentation/widgets/nav_item.dart';
import 'package:nimbus/presentation/widgets/spaces.dart';
import 'package:nimbus/utils/functions.dart';
import 'package:nimbus/values/values.dart';
import 'package:sizer/sizer.dart';
//TODO:: Add AppDrawer
class NavSectionMobile extends StatelessWidget {
  final GlobalKey<ScaffoldState> scaffoldKey;
  final List<NavItemData> navItems;
  final ScrollController scrollController;
  final List<IconData> icons;
  const NavSectionMobile(
      {required this.scaffoldKey,
      required this.navItems,
      required this.scrollController, required this.icons});

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Container(
        height: 10.h,
       color:Colors.white,
       child: Row(
         mainAxisAlignment: MainAxisAlignment.spaceEvenly,
         children: [
           Container(
             width: 10.w,
             child: IconButton(onPressed: (){
               print('ASDa');
               if (scaffoldKey.currentState!=null) {
                 scaffoldKey.currentState!.openDrawer();
               } else {

               }
             }, icon: Icon(FontAwesomeIcons.hamburger,color: Colors.black,)),
           ),
           Expanded(
             child: Container(
               child: InkWell(
                 onTap: () {},
                 child: Image.asset(
                   ImagePath.LOGO_DARK,
                   height: Sizes.HEIGHT_52,
                 ),
               ),
             ),
           ),
         ],
       ),
      ),
    );
    return Scaffold(
      appBar: AppBar(
        leading:   InkWell(
          onTap: () {},
          child: Image.asset(
            ImagePath.LOGO_LIGHT,
            height: Sizes.HEIGHT_52,
          ),
        ),
      ),
      drawer: NavDrawer(),
      body: Container(
        height: Sizes.HEIGHT_100,
        decoration: BoxDecoration(
          color: AppColors.black100,
        ),
        child: Row(
          children: [
            SpaceW30(),
            Spacer(),
            InkWell(
              onTap: () {},
              child: Image.asset(
                ImagePath.LOGO_LIGHT,
                height: Sizes.HEIGHT_52,
              ),
            ),
            Spacer(),
          ],
        ),
      ),
    );
  }

  _onTapNavItem(
      {required GlobalKey context,
      required String navItemName,
      required ScrollController scrollController}) {
    for (int index = 0; index < navItems.length; index++) {
      if (navItemName == navItems[index].name) {
        print("ADa ${context.currentContext}");
        try {
          scrollToSection(scrollController, index);
        } catch (e) {
          print(e);
        }
        navItems[index].isSelected = true;
      } else {
        navItems[index].isSelected = false;
      }
    }
  }

  List<Widget> _buildNavItems(
      List<NavItemData> navItems, ScrollController scrollController) {
    List<Widget> items = [];
    for (int index = 0; index < navItems.length; index++) {
      items.add(
        NavItem(
          title: navItems[index].name,
          isSelected: navItems[index].isSelected,
          onTap: () => {
            print("key ${navItems[index].key}"),
            _onTapNavItem(
              context: navItems[index].key,
              navItemName: navItems[index].name,
              scrollController: scrollController,
            )
          },
        ),
      );
      items.add(Spacer());
    }
    return items;
  }

  NavDrawer() {
    // return Container(
    //   child: Column(
    //     children: [
    //       ..._buildNavItems(navItems,scrollController),
    //     ],
    //   ),
    // );
    return Drawer(
      child: ListView.builder(itemBuilder: (context, int) => ListTile(
        title: Text('${navItems[int].name}'),
        onTap: (){

        }
      )),
    );
  }
}
