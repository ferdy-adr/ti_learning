import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:talent_insider_learning/app/routes/app_pages.dart';

import '../../../core/themes/fonts.dart';
import '../../../core/themes/style.dart';
import '../../../global_widgets/custom_appbar.dart';
import '../controllers/audio_book_controller.dart';

class AudioBookView extends GetView<AudioBookController> {
  const AudioBookView({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Style.background01,
      appBar: CustomAppBar(title: 'Audio Book'),
      body: SafeArea(
        child: ListView(
          padding: EdgeInsets.all(Style.minimumMargin),
          children: [
            Text(
              'Best-sellers',
              style: Fonts.poppins.copyWith(
                fontSize: 18,
                fontWeight: FontWeight.w500,
              ),
            ),
            SizedBox(height: 16),
            SizedBox(
              height: 250,
              child: ListView.separated(
                clipBehavior: Clip.none,
                scrollDirection: Axis.horizontal,
                itemCount: 6,
                separatorBuilder: (_, __) => SizedBox(width: 24),
                itemBuilder:
                    (_, index) => GestureDetector(
                      onTap: () => Get.toNamed(Routes.AUDIO_PLAYER),
                      child: ConstrainedBox(
                        constraints: BoxConstraints(maxWidth: 120),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            ClipRRect(
                              borderRadius: BorderRadius.circular(8),
                              child: Image(
                                height: 185,
                                fit: BoxFit.cover,
                                image: NetworkImage(
                                  'https://nonfictionauthorsassociation.com/wp-content/uploads/2018/08/Cover-Nonfiction-Book-Publishing-Plan-Final800.jpg',
                                ),
                                errorBuilder:
                                    (_, __, ___) => Container(
                                      height: 185,
                                      width: double.infinity,
                                      decoration: BoxDecoration(
                                        color: Colors.grey,
                                      ),
                                      child: Icon(
                                        Icons.broken_image,
                                        color: Colors.grey[700],
                                      ),
                                    ),
                              ),
                            ),
                            Padding(
                              padding: EdgeInsets.symmetric(vertical: 12),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.stretch,
                                spacing: 4,
                                children: [
                                  Text(
                                    'Nobody Knows But You',
                                    maxLines: 1,
                                    overflow: TextOverflow.ellipsis,
                                    style: Fonts.poppins.copyWith(
                                      fontSize: 14,
                                      fontWeight: FontWeight.w500,
                                      letterSpacing: 0,
                                    ),
                                  ),
                                  Text(
                                    'Kev Freeman',
                                    maxLines: 1,
                                    overflow: TextOverflow.ellipsis,
                                    style: Fonts.poppins.copyWith(
                                      fontSize: 12,
                                      fontWeight: FontWeight.w300,
                                      letterSpacing: 0,
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
            SizedBox(height: 32),
            Text(
              'More Books',
              style: Fonts.poppins.copyWith(
                fontSize: 18,
                fontWeight: FontWeight.w500,
              ),
            ),
            SizedBox(height: 16),
            Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: List.generate(5, (index) => _AudioBookItem()),
            ),
          ],
        ),
      ),
    );
  }
}

class _AudioBookItem extends StatelessWidget {
  const _AudioBookItem();

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 16),
      child: GestureDetector(
        onTap: () => Get.toNamed(Routes.AUDIO_PLAYER),
        child: Row(
          spacing: 16,
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(8),
              child: Image(
                width: 60,
                height: 60,
                fit: BoxFit.cover,
                image: NetworkImage(
                  'https://nonfictionauthorsassociation.com/wp-content/uploads/2018/08/Cover-Nonfiction-Book-Publishing-Plan-Final800.jpg',
                ),
              ),
            ),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  Row(
                    children: [
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.stretch,
                          children: [
                            Text(
                              'Nobody Knows But You',
                              maxLines: 1,
                              overflow: TextOverflow.ellipsis,
                              style: Fonts.poppins.copyWith(
                                fontSize: 14,
                                fontWeight: FontWeight.w500,
                                letterSpacing: 0,
                              ),
                            ),
                            Text(
                              'Kev Freeman',
                              maxLines: 1,
                              overflow: TextOverflow.ellipsis,
                              style: Fonts.poppins.copyWith(
                                fontSize: 12,
                                fontWeight: FontWeight.w300,
                                letterSpacing: 0,
                              ),
                            ),
                          ],
                        ),
                      ),
                      Icon(Icons.bookmark_border_rounded, color: Colors.white),
                    ],
                  ),
                  SizedBox(height: 8),
                  Row(
                    children: [
                      Expanded(
                        child: Text(
                          '16 Chapters',
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis,
                          style: Fonts.poppins.copyWith(
                            fontSize: 10,
                            fontWeight: FontWeight.w500,
                            letterSpacing: 0,
                          ),
                        ),
                      ),
                      Icon(Icons.headphones, size: 12, color: Colors.white),
                      SizedBox(width: 4),
                      Text(
                        '45m',
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                        style: Fonts.poppins.copyWith(
                          fontSize: 10,
                          fontWeight: FontWeight.w500,
                          letterSpacing: 0,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
