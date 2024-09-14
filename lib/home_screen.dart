
import 'package:flutter/material.dart';
import 'create_movie_screen.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        fit: StackFit.expand,
        children: [
          // Image de fond
          Image.asset(
            'assets/images/background.jpg',
            fit: BoxFit.cover,
          ),
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Text(
                'Movie Tycoon',
                style: TextStyle(
                  fontSize: 40,
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                ),
              ),
              const SizedBox(height: 40),
              ElevatedButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => CreateMovieScreen()),
                  );
                },
                child: const Text('Nouveau jeu'),
              ),
              const SizedBox(height: 20),
              ElevatedButton(
                onPressed: () {
                  // Logique pour "Continuer" (si une sauvegarde existe)
                },
                child: const Text('Continuer'),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
    