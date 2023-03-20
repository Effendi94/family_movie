import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';
import 'package:youtube_player_flutter/youtube_player_flutter.dart';

import '../../../apis/movie_api.dart';
import '../../../application/app/app.locator.dart';
import '../../../application/app/constants/custom_colors.dart';
import '../../../application/enums/snackbar_type.dart';
import '../../../application/helpers/format_utils.dart';
import '../../../application/models/movie/movie.dart';
import '../../../application/models/movie/review.dart';
import '../../../application/models/movie/video_data.dart';

class MovieDetailViewModel extends BaseViewModel {
  final _navigationService = locator<NavigationService>();
  final _snackbarService = locator<SnackbarService>();
  final _movieApi = locator<MovieAPI>();

  MovieData movieData = MovieData();
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

  // String get videoUrl =>
  //     EndPoint.imdbVideoPath.replaceAll('%VIDEO_KEY%', videoKey);
  String get fixedVoteAverage =>
      FormatUtils.convertToDouble(movieData.voteAverage?.toStringAsFixed(1))
          .toString();

  void initData(movieId) async {
    await getVideoKey(movieId);
    await getMovieDetail(movieId);
    await prepareVideo();
    await getMovieReview(movieId);
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

  Future<void> getVideoKey(String movieId) async {
    final res = await runBusyFuture(
      _movieApi.fetchVideo(movieId),
    );
    res.fold((l) {
      throw Exception(l.statusMessage);
    }, (r) {
      videoData = r;
    });

    notifyListeners();
  }

  Future<void> getMovieDetail(String movieId) async {
    final res = await runBusyFuture(
      _movieApi.fetchMovieDetail(movieId),
    );
    res.fold((l) {
      throw Exception(l.statusMessage);
    }, (r) {
      movieData = r;
    });
    notifyListeners();
  }

  Future<void> getMovieReview(String movieId) async {
    final res = await runBusyFuture(
      _movieApi.fetchMovieReview(movieId),
    );
    res.fold((l) {
      throw Exception(l.statusMessage);
    }, (r) {
      reviewData = r;
    });
    notifyListeners();
  }

  void onTapWatchMovie(BuildContext context) {
    _snackbarService.showCustomSnackBar(
      onTap: () => _navigationService.back(),
      duration: const Duration(seconds: 3),
      variant: SnackbarType.info,
      title: 'Info',
      message: 'Currently Not Available',
      titleTextStyle: Theme.of(context).textTheme.bodyLarge?.copyWith(
            color: CustomColors.textPrimary,
            fontWeight: FontWeight.bold,
          ),
      messageTextStyle: Theme.of(context).textTheme.bodyMedium?.copyWith(
            color: CustomColors.textPrimary,
          ),
    );
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
