import '../app/constants/endpoint.dart';

enum SearchType {
  movie,
  tv,
}

class Search {
  static SearchType? _type = SearchType.movie;
  static SearchType? get type => _type;

  static set setType(SearchType type) {
    _type = type;
  }

  static String get endpoint {
    switch (_type) {
      case SearchType.movie:
        return EndPoint.searchMovie;
      case SearchType.tv:
        return EndPoint.searchTV;
      default:
        return EndPoint.searchMovie;
    }
  }
}
