import 'package:flutter/material.dart';
import 'package:get/route_manager.dart';

import 'app/routes/app_pages.dart';

class CodeQuizzers extends StatelessWidget {
  const CodeQuizzers({super.key, required this.initialRoute});
  final String initialRoute;

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: "CodeQuizzers",
      themeMode: ThemeMode.light,
      theme: ThemeData.light(
        useMaterial3: true,
      ),
      locale: Get.deviceLocale,
      fallbackLocale: const Locale("fr"),
      initialRoute: initialRoute,
      getPages: AppPages.routes,
      debugShowCheckedModeBanner: false,
    );
  }
}
