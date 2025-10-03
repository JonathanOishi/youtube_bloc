import 'package:flutter/material.dart';

class Home extends StatelessWidget {
  const Home({super.key});

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
          Align(
            alignment: Alignment.center,
            child: Text('0'),
          ),
          IconButton(onPressed: () {}, icon: const Icon(Icons.star)),
          IconButton(onPressed: () {}, icon: const Icon(Icons.search))
        ],
      ),
      body: const Center(
        child: Text('Home Screen'),
      ),
    );
  }
}
