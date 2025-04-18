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
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Icon(
                            Icons.share_outlined,
                            color: Colors.white,
                            size: 30,
                          ),
                          Icon(
                            Icons.skip_previous,
                            color: Colors.white,
                            size: 58,
                          ),
                          Icon(
                            controller.isPaused.isTrue
                                ? Icons.pause_circle_filled
                                : Icons.play_circle_fill,
                            color: Colors.white,
                            size: 58,
                          ),
                          Icon(Icons.skip_next, color: Colors.white, size: 58),
                          Icon(
                            Icons.bookmark_border_rounded,
                            color: Colors.white,
                            size: 30,
                          ),
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
