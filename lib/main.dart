import 'package:codequizzers/code_quizzers.dart';
import 'package:flutter/material.dart';

import 'app/routes/app_pages.dart';
import 'initializer.dart';

Future<void> main() async {
  await Initializer.init();

  final String initialRoute = await Routes.INITIAL;
  runApp(CodeQuizzers(initialRoute: initialRoute));
}
