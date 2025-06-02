import 'dart:async';

import 'package:flutter/services.dart';
import 'package:get/get.dart';

import '../../art_core/art_core.dart';
import 'splash_controller.dart';

class SplashPage extends StatefulWidget {
  const SplashPage({super.key});

  @override
  _SplashPageState createState() => _SplashPageState();
}

class _SplashPageState extends State<SplashPage> with WidgetsBindingObserver, TickerProviderStateMixin {
  final SplashController controller = Get.find<SplashController>();

  @override
  void initState() {
    SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(
      statusBarColor: Colors.transparent,
      statusBarBrightness: GetPlatform.isAndroid ? Brightness.dark : Brightness.light,
      statusBarIconBrightness: GetPlatform.isAndroid ? Brightness.dark : Brightness.light,
    ));
    WidgetsBinding.instance.addObserver(this);
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitDown,
      DeviceOrientation.portraitUp,
    ]);

    Timer(const Duration(seconds: 2), () {
      controller.navigate();
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return GetBuilder<SplashController>(
      builder: (_) {
        return Scaffold(
          body: Container(
            height: MediaQuery.of(context).size.height,
            width: MediaQuery.of(context).size.width,
            decoration: const BoxDecoration(
              gradient: LinearGradient(
                colors: [
                  AppColors.primaryColor,
                  AppColors.secondaryColor,
                  AppColors.white,
                ],
                begin: Alignment.topCenter,
                end: Alignment.center,
              ),
            ),
            child: Center(
              child: Image.asset(
                'assets/images/logo.png',
                height: 200,
                width: 300,
              ),
            ),
          ),
        );
      },
    );
  }
}
