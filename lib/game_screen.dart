
import 'package:flutter/material.dart';
import 'event_manager.dart';
import 'progression_manager.dart';
import 'film_evaluation.dart';

class GameScreen extends StatefulWidget {
  const GameScreen({super.key});

  @override
  _GameScreenState createState() => _GameScreenState();
}

class _GameScreenState extends State<GameScreen> {
  String title = "";
  String genre = "";
  int budget = 1000000;
  int marketing = 500000;
  int quality = 50;
  int actorReputation = 50;
  int productionStage = 0;
  FilmEvaluation? filmEvaluation;
  String eventMessage = "";

  void _nextStage() {
    setState(() {
      productionStage = (productionStage + 1) % 3;

      if (productionStage == 2) {
        final bonuses = ProgressionManager.applyBonuses(budget, quality);
        filmEvaluation = evaluateFilm(bonuses.budget, bonuses.quality, marketing, actorReputation);
        ProgressionManager.gainExperience(filmEvaluation!.finalQuality * 10);
        _triggerEvent();
      }
    });
  }

  void _triggerEvent() {
    final event = EventManager.triggerRandomEvent();
    if (event != null) {
      setState(() {
        budget += event.effectOnBudget;
        quality += event.effectOnQuality;
        eventMessage = event.description;
      });
    } else {
      eventMessage = "Aucun événement.";
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Movie Tycoon'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text("Créer un film", style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
            const SizedBox(height: 10),
            TextField(
              decoration: const InputDecoration(labelText: "Titre du film"),
              onChanged: (value) => setState(() {
                title = value;
              }),
            ),
            TextField(
              decoration: const InputDecoration(labelText: "Genre du film"),
              onChanged: (value) => setState(() {
                genre = value;
              }),
            ),
            const SizedBox(height: 10),
            Text("Budget: \$${budget.toString()}"),
            Slider(
              value: budget.toDouble(),
              min: 1000000,
              max: 100000000,
              divisions: 100,
              label: budget.toString(),
              onChanged: (value) => setState(() {
                budget = value.toInt();
              }),
            ),
            Text("Marketing: \$${marketing.toString()}"),
            Slider(
              value: marketing.toDouble(),
              min: 100000,
              max: 20000000,
              divisions: 20,
              label: marketing.toString(),
              onChanged: (value) => setState(() {
                marketing = value.toInt();
              }),
            ),
            Text("Réputation des acteurs: $actorReputation"),
            Slider(
              value: actorReputation.toDouble(),
              min: 0,
              max: 100,
              divisions: 10,
              label: actorReputation.toString(),
              onChanged: (value) => setState(() {
                actorReputation = value.toInt();
              }),
            ),
            const SizedBox(height: 10),
            ElevatedButton(
              onPressed: _nextStage,
              child: Text(productionStage == 0 ? "Lancer la préproduction" : productionStage == 1 ? "Lancer la production" : "Lancer la postproduction"),
            ),
            if (productionStage == 2 && filmEvaluation != null)
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text("Votre film est terminé !", style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
                  Text("Qualité finale: ${filmEvaluation!.finalQuality}"),
                  Text("Revenus au box-office: \$${filmEvaluation!.boxOffice}"),
                  Text("Événement: $eventMessage"),
                ],
              ),
            const Spacer(),
            Text("Niveau actuel: ${ProgressionManager.level}"),
            Text("Expérience: ${ProgressionManager.experience}/${ProgressionManager.nextLevelExp}"),
          ],
        ),
      ),
    );
  }
}
    