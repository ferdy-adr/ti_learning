import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:pod_player/pod_player.dart';
import 'package:skeletonizer/skeletonizer.dart';
import 'package:talent_insider_learning/app/core/themes/fonts.dart';
import 'package:talent_insider_learning/app/core/themes/style.dart';
import 'package:talent_insider_learning/app/global_widgets/primary_button.dart';

import '../../../global_widgets/chapter_item.dart';
import '../controllers/lesson_controller.dart';

class LessonView extends GetView<LessonController> {
  const LessonView({super.key});
  @override
  Widget build(BuildContext context) {
    return PopScope(
      canPop: false,
      onPopInvokedWithResult: (didPop, result) {
        if (didPop) return;

        // Cek apakah detail chapter sedang dibuka
        if (controller.isDetailOpen.isTrue) {
          // Jika iya, tutup detail chapter ketika tekan tombol back
          controller.isDetailOpen.value = false;
        } else {
          // Jika tidak, kembali ke page sebelumnya
          Get.back();
        }
      },
      child: Scaffold(
        backgroundColor: Style.background01,
        body: SafeArea(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              AspectRatio(
                aspectRatio: 333 / 188,
                child: GetBuilder<LessonController>(
                  init: LessonController(),
                  initState: (_) {},
                  builder: (_) {
                    if (controller.podPlayerController != null) {
                      return PodVideoPlayer(
                        controller: controller.podPlayerController!,
                      );
                    } else {
                      // Course thumbnail
                      return Skeleton.leaf(
                        child: ColoredBox(
                          color: Colors.grey,
                          child: Image(
                            image: NetworkImage(
                              'https://www.classcentral.com/report/wp-content/uploads/2020/06/top-100-course-pandemic.png',
                            ),
                            errorBuilder:
                                (_, __, ___) => ColoredBox(
                                  color: Colors.grey,
                                  child: Icon(
                                    Icons.image_not_supported_rounded,
                                    color: Colors.grey[600],
                                  ),
                                ),
                          ),
                        ),
                      );
                    }
                  },
                ),
              ),
              Obx(() {
                return Expanded(
                  child: Visibility(
                    visible: controller.isDetailOpen.isTrue,
                    replacement: SingleChildScrollView(
                      child: Column(
                        children: [
                          Padding(
                            padding: const EdgeInsets.fromLTRB(16, 8, 16, 16),
                            child: Column(
                              children: [
                                Text(
                                  'ChatGPT & Midjourney: 23 Ways of Earning Money with AI',
                                  style: Fonts.mainText.copyWith(
                                    fontSize: 20,
                                    fontWeight: FontWeight.w500,
                                  ),
                                ),
                                SizedBox(height: 16),
                                Column(
                                  crossAxisAlignment:
                                      CrossAxisAlignment.stretch,
                                  children: [
                                    Row(
                                      children: [
                                        Expanded(
                                          child: Row(
                                            spacing: 6,
                                            children: [
                                              Text(
                                                'Created by',
                                                style: Fonts.mainText,
                                              ),
                                              Text(
                                                'Created by',
                                                style: Fonts.mainText.copyWith(
                                                  fontWeight: FontWeight.w500,
                                                ),
                                              ),
                                            ],
                                          ),
                                        ),
                                        Text(
                                          'in English',
                                          style: Fonts.mainText.copyWith(
                                            fontWeight: FontWeight.w500,
                                          ),
                                        ),
                                      ],
                                    ),
                                    SizedBox(height: 16),
                                    Row(
                                      children: [
                                        Text(
                                          '4 Chapter',
                                          style: Fonts.mainText,
                                        ),
                                        Padding(
                                          padding: EdgeInsets.symmetric(
                                            horizontal: 6,
                                          ),
                                          child: Icon(
                                            Icons.circle,
                                            color: Colors.white,
                                            size: 6,
                                          ),
                                        ),
                                        Text(
                                          '10 Lesson',
                                          style: Fonts.mainText,
                                        ),
                                        Padding(
                                          padding: EdgeInsets.symmetric(
                                            horizontal: 6,
                                          ),
                                          child: Icon(
                                            Icons.circle,
                                            color: Colors.white,
                                            size: 6,
                                          ),
                                        ),
                                        Text(
                                          '30m 15s Total Length',
                                          style: Fonts.mainText,
                                        ),
                                      ],
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          ),

                          // section: Chapter
                          Row(
                            children: [
                              _TabHeader(
                                text: 'Contents',
                                isActive: controller.tabIndex.value == 0,
                                onTap: () {
                                  controller.tabIndex.value = 0;
                                },
                              ),
                              _TabHeader(
                                text: 'More Like This',
                                isActive: controller.tabIndex.value == 1,
                                onTap: () {
                                  controller.tabIndex.value = 1;
                                },
                              ),
                            ],
                          ),
                          const SizedBox(height: 12),

                          if (controller.tabIndex.value == 0) ...[
                            Column(
                              children:
                                  List.generate(
                                    6,
                                    (index) => Padding(
                                      padding: const EdgeInsets.only(bottom: 8),
                                      child: ChapterItem(
                                        title: 'Chapter ${index + 1}',
                                        onTap: () async {
                                          controller.isDetailOpen.value = true;
                                          // controller.selectedChapterId =
                                          //     chapters[index].id;
                                          // controller.selectedChapterIsCompleted =
                                          //     chapters[index].isCompleted;
                                          // controller.selectedChapterIsFree =
                                          //     chapters[index].isFree;

                                          //
                                          await controller.initVideoPlayer(
                                            'https://flutter.github.io/assets-for-api-docs/assets/videos/butterfly.mp4',
                                          );
                                        },
                                      ),
                                    ),
                                  ).toList(),
                            ),
                          ] else if (controller.tabIndex.value == 1) ...[
                            Column(
                              children:
                                  List.generate(
                                    5,
                                    (index) => Padding(
                                      padding: const EdgeInsets.only(bottom: 8),
                                      child: ChapterItem(
                                        type: ChapterItemType.task,
                                        title: 'quiz[index].title',
                                        onTap: () {
                                          controller.isDetailOpen.value = true;
                                          // controller.selectedChapterId =
                                          //     quiz[index].id;
                                          // controller.selectedChapterIsCompleted =
                                          //     quiz[index].isCompleted;
                                          // controller.selectedChapterIsFree =
                                          //     quiz[index].isFree;
                                        },
                                      ),
                                    ),
                                  ).toList(),
                            ),
                          ],
                        ],
                      ),
                    ),
                    child: _DetailView(controller: controller),
                  ),
                );
              }),
              Padding(
                padding: const EdgeInsets.symmetric(
                  horizontal: Style.minimumMargin,
                  vertical: 8,
                ),
                child: Obx(() {
                  return Visibility(
                    visible: controller.isDetailOpen.isTrue,
                    replacement: PrimaryButton(title: 'Continue Last'),
                    child: Row(
                      spacing: 16,
                      children: [
                        ElevatedButton(
                          onPressed: () {},
                          style: ButtonStyle(
                            backgroundColor: WidgetStatePropertyAll(
                              Style.secondaryColor01,
                            ),
                            elevation: WidgetStatePropertyAll(0),
                            padding: WidgetStatePropertyAll(EdgeInsets.all(10)),
                            shape: WidgetStatePropertyAll(
                              RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(6),
                              ),
                            ),
                          ),
                          child: Icon(
                            Icons.arrow_back_ios_new_rounded,
                            size: 28,
                            color: Colors.white,
                          ),
                        ),
                        Expanded(
                          child: Row(
                            spacing: 8,
                            children: [
                              Text(
                                'Chapter 1 :',
                                maxLines: 1,
                                overflow: TextOverflow.ellipsis,
                                style: Fonts.mainText.copyWith(
                                  fontSize: 16,
                                  fontWeight: FontWeight.w500,
                                ),
                              ),
                              Expanded(
                                child: Text(
                                  'Welcome to 23 Ways of Earning Money with AI',
                                  maxLines: 1,
                                  overflow: TextOverflow.ellipsis,
                                  style: Fonts.mainText.copyWith(fontSize: 16),
                                ),
                              ),
                            ],
                          ),
                        ),
                        ElevatedButton(
                          onPressed: () {},
                          style: ButtonStyle(
                            backgroundColor: WidgetStatePropertyAll(
                              Style.secondaryColor01,
                            ),
                            elevation: WidgetStatePropertyAll(0),
                            padding: WidgetStatePropertyAll(EdgeInsets.all(10)),
                            shape: WidgetStatePropertyAll(
                              RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(6),
                              ),
                            ),
                          ),
                          child: Icon(
                            Icons.arrow_forward_ios_rounded,
                            size: 28,
                            color: Colors.white,
                          ),
                        ),
                      ],
                    ),
                  );
                }),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class _DetailView extends StatelessWidget {
  final LessonController controller;

  const _DetailView({required this.controller});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.all(16),
          child: Column(
            spacing: 8,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Text(
                'Lesson 2',
                style: Fonts.mainText.copyWith(fontWeight: FontWeight.w500),
              ),
              Text(
                'ChatGPT & Midjourney: 23 Ways of Earning Money with AI',
                style: Fonts.mainText.copyWith(
                  fontSize: 18,
                  fontWeight: FontWeight.w500,
                ),
              ),
              Row(
                children: [
                  Expanded(
                    child: Row(
                      spacing: 6,
                      children: [
                        Text('Created by', style: Fonts.mainText),
                        Text(
                          'Created by',
                          style: Fonts.mainText.copyWith(
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                      ],
                    ),
                  ),
                  Text(
                    'in English',
                    style: Fonts.mainText.copyWith(fontWeight: FontWeight.w500),
                  ),
                ],
              ),
            ],
          ),
        ),
        Expanded(
          child: ColoredBox(
            color: Style.darkGrey,
            child: ListView.separated(
              padding: EdgeInsets.only(top: 8, bottom: 40),
              separatorBuilder: (context, index) => Divider(),
              itemCount: 5,
              itemBuilder:
                  (context, index) => Padding(
                    padding: EdgeInsets.symmetric(horizontal: 24, vertical: 16),
                    child: Row(
                      spacing: 16,
                      children: [
                        ClipRRect(
                          borderRadius: BorderRadius.circular(6),
                          child: Image(
                            width: 116,
                            height: 60,
                            fit: BoxFit.cover,
                            image: NetworkImage(
                              'https://plus.unsplash.com/premium_photo-1682144187125-b55e638cf286?fm=jpg&q=60&w=3000&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxzZWFyY2h8MXx8cG9ydHJhaXQlMjBtYW58ZW58MHx8MHx8fDA%3D',
                            ),
                          ),
                        ),
                        Expanded(
                          child: Column(
                            spacing: 16,
                            crossAxisAlignment: CrossAxisAlignment.stretch,
                            children: [
                              Row(
                                spacing: 16,
                                children: [
                                  Expanded(
                                    child: Row(
                                      spacing: 4,
                                      children: [
                                        Text(
                                          'Lesson 1',
                                          style: Fonts.mainText.copyWith(
                                            fontWeight: FontWeight.w500,
                                            fontSize: 12,
                                          ),
                                        ),
                                        Icon(
                                          Icons.check,
                                          size: 12,
                                          color: Colors.white,
                                        ),
                                      ],
                                    ),
                                  ),
                                  Text(
                                    '02:30',
                                    style: Fonts.mainText.copyWith(
                                      fontSize: 12,
                                    ),
                                  ),
                                ],
                              ),
                              Text(
                                'Welcome to 23 Ways of Earning Money with AI',
                                style: Fonts.mainText.copyWith(
                                  fontWeight: FontWeight.w500,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
            ),
          ),
        ),
      ],
    );
  }
}

class _TabHeader extends StatelessWidget {
  final String text;
  final bool isActive;
  final void Function()? onTap;

  const _TabHeader({required this.text, this.isActive = false, this.onTap});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: EdgeInsets.symmetric(horizontal: 16, vertical: 8),
        decoration: BoxDecoration(
          color: isActive ? Style.darkGrey : null,
          borderRadius: BorderRadius.vertical(top: Radius.circular(8)),
        ),
        child: Text(
          text,
          style: Fonts.mainText.copyWith(
            color: isActive ? Colors.white : Style.lightGrey,
            fontWeight: isActive ? FontWeight.w600 : FontWeight.w500,
          ),
        ),
      ),
    );
  }
}
