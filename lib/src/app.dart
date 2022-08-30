import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:get/get.dart';

import 'routes/app_pages.dart';
import 'services/auth_service.dart';
import 'splash/splash_view.dart';
import 'splash/splash_controller.dart';

/// The Widget that configures your application.
class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      localizationsDelegates: const [
        AppLocalizations.delegate,
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
      ],
      supportedLocales: const [
        Locale('en', ''), // English, no country code
      ],
      // title: AppLocalizations.of(context)!.appTitle,
      initialBinding: BindingsBuilder(
        () {
          Get.put(SplashController());
          Get.put(AuthService());
        },
      ),
      getPages: AppPages.routes,
      initialRoute: AppPages.INITIAL,
      builder: (context, child) {
        return FutureBuilder<void>(
          key: ValueKey('initFuture'),
          future: Get.find<SplashController>().init(),
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.done) {
              return child ?? SizedBox.shrink();
            }
            return SplashView();
          },
        );
      },

      onGenerateTitle: (BuildContext context) =>
          AppLocalizations.of(context)!.appTitle,
      theme: ThemeData(),
      darkTheme: ThemeData.dark(),
      // themeMode: settingsController.themeMode,
    );
  }
}
