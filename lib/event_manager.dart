
import 'dart:math';

class Event {
  final String name;
  final String description;
  final int effectOnBudget;
  final int effectOnQuality;

  Event(this.name, this.description, {this.effectOnBudget = 0, this.effectOnQuality = 0});
}

class EventManager {
  static final List<Event> events = [
    Event("Petit retard technique", "Un léger retard a retardé le tournage.", effectOnBudget: -10000, effectOnQuality: -5),
    Event("Réaction mitigée à la bande-annonce", "Les retours sur la bande-annonce sont tièdes.", effectOnQuality: -5),
    Event("Support d’un sponsor", "Un sponsor a apporté un soutien financier.", effectOnBudget: 20000),
  ];

  static Event? triggerRandomEvent() {
    final random = Random();
    if (random.nextInt(100) < 30) {  // 30% de chance d'avoir un événement
      return events[random.nextInt(events.length)];
    }
    return null;
  }
}
    