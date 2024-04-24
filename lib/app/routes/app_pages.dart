import 'package:codequizzers/app/modules/categories/bindings/categories_binding.dart';
import 'package:codequizzers/app/modules/categories/views/categories_view.dart';
import 'package:codequizzers/app/modules/difficulty/bindings/difficulty_binding.dart';
import 'package:codequizzers/app/modules/difficulty/views/difficulty_view.dart';
import 'package:codequizzers/app/modules/home/bindings/home_binding.dart';
import 'package:codequizzers/app/modules/questions/bindings/questions_binding.dart';
import 'package:codequizzers/app/modules/questions/views/questions_view.dart';
import 'package:codequizzers/app/modules/score/binding/score_binding.dart';
import 'package:codequizzers/app/modules/score/views/score_view.dart';
import 'package:codequizzers/app/modules/welcome/bindings/welcome_binding.dart';
import 'package:codequizzers/app/modules/welcome/views/welcome_view.dart';
import 'package:get/get.dart';

import '../modules/home/views/home_view.dart';

part 'app_routes.dart';

class AppPages {
  AppPages._();

  static final routes = [
    GetPage(
      name: _Paths.HOME,
      page: () => const HomeView(),
      binding: HomeBinding(),
    ),
    GetPage(
      name: _Paths.WELCOME,
      page: () => const WelcomeView(),
      binding: WelComeBinding(),
    ),
    GetPage(
      name: _Paths.CATEGORIES,
      page: () => const CategoriesView(),
      binding: CategoriesBinding(),
    ),
    GetPage(
      name: _Paths.DIFFICULTY,
      page: () => DifficultyView(),
      binding: DifficultyBindings(),
    ),
    GetPage(
      name: _Paths.QUESTIONS,
      page: () => QuestionsView(),
      binding: QuestionsBinding(),
    ),
    GetPage(
      name: _Paths.SCORE,
      page: () => const ScoreView(),
      binding: ScoreBinding(),
    ),
  ];
}
