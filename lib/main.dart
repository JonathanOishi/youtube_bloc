import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:youtube_bloc_pattern/bloc/favorite_bloc.dart';
import 'package:youtube_bloc_pattern/bloc/video_bloc.dart';
import 'package:youtube_bloc_pattern/screens/home.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider<FavoriteBloc>(
          create: (context) => FavoriteBloc(),
        ),
        BlocProvider<VideosBloc>(
          create: (context) => VideosBloc(),
        ),
      ],
      child: MaterialApp(
        title: 'YouTube BLoC Pattern',
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          primarySwatch: Colors.blue,
          visualDensity: VisualDensity.adaptivePlatformDensity,
        ),
        home: const Home(),
      ),
    );
  }
}
