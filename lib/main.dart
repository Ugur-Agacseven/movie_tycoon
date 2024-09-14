
import 'package:flutter/material.dart';
import 'create_movie_screen.dart';
import 'home_screen.dart';

void main() {
  runApp(MovieTycoonApp());
}

class MovieTycoonApp extends StatelessWidget {
  const MovieTycoonApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Movie Tycoon',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      initialRoute: '/',
      routes: {
        '/': (context) => HomeScreen(),
        '/game': (context) => CreateMovieScreen(),
      },
    );
  }
}
    