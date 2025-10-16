import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:youtube_bloc_pattern/models/video.dart';

// 🔐 CONFIGURAÇÃO DE API KEY
// Para produção, use variáveis de ambiente ou arquivo .env
// ignore: constant_identifier_names
const API_KEY = String.fromEnvironment(
  'YOUTUBE_API_KEY',
  defaultValue: 'SUBSTITUA_PELA_SUA_API_KEY', // ⚠️ Configure sua API Key aqui
);

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
      return []; // Não há mais páginas
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

      // Verificar se há erro na resposta da API
      if (decoded['error'] != null) {
        throw Exception('Erro da API: ${decoded['error']['message']}');
      }

      _nextToken = decoded['nextPageToken'] ?? '';

      // Se não há nextPageToken, não há mais páginas
      if (_nextToken.isEmpty) {
        _hasMorePages = false;
      }

      // Verificar se há itens
      if (decoded['items'] == null || decoded['items'].isEmpty) {
        return [];
      }

      List<Video> videos =
          decoded['items'].map<Video>((item) => Video.fromJson(item)).toList();

      return videos;
    } else {
      throw Exception('Failed to load videos: ${response.statusCode}');
    }
  }
}

/* "https://www.googleapis.com/youtube/v3/search?part=snippet&q=$search&type=video&key=$API_KEY&maxResults=10"
"https://www.googleapis.com/youtube/v3/search?part=snippet&q=$_search&type=video&key=$API_KEY&maxResults=10&pageToken=$_nextToken"
"http://suggestqueries.google.com/complete/search?hl=en&ds=yt&client=youtube&hjson=t&cp=1&q=$search&format=5&alt=json"
*/
