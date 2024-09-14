
import 'package:flutter/material.dart';

class CreateMovieScreen extends StatefulWidget {
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
        title: Text('Créer un Film'),
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
                    Icon(Icons.movie, color: Colors.white),
                    SizedBox(width: 10),
                    Expanded(
                      child: TextField(
                        decoration: InputDecoration(
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
                SizedBox(height: 10),

                Row(
                  children: [
                    Icon(Icons.category, color: Colors.white),
                    SizedBox(width: 10),
                    Expanded(
                      child: TextField(
                        decoration: InputDecoration(
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
                SizedBox(height: 10),

                Row(
                  children: [
                    Icon(Icons.monetization_on, color: Colors.white),
                    SizedBox(width: 10),
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
                  style: TextStyle(color: Colors.white),
                ),

                Row(
                  children: [
                    Icon(Icons.campaign, color: Colors.white),
                    SizedBox(width: 10),
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
                  style: TextStyle(color: Colors.white),
                ),

                Row(
                  children: [
                    Icon(Icons.star, color: Colors.white),
                    SizedBox(width: 10),
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
                  style: TextStyle(color: Colors.white),
                ),

                SizedBox(height: 20),
                Center(
                  child: ElevatedButton(
                    onPressed: () {
                      // Logique de lancement de la production
                    },
                    child: Text('Lancer la production'),
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
    