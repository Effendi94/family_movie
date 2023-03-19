import 'package:observable_ish/observable_ish.dart';
import 'package:stacked/stacked.dart';

class UserService with ReactiveServiceMixin {
  final RxValue<String> _movieAPIKey =
      RxValue<String>('f64ecc25063defa27e22c622dfa27b24');

  String get movieAPIKey => _movieAPIKey.value;
}
