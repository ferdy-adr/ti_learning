import 'package:get/get.dart';
import 'package:pod_player/pod_player.dart';

import '../../../core/utils/prompt_utils.dart';

class LessonController extends GetxController {
  final videoPlayerController = VideoPlayerController.networkUrl(
    Uri.parse(
      'https://flutter.github.io/assets-for-api-docs/assets/videos/butterfly.mp4',
    ),
  );
  PodPlayerController? podPlayerController;

  RxInt tabIndex = 0.obs;
  RxBool isDetailOpen = false.obs;

  // Detail Chapter
  String selectedChapterId = '';
  bool selectedChapterIsCompleted = false;
  bool selectedChapterIsFree = false;
  bool isVideoHasCheckedComplete = false;

  @override
  void onClose() {
    podPlayerController?.dispose();
    super.onClose();
  }

  Future<void> initVideoPlayer(String videoUrl) async {
    // step 1: Buat variable untuk menampung source video
    PlayVideoFrom videoSource = PlayVideoFrom.network(videoUrl);

    // step 2: Cek apakah link `videoUrl` merupakan link youtube
    if (_isYoutubeLink(videoUrl)) {
      // Jika iya, ganti value penampung dengan source video dari youtube
      videoSource = PlayVideoFrom.youtube(videoUrl);
    }

    // step 3: Inisialisasi controller
    if (podPlayerController != null) {
      // Ganti video jika player controller sudah diinisialisasi
      await podPlayerController!.changeVideo(
        playVideoFrom: videoSource,
        playerConfig: const PodPlayerConfig(autoPlay: false),
      );

      isVideoHasCheckedComplete = false;
    } else {
      // Inisialisasi player controller
      podPlayerController = PodPlayerController(
        playVideoFrom: videoSource,
        podPlayerConfig: const PodPlayerConfig(autoPlay: false),
      );
    }

    if (podPlayerController != null) {
      if (!selectedChapterIsCompleted) {
        // Tambahkan listener `checkVideo` jika chapter belum selesai
        podPlayerController!.addListener(_checkVideoListener);
      }

      await podPlayerController!.initialise().then((_) {
        // Update state GetBuilder untuk mentrigger perubahan UI
        update();
      });
    }
  }

  /// Untuk menentukan apakah merupakan link Youtube
  bool _isYoutubeLink(String link) {
    RegExp regExp = RegExp(
      r'^https?:\/\/(?:www\.)?youtube\.com\/(?:watch\?.*v=|embed\/|v\/|shorts\/)([\w-]+)',
      caseSensitive: false,
    );
    return regExp.hasMatch(link);
  }

  // Listener untuk mengecek timeline video pada posisi akhir video
  void _checkVideoListener() {
    print('DONE STATUS ${podPlayerController!.videoPlayerValue?.isCompleted}');

    // dev: Sementara disable dahulu
    if ((podPlayerController?.videoPlayerValue?.isCompleted ?? false) &&
        !isVideoHasCheckedComplete) {
      completeVideo(chapterId: selectedChapterId);
      isVideoHasCheckedComplete = true;
    }
  }

  void completeVideo({required String chapterId}) async {
    // step 1: Mulai widget loading
    PromptUtils.showLoading();

    // step 2: Jalankan usecase (Dummy)
    await Future.delayed(Duration(seconds: 2));

    // step 3: Hentikan widget loading
    PromptUtils.hideLoading();

    // step 4: Return
    Get.snackbar('Chapter completed', '');
  }
}
