import 'package:coach/core/localization/translation_service.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

import 'art_core/theme/app_themes.dart';
import 'binding.dart';
import 'core/caching/preference_manager.dart';
import 'core/routes/app_pages.dart';

Future<void> main() async {
  // VideoPlayerController.setCacheSize(100 * 1024 * 1024, 200 * 1024 * 1024);
  WidgetsFlutterBinding.ensureInitialized();
  Binding().dependencies();
  await GetStorage.init();
  runApp(MyApp());
  // await Firebase.initializeApp();
  // FirebaseNotifications().setUpFirebase();
}

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  Key key = UniqueKey();

  @override
  Widget build(BuildContext context) {
    // print(Get.locale?.languageCode);
    return ScreenUtilInit(
      useInheritedMediaQuery: true,
      designSize: const Size(375, 812),
      minTextAdapt: true,
      splitScreenMode: false,
      child: GetMaterialApp(
        key: key,
        title: "Coach Dealer ( Coach )",
        debugShowCheckedModeBanner: false,
        enableLog: true,
        // logWriterCallback: Logger.write,
        initialRoute: AppPages.INITIAL,
        getPages: AppPages.routes,
        locale: Locale(PreferenceManager().currentLang()),
        fallbackLocale: TranslationService.fallbackLocale,
        translations: TranslationService(),
        theme: AppThemes.light,
      ),
    );
  }
}
