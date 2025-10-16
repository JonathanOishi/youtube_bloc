import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:youtube_bloc_pattern/bloc/video_bloc.dart';
import 'package:youtube_bloc_pattern/bloc/favorite_bloc.dart';
import 'package:youtube_bloc_pattern/delegates/data_search.dart';
import 'package:youtube_bloc_pattern/models/video.dart';
import 'package:youtube_bloc_pattern/screens/favorite.dart';
import 'package:youtube_bloc_pattern/widgets/videotile.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  late ScrollController _scrollController;

  @override
  void initState() {
    super.initState();
    _scrollController = ScrollController();

    // Carregar vídeos aleatórios ao iniciar o app
    WidgetsBinding.instance.addPostFrameCallback((_) {
      context.read<VideosBloc>().loadRandomVideos();
    });

    _scrollController.addListener(() {
      if (_scrollController.position.pixels >=
          _scrollController.position.maxScrollExtent - 200) {
        final videosBloc = context.read<VideosBloc>();
        if (!videosBloc.isLoading) {
          videosBloc.loadMoreVideos();
        }
      }
    });
  }

  @override
  void dispose() {
    _scrollController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: SizedBox(
          height: 50,
          child: Image.asset('images/youtube_image.png'),
        ),
        elevation: 0,
        backgroundColor: Colors.blue,
        actions: [
          BlocBuilder<FavoriteBloc, Map<String, Video>>(
            builder: (context, favoriteState) {
              return Align(
                alignment: Alignment.center,
                child: Text('${favoriteState.length}'),
              );
            },
          ),
          IconButton(
              onPressed: () {
                Navigator.of(context).push(
                  MaterialPageRoute(
                    builder: (context) => Favorites(),
                  ),
                );
              },
              icon: const Icon(Icons.star),
              color: Colors.white),
          IconButton(
              onPressed: () {
                // Carregar novos vídeos aleatórios
                context.read<VideosBloc>().loadRandomVideos();
              },
              icon: const Icon(Icons.shuffle),
              color: Colors.white,
              tooltip: "Vídeos aleatórios"),
          IconButton(
              onPressed: () async {
                String? result =
                    await showSearch(context: context, delegate: DataSearch());
                if (result != null) {
                  // ignore: use_build_context_synchronously
                  context.read<VideosBloc>().search(result);
                }
              },
              icon: const Icon(Icons.search))
        ],
      ),
      backgroundColor: Colors.black,
      body: BlocBuilder<VideosBloc, List<Video>>(
        builder: (context, videoState) {
          // Se está carregando e não há vídeos ainda (primeira carga)
          if (videoState.isEmpty && context.read<VideosBloc>().isLoading) {
            return Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  CircularProgressIndicator(
                    valueColor: AlwaysStoppedAnimation(Colors.blue),
                  ),
                  SizedBox(height: 16),
                  Text(
                    "Carregando vídeos...",
                    style: TextStyle(color: Colors.white, fontSize: 16),
                  ),
                ],
              ),
            );
          }

          // Se não há vídeos e não está carregando
          if (videoState.isEmpty) {
            return Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(
                    Icons.search,
                    size: 64,
                    color: Colors.grey,
                  ),
                  SizedBox(height: 16),
                  Text(
                    "Pesquise por vídeos!",
                    style: TextStyle(color: Colors.white, fontSize: 18),
                  ),
                  SizedBox(height: 8),
                  Text(
                    "Use o ícone de pesquisa acima",
                    style: TextStyle(color: Colors.grey, fontSize: 14),
                  ),
                ],
              ),
            );
          }

          return ListView.builder(
            controller: _scrollController,
            itemCount: videoState.length +
                (context.read<VideosBloc>().isLoading ? 1 : 0),
            itemBuilder: (BuildContext context, int index) {
              if (index == videoState.length) {
                return Container(
                  padding: EdgeInsets.all(16),
                  child: Center(
                    child: CircularProgressIndicator(
                      valueColor: AlwaysStoppedAnimation(Colors.blue),
                    ),
                  ),
                );
              }

              return Videotile(video: videoState[index]);
            },
          );
        },
      ),
    );
  }
}
