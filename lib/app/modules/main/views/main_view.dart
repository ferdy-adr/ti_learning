import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:talent_insider_learning/app/modules/courses/views/courses_view.dart';
import 'package:talent_insider_learning/app/modules/profile/views/profile_view.dart';

import '../../../core/consts/assets.dart';
import '../../../core/themes/fonts.dart';
import '../../../core/themes/style.dart';
import '../../home/views/home_view.dart';
import '../controllers/main_controller.dart';

class MainView extends GetView<MainController> {
  const MainView({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Style.background01,
      body: PageView(
        controller: controller.pageController,
        physics: NeverScrollableScrollPhysics(),
        children: [HomeView(), CoursesView(), ProfileView()],
      ),
      bottomNavigationBar: Container(
        decoration: BoxDecoration(
          boxShadow: [
            BoxShadow(
              offset: Offset(0, -1),
              blurRadius: 4,
              spreadRadius: 0,
              color: Color.fromRGBO(0, 0, 0, 0.08),
            ),
          ],
        ),
        child: Obx(() {
          return BottomNavigationBar(
            type: BottomNavigationBarType.fixed,
            backgroundColor: Color(0xFF0D0D0E),
            selectedItemColor: Colors.white,
            unselectedItemColor: Style.lightGrey,
            elevation: 0,
            onTap: (value) {
              controller.changePage(value);
            },
            currentIndex: controller.currentIndex.value,
            items: [
              _createBottomNavbarItem(label: 'Home', icon: Assets.homeIcon),
              _createBottomNavbarItem(
                label: 'Transaksi',
                icon: Assets.courseIcon,
              ),
              _createBottomNavbarItem(
                label: 'Profile',
                icon: Assets.profileIcon,
              ),
            ],
            unselectedLabelStyle: Fonts.mainText.copyWith(
              color: Style.lightGrey,
              fontSize: 12,
              fontWeight: FontWeight.w600,
              height: 1.66,
              letterSpacing: 0.1,
            ),
            selectedLabelStyle: Fonts.mainText.copyWith(
              fontSize: 12,
              fontWeight: FontWeight.w600,
              height: 1.66,
              letterSpacing: 0.1,
            ),
          );
        }),
      ),
    );
  }

  BottomNavigationBarItem _createBottomNavbarItem({
    required String icon,
    String label = '',
  }) {
    return BottomNavigationBarItem(
      label: label,
      icon: Image(
        width: 24,
        height: 24,
        color: Style.lightGrey,
        image: AssetImage(icon),
      ),
      activeIcon: Image(
        width: 24,
        height: 24,
        color: Colors.white,
        image: AssetImage(icon),
      ),
    );
  }
}
