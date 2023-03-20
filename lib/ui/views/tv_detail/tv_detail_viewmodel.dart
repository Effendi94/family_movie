import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';
import 'package:youtube_player_flutter/youtube_player_flutter.dart';

import '../../../apis/tv_api.dart';
import '../../../application/app/app.locator.dart';
import '../../../application/models/movie/review.dart';
import '../../../application/models/movie/tv.dart';
import '../../../application/models/movie/video_data.dart';

class TVDetailViewModel extends BaseViewModel {
  final _navigationService = locator<NavigationService>();
  // final _snackbarService = locator<SnackbarService>();
  final _tvAPI = locator<TVAPI>();

  TvData tvData = TvData();
  List<VideoData> videoData = [];
  List<ReviewData> reviewData = [];
  late YoutubePlayerController videoPlayerController;

  String get videoKey {
    String result = '';
    final int index =
        videoData.indexWhere((e) => e.type?.toLowerCase() == 'trailer');
    if (index.isNegative) {
      if (videoData.isNotEmpty) result = videoData[0].key ?? '';
    } else {
      result = videoData[index].key ?? '';
    }
    return result;
  }

  void initData(tvId) async {
    await getVideoKey(tvId);
    await getTVDetail(tvId);
    await prepareVideo();
    await getTVReview(tvId);
    if (hasError) {
      dispose();
      return;
    }
  }

  Future<void> prepareVideo() async {
    videoPlayerController = YoutubePlayerController(
      initialVideoId: videoKey,
      flags: const YoutubePlayerFlags(
        autoPlay: false,
        mute: false,
      ),
    );
    notifyListeners();
  }

  Future<void> getVideoKey(String tvId) async {
    final res = await runBusyFuture(
      _tvAPI.fetchTVVideos(tvId),
    );
    res.fold((l) {
      throw Exception(l.statusMessage);
    }, (r) {
      videoData = r;
    });

    notifyListeners();
  }

  Future<void> getTVDetail(String tvId) async {
    final res = await runBusyFuture(
      _tvAPI.fetchTvDetail(tvId),
    );
    res.fold((l) {
      throw Exception(l.statusMessage);
    }, (r) {
      tvData = r;
    });
    notifyListeners();
  }

  Future<void> getTVReview(String tvId) async {
    final res = await runBusyFuture(
      _tvAPI.fetchTVReview(tvId),
    );
    res.fold((l) {
      throw Exception(l.statusMessage);
    }, (r) {
      reviewData = r;
    });
    notifyListeners();
  }

  void navigateBack() {
    _navigationService.back();
  }

  @override
  void dispose() {
    videoPlayerController.dispose();
    super.dispose();
  }
}
