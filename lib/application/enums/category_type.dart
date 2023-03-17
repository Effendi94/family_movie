import '../app/constants/endpoint.dart';

enum CategoryType {
  popular,
  upcoming,
  topRated,
  nowPlaying,
}

class Category {
  static CategoryType? _type;
  static CategoryType? get type => _type;

  static set setType(CategoryType type) {
    _type = type;
  }

  static String get appbarTitle {
    switch (_type) {
      case CategoryType.upcoming:
        return 'Upcoming';
      case CategoryType.topRated:
        return 'Top Rated';
      case CategoryType.nowPlaying:
        return 'Now Playing';
      default:
        return 'Popular';
    }
  }

  static String get endpoint {
    switch (_type) {
      case CategoryType.upcoming:
        return EndPoint.upcomingMovie;
      case CategoryType.topRated:
        return EndPoint.topRatedMovie;
      case CategoryType.nowPlaying:
        return EndPoint.nowPlayingMovie;
      default:
        return EndPoint.popularMovie;
    }
  }
}
