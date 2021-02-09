import '../model/Food.dart';

enum EventType { add, delete, post }

class FoodEvent {
  Foods food;
  int foodIndex;
  EventType eventType;

  FoodEvent.add(Foods food) {
    this.eventType = EventType.add;
    this.food = food;
  }
  FoodEvent.delete(int index) {
    this.eventType = EventType.delete;
    this.foodIndex = index;
  }
}
