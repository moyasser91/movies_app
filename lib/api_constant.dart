import 'package:movies/home_screen.dart';

class ApiConstant{

  static String apiKey = '061499f77a3685040106058efb5fe4d1';
  static String apiToken = ' eyJhbGciOiJIUzI1NiJ9.eyJhdWQiOiIwNjE0OTlmNzdhMzY4NTA0MDEwNjA1OGVmYjVmZTRkMSIsIm5iZiI6MTcyNzA5Nzk5My41NjAyNjMsInN1YiI6IjY2ZjE2NThlYTk3ODgwMTQ4ZjNiMTY1MiIsInNjb3BlcyI6WyJhcGlfcmVhZCJdLCJ2ZXJzaW9uIjoxfQ.YamGzh3S3kly0mfgUtbxHcF3YfuhFBofx39THSrEJzM';
  ///=================================================================================
  static String popularUSA =
      'https://api.themoviedb.org/3/movie/popular?api_key=$apiKey&language=en-US&page=5&page=2';
  static String popularEgypt =
      'https://api.themoviedb.org/3/movie/popular?api_key=$apiKey&language=ar&region=EG&page=12&page=15&page=4';
  static String upComingUSA =
      'https://api.themoviedb.org/3/movie/upcoming?api_key=$apiKey&language=en-US&page=7&page=1';
  static String upComingEgypt =
      'https://api.themoviedb.org/3/movie/upcoming?api_key=$apiKey&language=ar&region=EG&page=13';
  static String topRatedUSA =
      'https://api.themoviedb.org/3/movie/top_rated?api_key=$apiKey&language=en-US&page=13&page=2';
  static String topRatedEgypt =
      'https://api.themoviedb.org/3/movie/top_rated?api_key=$apiKey&language=ar&region=EG&page=1&page=7';

}