import 'dart:convert';
import 'dart:developer';

import 'package:movie_app_flutter/common/utils.dart';
import 'package:movie_app_flutter/models/movie_detailed_model.dart';
import 'package:movie_app_flutter/models/movie_recommendation_model.dart';
import 'package:movie_app_flutter/models/search_model.dart';
import 'package:movie_app_flutter/models/tv_series_model.dart';
import 'package:movie_app_flutter/models/upcoming_model.dart';
import 'package:http/http.dart' as http;

const baseUrl = "https://api.themoviedb.org/3/";
var key = "?api_key=$apiKey";
late String endPoint;

class ApiServices {
  Future<UpcomingMovieModel> getUpcomingMovies() async {
    endPoint = "movie/upcoming";
    final url = "$baseUrl$endPoint$key";

    final response = await http.get(Uri.parse(url));

    if (response.statusCode==200){
      log("Success");
      return UpcomingMovieModel.fromJson(jsonDecode(response.body));
    }
    throw Exception("Failure to load upcoming movies");
  }

  Future<UpcomingMovieModel> getNowPlayingMovies() async {
    endPoint = "movie/now_playing";
    final url = "$baseUrl$endPoint$key";

    final response = await http.get(Uri.parse(url));

    if (response.statusCode==200){
      log("Success");
      return UpcomingMovieModel.fromJson(jsonDecode(response.body));
    }
    throw Exception("Failure to load now playing movies");
  }

  Future<TvSeriesModel> getTopRatedSeries() async {
    endPoint = "tv/top_rated";
    final url = "$baseUrl$endPoint$key";

    final response = await http.get(Uri.parse(url));

    if (response.statusCode==200){
      log("Success");
      return TvSeriesModel.fromJson(jsonDecode(response.body));
    }
    throw Exception("Failure to load top rated Tv Series");
  }

  Future<SearchModel> getSearchedMovie(String searchText) async {
    endPoint = "search/movie?query=$searchText";
    final url = "$baseUrl$endPoint";

    final response = await http.get(Uri.parse(url), headers: {
      'Authorization' : "Bearer eyJhbGciOiJIUzI1NiJ9.eyJhdWQiOiJhMDNlNWQ1MGZhN2U0ZDdiNDk4YjhjODFmNDI4OGZhYyIsInN1YiI6IjY1ZWU0MTVjOTBmY2EzMDE4NjRjN2FjMiIsInNjb3BlcyI6WyJhcGlfcmVhZCJdLCJ2ZXJzaW9uIjoxfQ.F4ZOm8tVAAltTzfhWBrjkt1cptiOFPWTHDKvzFIE7p0"
    });

    if (response.statusCode==200){
      log("Success");
      return SearchModel.fromJson(jsonDecode(response.body));
    }
    throw Exception("Failed to load searched movie ");
  }

  Future<MovieRecommendationModel> getPopularMovies() async {
    endPoint = "movie/popular";
    final url = "$baseUrl$endPoint$key";

    final response = await http.get(Uri.parse(url));

    if (response.statusCode==200){
      log("Success");
      return MovieRecommendationModel.fromJson(jsonDecode(response.body));
    }
    throw Exception("Failure to load popular movies");
  }

  Future<MovieDetailedModel> getMovieDetail(int movieId) async {
    endPoint = "movie/$movieId";
    final url = "$baseUrl$endPoint$key";

    final response = await http.get(
      Uri.parse(url),
      );

    if (response.statusCode==200){
      log("Success");
      return MovieDetailedModel.fromJson(jsonDecode(response.body));
    }
    throw Exception("Failed to load movie details");
  }

  Future<MovieRecommendationModel> getMovieRecommendations(int movieId) async {
    endPoint = "movie/$movieId/recommendations";
    final url = "$baseUrl$endPoint$key";

    final response = await http.get(
      Uri.parse(url),
      );

    if (response.statusCode==200){
      log("Success");
      return MovieRecommendationModel.fromJson(jsonDecode(response.body));
    }
    throw Exception("Failed to load movie recommendations");
  }

}