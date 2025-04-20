import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:talent_insider_learning/app/core/themes/fonts.dart';

import '../../../core/themes/style.dart';
import '../controllers/audio_player_controller.dart';

class AudioPlayerView extends GetView<AudioPlayerController> {
  const AudioPlayerView({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Style.background01,
      body: SafeArea(
        child: Column(
          children: [
            Container(
              padding: EdgeInsets.all(16),
              color: Style.background01,
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                spacing: 4,
                children: [
                  Icon(Icons.keyboard_arrow_down_rounded, color: Colors.white),
                  Expanded(
                    child: Column(
                      spacing: 4,
                      children: [
                        Text(
                          'PLAYING FROM SEARCH',
                          style: Fonts.mainText.copyWith(
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                        Text(
                          '“UX” in Search',
                          style: Fonts.mainText.copyWith(
                            fontSize: 16,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                      ],
                    ),
                  ),
                  Icon(Icons.menu, color: Colors.white),
                ],
              ),
            ),
            Expanded(
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16),
                child: Column(
                  children: [
                    ClipRRect(
                      borderRadius: BorderRadius.circular(4),
                      child: Image(
                        height: 400,
                        fit: BoxFit.cover,
                        image: NetworkImage(
                          'https://i.ebayimg.com/images/g/a~UAAOSwRcRmLdcF/s-l1600.webp',
                        ),
                      ),
                    ),
                    Expanded(
                      child: Column(
                        children: [
                          SizedBox(height: 16),
                          Row(
                            spacing: 16,
                            children: [
                              Expanded(
                                child: Column(
                                  spacing: 8,
                                  children: [
                                    Text(
                                      'How to build intentional UX in an era of persuasive technology',
                                      maxLines: 1,
                                      overflow: TextOverflow.ellipsis,
                                      style: Fonts.mainText.copyWith(
                                        fontSize: 24,
                                        fontWeight: FontWeight.w600,
                                        height: 1,
                                      ),
                                    ),
                                    Row(
                                      children: [
                                        Text(
                                          'Emily',
                                          maxLines: 1,
                                          overflow: TextOverflow.ellipsis,
                                          style: Fonts.mainText.copyWith(
                                            fontSize: 18,
                                            fontWeight: FontWeight.w500,
                                            height: 1.5,
                                          ),
                                        ),
                                        Text('  •  ', style: Fonts.mainText),
                                        Text(
                                          'UI/UX Designer',
                                          maxLines: 1,
                                          overflow: TextOverflow.ellipsis,
                                          style: Fonts.mainText.copyWith(
                                            fontSize: 18,
                                            fontWeight: FontWeight.w300,
                                            height: 1.5,
                                          ),
                                        ),
                                      ],
                                    ),
                                  ],
                                ),
                              ),
                              Icon(
                                Icons.headphones,
                                color: Color(0xFFFFE485),
                                size: 22,
                              ),
                              Icon(
                                Icons.play_arrow_rounded,
                                color: Colors.white,
                              ),
                            ],
                          ),
                          SizedBox(height: 16),
                          Row(
                            spacing: 8,
                            children: [
                              Container(
                                padding: EdgeInsets.all(8),
                                decoration: BoxDecoration(
                                  color: Color(0xFF222326),
                                  borderRadius: BorderRadius.circular(8),
                                ),
                                child: Row(
                                  spacing: 8,
                                  children: [
                                    Icon(
                                      Icons.people,
                                      color: Colors.white,
                                      size: 16,
                                    ),
                                    Text(
                                      'Soft Skill',
                                      style: Fonts.mainText.copyWith(
                                        fontSize: 12,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                              Expanded(
                                child: Text(
                                  'Aug 4 • in English',
                                  textAlign: TextAlign.end,
                                  maxLines: 1,
                                  overflow: TextOverflow.ellipsis,
                                  style: Fonts.mainText.copyWith(
                                    fontWeight: FontWeight.w500,
                                  ),
                                ),
                              ),
                            ],
                          ),
                          SizedBox(height: 16),
                          Obx(() {
                            return Slider(
                              value: controller.position.value,
                              onChanged: (value) {
                                controller.position.value = value;
                              },
                              activeColor: Colors.white,
                              inactiveColor: Color(0xFF534F4F),
                              padding: EdgeInsets.all(0),
                              allowedInteraction: SliderInteraction.tapAndSlide,
                            );
                          }),
                          SizedBox(height: 8),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                '1:23',
                                style: Fonts.mainText.copyWith(
                                  color: Color(0xFFB8B7B5),
                                  fontWeight: FontWeight.w500,
                                ),
                              ),
                              Text(
                                '3:36',
                                style: Fonts.mainText.copyWith(
                                  color: Color(0xFFB8B7B5),
                                  fontWeight: FontWeight.w500,
                                ),
                              ),
                            ],
                          ),
                          Spacer(),
                          Obx(() {
                            return Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Icon(
                                  Icons.share_outlined,
                                  color: Colors.white,
                                  size: 30,
                                ),
                                Icon(
                                  Icons.skip_previous_rounded,
                                  color: Colors.white,
                                  size: 58,
                                ),
                                GestureDetector(
                                  onTap: () => controller.isPaused.toggle(),
                                  child: Icon(
                                    controller.isPaused.isTrue
                                        ? Icons.pause_circle_filled_rounded
                                        : Icons.play_circle_fill_rounded,
                                    color: Colors.white,
                                    size: 58,
                                  ),
                                ),
                                Icon(
                                  Icons.skip_next_rounded,
                                  color: Colors.white,
                                  size: 58,
                                ),
                                Icon(
                                  Icons.bookmark_border_rounded,
                                  color: Colors.white,
                                  size: 30,
                                ),
                              ],
                            );
                          }),
                          SizedBox(height: 16),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
