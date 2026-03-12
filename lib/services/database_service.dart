import 'dart:convert';
import 'package:shared_preferences/shared_preferences.dart';
import '../models/shows.dart';

class DatabaseService {
  static const String _key = 'my_list';

  // Salvează un serial în listă
  Future<void> addToMyList(TvShows show) async {
    final prefs = await SharedPreferences.getInstance();
    List<TvShows> currentList = await getMyList();

    // Verificăm dacă nu cumva e deja în listă (după ID)
    if (!currentList.any((item) => item.id == show.id)) {
      currentList.add(show);
      // Convertim lista de obiecte în text JSON pentru a o putea salva
      List<String> jsonList = currentList
          .map(
            (item) => jsonEncode({
              'id': item.id,
              'name': item.title,
              'overview': item.overview,
              'poster_path': item.posterPath,
              'vote_average': item.rating,
              'first_air_date': item.firstAirDate,
            }),
          )
          .toList();

      await prefs.setStringList(_key, jsonList);
    }
  }

  // Citește lista salvată
  Future<List<TvShows>> getMyList() async {
    final prefs = await SharedPreferences.getInstance();
    List<String>? jsonList = prefs.getStringList(_key);

    if (jsonList == null) return [];

    return jsonList.map((item) => TvShows.fromJSON(jsonDecode(item))).toList();
  }

  // Șterge un serial din listă (pentru butonul "X" din screen_3.jpg)
  Future<void> removeFromMyList(int showId) async {
    final prefs = await SharedPreferences.getInstance();
    List<TvShows> currentList = await getMyList();

    currentList.removeWhere((item) => item.id == showId);

    List<String> jsonList = currentList
        .map(
          (item) => jsonEncode({
            'id': item.id,
            'name': item.title,
            'overview': item.overview,
            'poster_path': item.posterPath,
            'vote_average': item.rating,
            'first_air_date': item.firstAirDate,
          }),
        )
        .toList();

    await prefs.setStringList(_key, jsonList);
  }
}
