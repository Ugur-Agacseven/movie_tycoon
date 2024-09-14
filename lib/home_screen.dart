
import 'package:flutter/material.dart';
import 'create_movie_screen.dart';

class HomeScreen extends StatelessWidget {
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
              Text(
                'Movie Tycoon',
                style: TextStyle(
                  fontSize: 40,
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                ),
              ),
              SizedBox(height: 40),
              ElevatedButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => CreateMovieScreen()),
                  );
                },
                child: Text('Nouveau jeu'),
              ),
              SizedBox(height: 20),
              ElevatedButton(
                onPressed: () {
                  // Logique pour "Continuer" (si une sauvegarde existe)
                },
                child: Text('Continuer'),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
    