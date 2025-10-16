import 'dart:convert';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:youtube_bloc_pattern/models/video.dart';

class FavoriteBloc extends Cubit<Map<String, Video>> {
  FavoriteBloc() : super({}) {
    _loadFavorites();
  }

  void _loadFavorites() async {
    final prefs = await SharedPreferences.getInstance();
    if (prefs.getKeys().contains("favorites")) {
      final favString = prefs.getString("favorites");
      if (favString != null) {
        final favorites = json.decode(favString).map((k, v) {
          return MapEntry(k, Video.fromJson(v));
        }).cast<String, Video>();

        emit(favorites);
      }
    }
  }

  void toggleFavorite(Video video) {
    final currentFavorites = Map<String, Video>.from(state);

    if (currentFavorites.containsKey(video.id)) {
      currentFavorites.remove(video.id);
    } else {
      currentFavorites[video.id] = video;
    }

    emit(currentFavorites);
    _saveFav(currentFavorites);
  }

  void _saveFav(Map<String, Video> favorites) async {
    final prefs = await SharedPreferences.getInstance();
    prefs.setString("favorites", json.encode(favorites));
  }
}
