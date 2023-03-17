import '../helpers/format_utils.dart';
import 'static.dart';

class Movie {
  Movie({
    // required this.dates,
    this.page,
    this.results,
    this.totalPages,
    this.totalResults,
  });
  // late final Dates dates;
  int? page;
  List<MovieData>? results;
  int? totalPages = 0;
  int? totalResults = 0;

  Movie.fromJson(Map<String, dynamic> json) {
    // dates = Dates.fromJson(json['dates']);
    page = json['page'];
    results = [];
    if (json['results'] != null) {
      results =
          List.from(json['results']).map((e) => MovieData.fromJson(e)).toList();
    }
    totalPages = json['total_pages'];
    totalResults = json['total_results'];
  }

  Map<String, dynamic> toJson() {
    final data = <String, dynamic>{};
    // _data['dates'] = dates.toJson();
    data['page'] = page;
    data['results'] = results?.map((e) => e.toJson()).toList();
    data['total_pages'] = totalPages;
    data['total_results'] = totalResults;
    return data;
  }
}

class MovieData {
  MovieData({
    this.adult,
    this.backdropPath,
    this.id,
    this.originalLanguage,
    this.originalTitle,
    this.overview,
    this.popularity,
    this.posterPath,
    this.releaseDate,
    this.title,
    this.video,
    this.voteAverage,
    this.voteCount,
    this.budget,
    this.homepage,
    this.imdbId,
    this.revenue,
    this.runtime,
    this.status,
    this.tagline,
    this.genreIds,
    // this.belongsToCollection,
    // this.genres,
    // this.productionCompanies,
    // this.productionCountries,
    // this.spokenLanguages,
  });
  bool? adult;
  String? backdropPath;
  int? id;
  String? originalLanguage;
  String? originalTitle;
  String? overview;
  double? popularity;
  String? posterPath;
  String? releaseDate;
  String? title;
  bool? video;
  double? voteAverage;
  int? voteCount;
  int? budget;
  String? homepage;
  String? imdbId;
  int? revenue;
  int? runtime;
  String? status;
  String? tagline;
  List<int>? genreIds;
  // BelongsToCollection? belongsToCollection;
  List<StaticModel>? genres;
  // List<ProductionCompany>? productionCompanies;
  // List<ProductionCountry>? productionCountries;
  // List<SpokenLanguage>? spokenLanguages;

  MovieData.fromJson(Map<String, dynamic> json) {
    adult = json["adult"];
    backdropPath = json["backdrop_path"];
    id = json["id"];
    originalLanguage = json["original_language"];
    originalTitle = json["original_title"];
    overview = json["overview"];
    popularity = FormatUtils.convertToDouble(json["popularity"]);
    posterPath = json["poster_path"];
    releaseDate = json["release_date"];
    title = json["title"];
    video = json["video"];
    voteAverage = FormatUtils.convertToDouble(json["vote_average"]);
    voteCount = json["vote_count"];
    budget = json["budget"];
    homepage = json["homepage"];
    imdbId = json["imdb_id"];
    revenue = json["revenue"];
    runtime = json["runtime"];
    status = json["status"];
    tagline = json["tagline"];
    genreIds = [];
    if (json["genre_ids"] != null) {
      genreIds = List<int>.from(json["genre_ids"]).map((x) => x).toList();
    }

    // belongsToCollection =
    //     BelongsToCollection.fromJson(json["belongs_to_collection"]);
    genres = [];
    if (json["genres"] != null) {
      genres = List.from(json["genres"])
          .map((x) => StaticModel.fromJson(x))
          .toList();
    }
    // productionCompanies = List<ProductionCompany>.from(
    //     json["production_companies"].map((x) => ProductionCompany.fromJson(x)));
    // productionCountries = List<ProductionCountry>.from(
    //     json["production_countries"].map((x) => ProductionCountry.fromJson(x)));
    // spokenLanguages = List<SpokenLanguage>.from(
    //     json["spoken_languages"].map((x) => SpokenLanguage.fromJson(x)));
  }

  Map<String, dynamic> toJson() {
    final data = <String, dynamic>{};
    data['adult'] = adult;
    data['backdrop_path'] = backdropPath;
    data['id'] = id;
    data['original_language'] = originalLanguage;
    data['original_title'] = originalTitle;
    data['overview'] = overview;
    data['popularity'] = popularity;
    data['poster_path'] = posterPath;
    data['release_date'] = releaseDate;
    data['title'] = title;
    data['video'] = video;
    data['vote_average'] = voteAverage;
    data['vote_count'] = voteCount;
    data['budget'] = budget;
    data['homepage'] = homepage;
    data['imdb_id'] = imdbId;
    data['revenue'] = revenue;
    data['runtime'] = runtime;
    data['status'] = status;
    data['tagline'] = tagline;
    data['genre_ids'] = List<dynamic>.from(genreIds!.map((x) => x));
    // data['belongs_to_collection'] = belongsToCollection.toJson();
    data['genres'] = genres?.map((e) => e.toJson()).toList();
    // data['production_companies'] =
    //     productionCompanies.map((e) => e.toJson()).toList();
    // data['production_countries'] =
    //     productionCountries.map((e) => e.toJson()).toList();
    // data['spoken_languages'] = spokenLanguages.map((e) => e.toJson()).toList();
    return data;
  }
}
