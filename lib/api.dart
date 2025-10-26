import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:youtube_bloc_pattern/models/video.dart';

const API_KEY = 'SUA_CHAVE_DE_API_AQUI';

class Api {
  String _search = '';
  String _nextToken = '';
  bool _hasMorePages = true;

  bool get hasMorePages => _hasMorePages;

  Future<List<Video>> search(String search) async {
    _search = search;
    _nextToken = '';
    _hasMorePages = true;
    http.Response response = await http.get(
      Uri.parse(
        "https://www.googleapis.com/youtube/v3/search?part=snippet&q=$search&type=video&key=$API_KEY&maxResults=10",
      ),
    );

    return _decode(response);
  }

  Future<List<Video>> nextPage() async {
    if (_nextToken.isEmpty || !_hasMorePages) {
      return [];
    }

    http.Response response = await http.get(
      Uri.parse(
        "https://www.googleapis.com/youtube/v3/search?part=snippet&q=$_search&type=video&key=$API_KEY&maxResults=10&pageToken=$_nextToken",
      ),
    );
    return _decode(response);
  }

  List<Video> _decode(http.Response response) {
    if (response.statusCode == 200) {
      var decoded = json.decode(response.body);

      if (decoded['error'] != null) {
        String errorMessage =
            decoded['error']['message'] ?? 'Erro desconhecido';
        String errorCode = decoded['error']['code']?.toString() ?? 'N/A';

        throw Exception('Erro da API: $errorMessage (Código: $errorCode)');
      }

      _nextToken = decoded['nextPageToken'] ?? '';

      if (_nextToken.isEmpty) {
        _hasMorePages = false;
      }

      if (decoded['items'] == null || decoded['items'].isEmpty) {
        return [];
      }

      List<Video> videos =
          decoded['items'].map<Video>((item) => Video.fromJson(item)).toList();

      return videos;
    } else {
      try {
        var errorDecoded = json.decode(response.body);
        if (errorDecoded['error'] != null) {
          String errorMessage =
              errorDecoded['error']['message'] ?? 'Erro desconhecido';
          throw Exception('Erro da API: $errorMessage');
        }
      } catch (e) {
        // Ignorar erros de parsing e lançar a exceção genérica abaixo
      }

      throw Exception(
          'Failed to load videos: ${response.statusCode} - ${response.reasonPhrase}');
    }
  }
}
