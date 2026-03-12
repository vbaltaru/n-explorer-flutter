import 'package:dio/dio.dart';
import 'package:netflixshows/models/cast.dart';
import '../core/contrains.dart';
import '../models/shows.dart';

class ApiService {
  final Dio _dio = Dio();

  Future<List<TvShows>> fetchNetflixOriginals() async {
    try {
      final response = await _dio.get(
        '${AppConstants.baseUrl}/discover/tv',
        queryParameters: {
          'api_key': AppConstants.apiKey,
          'with_networks': AppConstants.netflixNetworkId,
          'sort_by': 'popularity.desc',
          'language': 'en-US',
        },
      );

      if (response.statusCode == 200) {
        if (response.data['results'] != null) {
          List<dynamic> results = response.data['results'];
          return results.map((json) => TvShows.fromJSON(json)).toList();
        } else {
          // If 'results' is null, return an empty list instead of crashing
          print("API returned 200 but 'results' was empty/null");
          return [];
        }
      }
      return [];
    } on DioException catch (e) {
      throw Exception('Network error: ${e.message}');
    } catch (e) {
      throw Exception('An unexpected error occurred: $e');
    }
  }

  Future<List<Cast>> fetchCast(int showId) async {
    try {
      final response = await _dio.get(
        '${AppConstants.baseUrl}/tv/$showId/credits',
        queryParameters: {'api_key': AppConstants.apiKey},
      );

      if (response.statusCode == 200) {
        List<dynamic> castData = response.data['cast'];
        return castData.map((json) => Cast.fromJson(json)).toList();
      } else {
        return [];
      }
    } catch (e) {
      return [];
    }
  }

  // Adaugă această funcție în clasa ApiService
  Future<List<TvShows>> searchShows(String query) async {
    try {
      final response = await _dio.get(
        '${AppConstants.baseUrl}/search/tv',
        queryParameters: {
          'api_key': AppConstants.apiKey,
          'query': query, // Textul căutat
        },
      );

      if (response.statusCode == 200) {
        List<dynamic> results = response.data['results'];
        return results.map((json) => TvShows.fromJSON(json)).toList();
      } else {
        return [];
      }
    } catch (e) {
      print("Search Error: $e");
      return [];
    }
  }

  Future<List<TvShows>> fetchTrendingShows() async {
    try {
      final response = await _dio.get(
        '${AppConstants.baseUrl}/trending/tv/week',
        queryParameters: {'api_key': AppConstants.apiKey},
      );

      if (response.statusCode == 200) {
        List<dynamic> results = response.data['results'];
        return results.map((json) => TvShows.fromJSON(json)).toList();
      }
      return [];
    } catch (e) {
      return [];
    }
  }

  Future<List<TvShows>> fetchTopRatedShows() async {
    try {
      final response = await _dio.get(
        '${AppConstants.baseUrl}/tv/top_rated',
        queryParameters: {'api_key': AppConstants.apiKey},
      );

      if (response.statusCode == 200) {
        List<dynamic> results = response.data['results'];
        return results.map((json) => TvShows.fromJSON(json)).toList();
      }
      return [];
    } catch (e) {
      return [];
    }
  }
}
