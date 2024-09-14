
import 'package:flutter/material.dart';

class CreateMovieScreen extends StatefulWidget {
  const CreateMovieScreen({super.key});

  @override
  _CreateMovieScreenState createState() => _CreateMovieScreenState();
}

class _CreateMovieScreenState extends State<CreateMovieScreen> {
  String title = "";
  String genre = "";
  int budget = 1000000;
  int marketing = 500000;
  int actorReputation = 50;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Créer un Film'),
      ),
      body: Stack(
        fit: StackFit.expand,
        children: [
          // Image de fond
          Image.asset(
            'assets/images/movie_background.jpg',
            fit: BoxFit.cover,
          ),
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    const Icon(Icons.movie, color: Colors.white),
                    const SizedBox(width: 10),
                    Expanded(
                      child: TextField(
                        decoration: const InputDecoration(
                          labelText: "Titre du film",
                          labelStyle: TextStyle(color: Colors.white),
                        ),
                        onChanged: (value) {
                          setState(() {
                            title = value;
                          });
                        },
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 10),

                Row(
                  children: [
                    const Icon(Icons.category, color: Colors.white),
                    const SizedBox(width: 10),
                    Expanded(
                      child: TextField(
                        decoration: const InputDecoration(
                          labelText: "Genre du film",
                          labelStyle: TextStyle(color: Colors.white),
                        ),
                        onChanged: (value) {
                          setState(() {
                            genre = value;
                          });
                        },
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 10),

                Row(
                  children: [
                    const Icon(Icons.monetization_on, color: Colors.white),
                    const SizedBox(width: 10),
                    Expanded(
                      child: Slider(
                        value: budget.toDouble(),
                        min: 1000000,
                        max: 100000000,
                        divisions: 100,
                        label: budget.toString(),
                        onChanged: (value) {
                          setState(() {
                            budget = value.toInt();
                          });
                        },
                      ),
                    ),
                  ],
                ),
                Text(
                  'Budget: \$${budget.toString()}',
                  style: const TextStyle(color: Colors.white),
                ),

                Row(
                  children: [
                    const Icon(Icons.campaign, color: Colors.white),
                    const SizedBox(width: 10),
                    Expanded(
                      child: Slider(
                        value: marketing.toDouble(),
                        min: 100000,
                        max: 20000000,
                        divisions: 20,
                        label: marketing.toString(),
                        onChanged: (value) {
                          setState(() {
                            marketing = value.toInt();
                          });
                        },
                      ),
                    ),
                  ],
                ),
                Text(
                  'Marketing: \$${marketing.toString()}',
                  style: const TextStyle(color: Colors.white),
                ),

                Row(
                  children: [
                    const Icon(Icons.star, color: Colors.white),
                    const SizedBox(width: 10),
                    Expanded(
                      child: Slider(
                        value: actorReputation.toDouble(),
                        min: 0,
                        max: 100,
                        divisions: 10,
                        label: actorReputation.toString(),
                        onChanged: (value) {
                          setState(() {
                            actorReputation = value.toInt();
                          });
                        },
                      ),
                    ),
                  ],
                ),
                Text(
                  'Réputation des acteurs: $actorReputation',
                  style: const TextStyle(color: Colors.white),
                ),

                const SizedBox(height: 20),
                Center(
                  child: ElevatedButton(
                    onPressed: () {
                      // Logique de lancement de la production
                    },
                    child: const Text('Lancer la production'),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
    