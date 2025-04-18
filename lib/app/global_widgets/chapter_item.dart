import 'package:flutter/material.dart';
import 'package:talent_insider_learning/app/core/themes/fonts.dart';

enum ChapterItemType { chapter, task, file }

class ChapterItem extends StatelessWidget {
  final ChapterItemType type;
  final String title;

  /// Penanda apakah chapter bisa diakses
  final bool isLocked;
  final void Function()? onTap;

  const ChapterItem({
    super.key,
    this.type = ChapterItemType.chapter,
    required this.title,
    this.isLocked = false,
    this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(6),
        border: Border.all(color: Colors.grey),
      ),
      child: Material(
        color: Colors.transparent,
        borderRadius: BorderRadius.circular(6),
        child: InkWell(
          borderRadius: BorderRadius.circular(6),
          onTap:
              (onTap == null)
                  ? null
                  : () {
                    if (!isLocked) {
                      onTap!();
                    }
                  },
          child: Padding(
            padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 12),
            child: Row(
              children: [
                if (isLocked) ...[
                  Icon(Icons.lock, color: Colors.grey[500]),
                ] else if (type == ChapterItemType.file) ...[
                  Icon(Icons.file_copy_outlined, color: Colors.grey[500]),
                ] else ...[
                  Icon(
                    Icons.play_circle_filled_rounded,
                    color:
                        type == ChapterItemType.task
                            ? Colors.grey[700]
                            : const Color(0xFF6ABB87),
                  ),
                ],
                const SizedBox(width: 12),
                Expanded(
                  child: Text(
                    title,
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                    style: Fonts.mainText,
                  ),
                ),

                // suffix text (Hanya muncul ketika chapter bertype file)
                if (type == ChapterItemType.file) ...[
                  Padding(
                    padding: const EdgeInsets.only(left: 12),
                    child: Text('Download'),
                  ),
                ],
              ],
            ),
          ),
        ),
      ),
    );
  }
}
