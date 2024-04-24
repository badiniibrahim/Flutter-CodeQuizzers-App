part of 'app_pages.dart';

abstract class Routes {
  Routes._();

  static Future<String> get INITIAL async {
    return Routes.CATEGORIES;
  }

  static const HOME = _Paths.HOME;
  static const WELCOME = _Paths.WELCOME;
  static const CATEGORIES = _Paths.CATEGORIES;
  static const DIFFICULTY = _Paths.DIFFICULTY;
  static const QUESTIONS = _Paths.QUESTIONS;
  static const SCORE = _Paths.SCORE;
}

abstract class _Paths {
  _Paths._();
  static const HOME = "/home";
  static const WELCOME = "/welcome";
  static const CATEGORIES = "/categories";
  static const DIFFICULTY = "/difficulty";
  static const QUESTIONS = "/questions";
  static const SCORE = "/score";
}
