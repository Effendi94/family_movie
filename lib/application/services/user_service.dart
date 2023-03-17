import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:observable_ish/observable_ish.dart';
import 'package:stacked/stacked.dart';

class UserService with ReactiveServiceMixin {
  final RxValue<String> _movieAPIKey =
      RxValue<String>(dotenv.env['MOVIE_API_KEY'] ?? '');

  String get movieAPIKey => _movieAPIKey.value;
}
