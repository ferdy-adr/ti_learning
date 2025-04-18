import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:talent_insider_learning/app/core/themes/fonts.dart';
import 'package:talent_insider_learning/app/core/themes/style.dart';
import 'package:talent_insider_learning/app/data/models/course.dart';
import 'package:talent_insider_learning/app/global_widgets/custom_appbar.dart';
import 'package:talent_insider_learning/app/routes/app_pages.dart';

import '../controllers/courses_controller.dart';

class CoursesView extends GetView<CoursesController> {
  const CoursesView({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Style.background01,
      appBar: CustomAppBar(
        title: 'Courses',
      ),
      body: SafeArea(
        child: ListView(
          padding: EdgeInsets.all(Style.minimumMargin),
          children: [
            _CourseItem(
              course: Course.fromJson({}),
              onPressed: () => Get.toNamed(Routes.LESSON),
            ),
          ],
        ),
      ),
    );
  }
}

class _CourseItem extends StatelessWidget {
  final Course course;
  final void Function()? onPressed;

  const _CourseItem({required this.course, this.onPressed});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onPressed,
      child: Row(
        spacing: 16,
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(6),
            child: Image(
              width: 88,
              height: 88,
              fit: BoxFit.cover,
              image: NetworkImage(
                'https://plus.unsplash.com/premium_photo-1682144187125-b55e638cf286?fm=jpg&q=60&w=3000&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxzZWFyY2h8MXx8cG9ydHJhaXQlMjBtYW58ZW58MHx8MHx8fDA%3D',
              ),
            ),
          ),
          Expanded(
            child: Column(
              children: [
                SizedBox(height: 4),
                Text(
                  'ChatGPT & Midjourney: 23 Ways of Earning Money with AI',
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                  style: Fonts.mainText.copyWith(
                    fontWeight: FontWeight.w500,
                    height: 1.5,
                    letterSpacing: 0,
                  ),
                ),
                SizedBox(height: 4),
                Row(
                  spacing: 8,
                  children: [
                    Expanded(
                      child: Row(
                        children: [
                          ClipRRect(
                            borderRadius: BorderRadius.circular(4),
                            child: Image(
                              width: 20,
                              height: 20,
                              fit: BoxFit.cover,
                              image: NetworkImage(
                                'https://plus.unsplash.com/premium_photo-1682144187125-b55e638cf286?fm=jpg&q=60&w=3000&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxzZWFyY2h8MXx8cG9ydHJhaXQlMjBtYW58ZW58MHx8MHx8fDA%3D',
                              ),
                            ),
                          ),
                          SizedBox(width: 6),
                          Text(
                            'David Rockwell',
                            maxLines: 1,
                            overflow: TextOverflow.ellipsis,
                            style: Fonts.mainText.copyWith(
                              fontSize: 12,
                              fontWeight: FontWeight.w500,
                              height: 1.5,
                              letterSpacing: 0,
                            ),
                          ),
                        ],
                      ),
                    ),
                    Container(
                      padding: EdgeInsets.symmetric(
                        horizontal: 6,
                        vertical: 6.5,
                      ),
                      decoration: BoxDecoration(
                        border: Border.all(color: Color(0xFF17B8C1)),
                        borderRadius: BorderRadius.circular(8),
                      ),
                      child: Text(
                        'Intermediate',
                        style: Fonts.mainText.copyWith(
                          color: Color(0xFF17B8C1),
                          fontSize: 10,
                          fontWeight: FontWeight.w400,
                          height: 1.5,
                          letterSpacing: 0,
                        ),
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 8),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
