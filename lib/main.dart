import 'package:flutter/material.dart';
import 'package:layout/layout.dart';
import 'package:nimbus/presentation/routes/router.gr.dart';
import 'package:nimbus/values/values.dart';
import 'package:sizer/sizer.dart';

import 'app_theme.dart';

void main() {
  runApp(Nimbus());
}

class Nimbus extends StatelessWidget {
  final _appRouter = AppRouter();

  @override
  Widget build(BuildContext context) {
    return Layout(
      child: Sizer(
        builder: (context, orientation, deviceType) {
          return MaterialApp.router(
            title: StringConst.APP_NAME,
            theme: AppTheme.lightThemeData,
            debugShowCheckedModeBanner: false,
            routerDelegate: _appRouter.delegate(),
            routeInformationParser: _appRouter.defaultRouteParser(),
          );
        },
      ),
    );
  }
}
