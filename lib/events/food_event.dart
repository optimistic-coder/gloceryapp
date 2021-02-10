import '../model/Food.dart';

enum EventType { add, delete, inc, dec }

class FoodEvent {
  Foods food;
  int foodIndex, id;
  EventType eventType;

  FoodEvent.add(Foods food) {
    this.eventType = EventType.add;
    this.food = food;
  }
  FoodEvent.delete(int index) {
    this.eventType = EventType.delete;
    this.foodIndex = index;
  }
  FoodEvent.inc(int id) {
    this.eventType = EventType.inc;
    this.id = id;
  }
  FoodEvent.dec(int id) {
    this.eventType = EventType.dec;
    this.id = id;
  }
}
