class EndPoint {
  static const imdbImagePath = 'https://image.tmdb.org/t/p/w500/%PATH%';
  static const imdbVideoPath =
      'https://www.themoviedb.org/video/play?key=%VIDEO_KEY%';

  static const nowPlayingMovie = '/3/movie/now_playing';
  static const popularMovie = '/3/movie/popular';
  static const topRatedMovie = '/3/movie/top_rated';
  static const upcomingMovie = '/3/movie/upcoming';
  static const detailMovie = '/3/movie/%MOVIE_ID%';
  static const videoMovie = '/3/movie/%MOVIE_ID%/videos';
  static const searchByKeyword = '/3/search/keyword';
  static const searchMovie = '/3/search/movie';
  static const searchTV = '/3/search/tv';
}
