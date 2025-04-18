import 'package:carousel_slider/carousel_controller.dart';
import 'package:get/get.dart';

class OnboardController extends GetxController {
  final carouselController = CarouselSliderController();

  final List<String> imgList = [
    'assets/images/onboard-1.png',
    'assets/images/onboard-2.png',
    'assets/images/onboard-3.png',
  ];

  RxInt current = 0.obs;
}
