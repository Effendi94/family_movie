import 'package:family_movie/application/models/movie/video_data.dart';
import 'package:stacked/stacked.dart';

import '../../apis/tv_api.dart';
import '../app/app.locator.dart';
import '../models/movie/tv.dart';

mixin TVMixin on BaseViewModel {
  final _tvApi = locator<TVAPI>();
  List<TvData> listTVOnTheAir = [];
  List<TvData> listTVPopular = [];
  List<TvData> listTVTopRated = [];
  List<String> listTVVideoKey = [];

  bool tvOnTheAirHasError = false;
  bool tvPopularHasError = false;

  int page = 1;

  String getVideoKey(List<VideoData> videoData) {
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

  Future<void> getTVOnTheAir() async {
    final res = await runBusyFuture(
      _tvApi.fetchTVOnTheAir(page),
    );
    res.fold((l) {
      tvOnTheAirHasError = true;
    }, (res) {
      listTVOnTheAir = res.results ?? [];
    });

    notifyListeners();
  }

  Future<void> getTVPopular() async {
    final res = await runBusyFuture(
      _tvApi.fetchTVPopular(page),
    );
    res.fold((l) {
      tvPopularHasError = true;
    }, (res) {
      listTVPopular = res.results ?? [];
    });

    notifyListeners();
  }

  Future<void> getTVTopRated() async {
    final res = await runBusyFuture(
      _tvApi.fetchTVTopRated(page),
    );
    res.fold((l) {}, (res) {
      listTVTopRated = res.results ?? [];
    });

    notifyListeners();
  }

  Future<void> getTVTopRatedVideos() async {
    await getTVTopRated();
    final dataList = listTVTopRated.take(5).toList();
    for (var item in dataList) {
      final res = await runBusyFuture(
        _tvApi.fetchTVVideos('${item.id}'),
      );
      res.fold((l) {}, (res) {
        final String videoKey = getVideoKey(res);
        if (videoKey.isNotEmpty) {
          listTVVideoKey.add(videoKey);
        }
      });
    }
    notifyListeners();
  }
}
