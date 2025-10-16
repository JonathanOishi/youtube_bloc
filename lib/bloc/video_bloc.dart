import 'dart:math';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:youtube_bloc_pattern/api.dart';
import 'package:youtube_bloc_pattern/models/video.dart';

class VideosBloc extends Cubit<List<Video>> {
  late Api api;
  bool _isLoading = false;
  bool get isLoading => _isLoading;

  // Lista de termos populares para busca inicial
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
      // Escolhe um termo aleatório da lista
      final random = Random();
      final randomTerm =
          _popularSearchTerms[random.nextInt(_popularSearchTerms.length)];

      List<Video> videos = await api.search(randomTerm);
      emit(videos);
      _isLoading = false;
    } catch (e) {
      _isLoading = false;
      // Em caso de erro, mantém o estado atual
    }
  }

  void search(String searchTerm) async {
    if (_isLoading) return; // Evita múltiplas requisições simultâneas

    try {
      _isLoading = true;
      List<Video> videos = await api.search(searchTerm); // Nova busca
      emit(videos);
      _isLoading = false;
    } catch (e) {
      _isLoading = false;
      // Em caso de erro, mantém o estado atual
    }
  }

  Future<void> loadMoreVideos() async {
    if (_isLoading) return; // Evita múltiplas requisições simultâneas

    try {
      _isLoading = true;
      List<Video> moreVideos = await api.nextPage();
      List<Video> currentVideos = List.from(state);
      currentVideos
          .addAll(moreVideos); // Adiciona novos vídeos à lista existente
      emit(currentVideos);
      _isLoading = false;
    } catch (e) {
      _isLoading = false;
      // Em caso de erro, mantém o estado atual
    }
  }
}
