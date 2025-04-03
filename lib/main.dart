import 'package:demo_project/app/theme/app_theme.dart';
import 'package:demo_project/features/home_tab/bottom_navigation_page.dart';
import 'package:demo_project/utils/size_config.dart';
import 'package:flutter/material.dart';
import 'package:adaptive_theme/adaptive_theme.dart';
import 'package:responsive_framework/responsive_framework.dart';
import 'package:get/get.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return _appWidget();
  }

  Widget _appWidget() {
    return LayoutBuilder(
      builder: (context, constraints) {
        return OrientationBuilder(
          builder: (context, orientation) {
            return AdaptiveTheme(
              light: AppTheme.dark,
              dark: AppTheme.light,
              initial: AdaptiveThemeMode.dark,
              builder: (theme, darkTheme) => ResponsiveBreakpoints.builder(
                breakpoints: [
                  const Breakpoint(start: 0, end: 450, name: MOBILE),
                  const Breakpoint(start: 451, end: 960, name: TABLET),
                  const Breakpoint(start: 961, end: double.infinity, name: DESKTOP),
                ],
                child: GetMaterialApp(
                  debugShowCheckedModeBanner: false,
                  title: 'Audio Book',
                  theme: theme,
                  home: BottomNavigationPage(),
                  builder: (context, child) {
                    SizeConfig.init(context);
                    return MediaQuery(
                      data: MediaQuery.of(context).copyWith(
                        textScaler: TextScaler.linear(1.0),
                      ),
                      child: child!,
                    );
                  },
                ),
              ),
            );
          },
        );
      },
    );
  }


}