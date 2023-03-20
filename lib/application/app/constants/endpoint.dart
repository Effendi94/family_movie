class EndPoint {
  static const imdbImagePath = 'https://image.tmdb.org/t/p/w500/%PATH%';
  static const imdbVideoPath =
      'https://www.themoviedb.org/video/play?key=%VIDEO_KEY%';

  static const nowPlayingMovie = '/3/movie/now_playing';
  static const popularMovie = '/3/movie/popular';
  static const topRatedMovie = '/3/movie/top_rated';
  static const upcomingMovie = '/3/movie/upcoming';
  static const tvOnTheAir = '/3/tv/on_the_air';
  static const tvPopular = '/3/tv/popular';
  static const tvTopRated = '/3/tv/top_rated';
  static const detailMovie = '/3/movie/%MOVIE_ID%';
  static const videoMovie = '/3/movie/%MOVIE_ID%/videos';
  static const videoTV = '/3/tv/%TV_ID%/videos';
  static const searchByKeyword = '/3/search/keyword';
  static const searchMovie = '/3/search/movie';
  static const searchTV = '/3/search/tv';
}
