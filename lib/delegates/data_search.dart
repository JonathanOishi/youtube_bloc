import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class DataSearch extends SearchDelegate<String> {
  @override
  List<Widget>? buildActions(BuildContext context) {
    return [
      IconButton(
        icon: const Icon(Icons.clear),
        onPressed: () {
          query = '';
        },
      ),
    ];
  }

  @override
  Widget? buildLeading(BuildContext context) {
    return IconButton(
      icon: AnimatedIcon(
        icon: AnimatedIcons.menu_arrow,
        progress: transitionAnimation,
      ),
      onPressed: () {
        close(context, '');
      },
    );
  }

  @override
  Widget buildResults(BuildContext context) {
    if (query.isEmpty) {
      return const Center(
        child: Text('Digite algo para buscar'),
      );
    }

    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const Icon(
            Icons.search,
            size: 64,
            color: Colors.grey,
          ),
          const SizedBox(height: 16),
          Text(
            'Buscando por: "$query"',
            style: const TextStyle(fontSize: 18),
          ),
          const SizedBox(height: 16),
          ElevatedButton(
            onPressed: () {
              close(context, query);
            },
            child: const Text('Buscar'),
          ),
        ],
      ),
    );
  }

  @override
  Widget buildSuggestions(BuildContext context) {
    if (query.isEmpty) {
      return Container();
    } else {
      return FutureBuilder<List<String>>(
        future: suggestion(query),
        builder: (context, snapshot) {
          if (!snapshot.hasData) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          } else {
            return ListView.builder(
              itemCount: snapshot.data!.length,
              itemBuilder: (context, index) {
                return ListTile(
                  leading: const Icon(Icons.play_arrow),
                  title: Text(snapshot.data![index]),
                  onTap: () {
                    close(context, snapshot.data![index]);
                  },
                );
              },
            );
          }
        },
      );
    }
  }

  Future<List<String>> suggestion(String search) async {
    try {
      http.Response response = await http.get(Uri.parse(
          "http://suggestqueries.google.com/complete/search?hl=en&ds=yt&client=youtube&hjson=t&cp=1&q=$search&format=5&alt=json"));

      if (response.statusCode == 200) {
        var data = json.decode(response.body);
        if (data.length > 1 && data[1] is List) {
          return (data[1] as List).map<String>((item) {
            return item[0].toString();
          }).toList();
        }
        return [];
      } else {
        throw Exception('Failed to load suggestions');
      }
    } catch (e) {
      return [];
    }
  }
}
