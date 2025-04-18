import 'package:get/get.dart';

import '../modules/audio_book/bindings/audio_book_binding.dart';
import '../modules/audio_book/views/audio_book_view.dart';
import '../modules/audio_player/bindings/audio_player_binding.dart';
import '../modules/audio_player/views/audio_player_view.dart';
import '../modules/courses/bindings/courses_binding.dart';
import '../modules/courses/views/courses_view.dart';
import '../modules/home/bindings/home_binding.dart';
import '../modules/home/views/home_view.dart';
import '../modules/lesson/bindings/lesson_binding.dart';
import '../modules/lesson/views/lesson_view.dart';
import '../modules/login/bindings/login_binding.dart';
import '../modules/login/views/login_view.dart';
import '../modules/main/bindings/main_binding.dart';
import '../modules/main/views/main_view.dart';
import '../modules/onboard/bindings/onboard_binding.dart';
import '../modules/onboard/views/onboard_view.dart';
import '../modules/profile/bindings/profile_binding.dart';
import '../modules/profile/views/profile_view.dart';

part 'app_routes.dart';

class AppPages {
  AppPages._();

  static const INITIAL = Routes.ONBOARD;

  static final routes = [
    GetPage(
      name: _Paths.ONBOARD,
      page: () => const OnboardView(),
      binding: OnboardBinding(),
    ),
    GetPage(
      name: _Paths.LOGIN,
      page: () => const LoginView(),
      binding: LoginBinding(),
    ),
    GetPage(
      name: _Paths.MAIN,
      page: () => const MainView(),
      binding: MainBinding(),
    ),
    GetPage(
      name: _Paths.HOME,
      page: () => const HomeView(),
      binding: HomeBinding(),
    ),
    GetPage(
      name: _Paths.COURSES,
      page: () => const CoursesView(),
      binding: CoursesBinding(),
    ),
    GetPage(
      name: _Paths.LESSON,
      page: () => const LessonView(),
      binding: LessonBinding(),
    ),
    GetPage(
      name: _Paths.AUDIO_BOOK,
      page: () => const AudioBookView(),
      binding: AudioBookBinding(),
    ),
    GetPage(
      name: _Paths.AUDIO_PLAYER,
      page: () => const AudioPlayerView(),
      binding: AudioPlayerBinding(),
    ),
  ];
}
