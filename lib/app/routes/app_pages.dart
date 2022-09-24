import 'package:get/get.dart';
import '../modules/create_username/bindings/create_username_binding.dart';
import '../modules/create_username/views/create_username_view.dart';
import '../modules/home/bindings/home_binding.dart';
import '../modules/home/views/home_view.dart';
import '../modules/leaderboard/bindings/leaderboard_binding.dart';
import '../modules/leaderboard/views/leaderboard_view.dart';
import '../modules/login/bindings/login_binding.dart';
import '../modules/login/views/login_view.dart';
import '../modules/main_screen/bindings/main_screen_binding.dart';
import '../modules/main_screen/views/main_screen_view.dart';
import '../modules/otp/bindings/otp_binding.dart';
import '../modules/otp/views/otp_view.dart';
import '../modules/profile/bindings/profile_binding.dart';
import '../modules/profile/views/profile_view.dart';
import '../modules/questions/bindings/questions_binding.dart';
import '../modules/questions/views/questions_view.dart';
import '../modules/result/bindings/result_binding.dart';
import '../modules/result/views/result_view.dart';
import '../modules/splash_screen/bindings/splash_screen_binding.dart';
import '../modules/splash_screen/views/splash_screen_view.dart';
import '../modules/wrong_answer/bindings/wrong_answer_binding.dart';
import '../modules/wrong_answer/views/wrong_answer_view.dart';

part 'app_routes.dart';

class AppPages {
  AppPages._();

  static const HOME = Routes.HOME;
  static const LOGIN = Routes.LOGIN;
  static const CREATE_USERNAME = Routes.CREATE_USERNAME;
  static const OTP = _Paths.OTP;
  static const MAIN_SCREEN = Routes.MAIN_SCREEN;
  static const QUESTIONS = Routes.QUESTIONS;
  static const RESULT = Routes.RESULT;
  static const WRONG_ANSWER = Routes.WRONG_ANSWER;
  static const LEADERBOARD = Routes.LEADERBOARD;
  static const PROFILE = Routes.PROFILE;
  static const SPLASH_SCREEN = Routes.SPLASH_SCREEN;

  static final routes = [
    GetPage(
      name: _Paths.HOME,
      page: () => HomeView(),
      binding: HomeBinding(),
    ),
    GetPage(
      name: _Paths.LOGIN,
      page: () => LoginView(),
      binding: LoginBinding(),
    ),
    GetPage(
      name: _Paths.CREATE_USERNAME,
      page: () => CreateUsernameView(),
      binding: CreateUsernameBinding(),
    ),
    GetPage(
      name: _Paths.OTP,
      page: () => OtpView(),
      binding: OtpBinding(),
    ),
    GetPage(
      name: _Paths.MAIN_SCREEN,
      page: () => MainScreenView(),
      binding: MainScreenBinding(),
    ),
    GetPage(
      name: _Paths.QUESTIONS,
      page: () => QuestionsView(),
      binding: QuestionsBinding(),
    ),
    GetPage(
      name: _Paths.RESULT,
      page: () => ResultView(),
      binding: ResultBinding(),
    ),
    GetPage(
      name: _Paths.WRONG_ANSWER,
      page: () => WrongAnswerView(),
      binding: WrongAnswerBinding(),
    ),
    GetPage(
      name: _Paths.LEADERBOARD,
      page: () => LeaderboardView(),
      binding: LeaderboardBinding(),
    ),
    GetPage(
      name: _Paths.PROFILE,
      page: () => ProfileView(),
      binding: ProfileBinding(),
    ),
    GetPage(
      name: _Paths.SPLASH_SCREEN,
      page: () => SplashScreenView(),
      binding: SplashScreenBinding(),
    ),
  ];
}
