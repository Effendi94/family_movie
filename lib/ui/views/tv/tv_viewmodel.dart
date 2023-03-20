import 'package:carousel_slider/carousel_slider.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';
import 'package:youtube_player_flutter/youtube_player_flutter.dart';

import '../../../application/app/app.locator.dart';
import '../../../application/app/app.router.dart';
import '../../../application/enums/category_type.dart';
import '../../../application/mixins/tv_mixin.dart';

class TVViewModel extends FutureViewModel with TVMixin {
  final _navigationService = locator<NavigationService>();

  List<YoutubePlayerController> lYTC = [];
  CarouselController carouselController = CarouselController();
  Map<String, dynamic> cStates = {};
  bool playerIsReady = false;
  int currentPageIndex = 0;

  void fillYTlists() {
    for (var element in listTVVideoKey) {
      String id = YoutubePlayer.convertUrlToId(element)!;
      int index = listTVVideoKey.indexOf(element);
      YoutubePlayerController ytController = YoutubePlayerController(
        initialVideoId: id,
        flags: const YoutubePlayerFlags(
          autoPlay: false,
          mute: true,
          disableDragSeek: true,
          hideControls: true,
        ),
      );
      if (index == 0) {
        ytController.addListener(() {
          ytController.play();
        });
      }
      lYTC.add(ytController);
    }
    playerIsReady = true;
    notifyListeners();
  }

  void onPageCarouselChanged(int index) {
    for (var item in lYTC) {
      item.pause();
      item.reset();
    }
    lYTC[index].play();
    currentPageIndex = index;
    notifyListeners();
  }

  void navigateToCategory(CategoryType categoryType) {
    Category.setType = categoryType;

    _navigationService.navigateTo(Routes.categoryView);
  }

  void goToTVDetail(int? tvId) {
    for (var item in lYTC) {
      item.pause();
      item.reset();
    }
    _navigationService.navigateTo(
      Routes.tvDetailview,
      arguments: TvDetailviewArguments(tvId: tvId),
    );
  }

  @override
  void dispose() {
    for (var item in lYTC) {
      item.dispose();
    }
    super.dispose();
  }

  @override
  Future futureToRun() async {
    await Future.wait([
      getTVOnTheAir(),
      getTVPopular(),
      getTVTopRatedVideos(),
    ]);
    fillYTlists();
  }
}
