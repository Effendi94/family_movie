enum Flavor { dev, prod }

extension FlavorName on Flavor {
  String get name => toString().split('.').last;
}

class F {
  static Flavor? appFlavor;

  static String get name => appFlavor?.name ?? '';

  static final Map<String, dynamic> sharedMap = {};

  static final devMap = {
    'baseURL': 'https://api.themoviedb.org',
    ...sharedMap,
  };

  static final prodMap = {
    'baseURL': 'https://api.themoviedb.org',
    ...sharedMap,
  };

  static Map<String, dynamic> get variables {
    switch (appFlavor) {
      case Flavor.dev:
        return devMap;
      case Flavor.prod:
        return prodMap;

      default:
        return devMap;
    }
  }
}
