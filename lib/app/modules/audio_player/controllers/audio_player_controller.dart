import 'package:get/get.dart';

class AudioPlayerController extends GetxController {
  RxBool isPaused = false.obs;
  RxDouble position = 0.0.obs;
}
