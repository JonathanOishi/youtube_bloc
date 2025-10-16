import 'dart:math';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:youtube_bloc_pattern/api.dart';
import 'package:youtube_bloc_pattern/models/video.dart';

class VideosBloc extends Cubit<List<Video>> {
  late Api api;
  bool _isLoading = false;
  bool get isLoading => _isLoading;

  final List<String> _popularSearchTerms = [
    'music videos',
    'comedy',
    'gaming',
    'technology',
    'sports',
    'cooking',
    'travel',
    'science',
    'education',
    'entertainment',
    'news',
    'movies',
    'anime',
    'tutorials',
    'vlogs'
  ];

  VideosBloc() : super([]) {
    api = Api();
  }

  void loadRandomVideos() async {
    if (_isLoading) return;

    try {
      _isLoading = true;
      final random = Random();
      final randomTerm =
          _popularSearchTerms[random.nextInt(_popularSearchTerms.length)];

      List<Video> videos = await api.search(randomTerm);
      emit(videos);
      _isLoading = false;
    } catch (e) {
      _isLoading = false;
    }
  }

  void search(String searchTerm) async {
    if (_isLoading) return;

    try {
      _isLoading = true;
      List<Video> videos = await api.search(searchTerm);
      emit(videos);
      _isLoading = false;
    } catch (e) {
      _isLoading = false;
    }
  }

  Future<void> loadMoreVideos() async {
    if (_isLoading) return;

    try {
      _isLoading = true;
      List<Video> moreVideos = await api.nextPage();
      List<Video> currentVideos = List.from(state);
      currentVideos.addAll(moreVideos);
      emit(currentVideos);
      _isLoading = false;
    } catch (e) {
      _isLoading = false;
    }
  }
}
