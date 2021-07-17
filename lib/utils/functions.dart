import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:sizer/sizer.dart';

const kDuration = Duration(milliseconds: 1000);

Future<void> openUrlLink(String url) async {
  if (await canLaunch(url)) {
    await launch(
      url,
      forceSafariVC: false,
      forceWebView: false,
    );
  } else {
    throw 'Could not launch $url';
  }
}

scrollToSection(ScrollController controller, int index) {
  // Widget widget = context.widget;
  // widget.child
  // Scrollable.ensureVisible(
  //   context,
  //   duration: kDuration,
  // );
  switch (index) {
    case 0:
      controller.animateTo(10.h,
          duration: Duration(milliseconds: 800), curve: Curves.easeIn);
      break;
    case 1:
      controller.animateTo(50.h,
          duration: Duration(milliseconds: 800), curve: Curves.easeIn);
      break;
    case 2:
      controller.animateTo(110.h,
          duration: Duration(milliseconds: 800), curve: Curves.easeIn);
      break;
    case 3:
      controller.animateTo(150.h,
          duration: Duration(milliseconds: 1000), curve: Curves.easeIn);
      break;
    case 4:
      controller.animateTo(210.h,
          duration: Duration(milliseconds: 1000), curve: Curves.easeIn);
      break;
    case 5:
      controller.animateTo(270.h,
          duration: Duration(milliseconds: 1000), curve: Curves.easeIn);
      break;
  }
}
