import '../events/food_event.dart';
import '../model/Food.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class FoodBloc extends Bloc<FoodEvent, List<Foods>> {
  FoodBloc() : super(List<Foods>());

  @override
  Stream<List<Foods>> mapEventToState(FoodEvent event) async* {
    List all = [];
    // TODO: implement mapEventToState
    switch (event.eventType) {
      case EventType.add:
        List<Foods> newState = List.from(state);
        if (newState != null) {
          newState.add(event.food);
        }
        yield newState;
        break;
      case EventType.delete:
        List<Foods> newState = List.from(state);
        newState.removeAt(event.foodIndex);
        yield newState;
        break;
      case EventType.inc:
        List<Foods> newState = List.from(state);

        for (var i = 0; i < newState.length; i++) {
          if (newState[i].id == event.id) {
            newState[i].quan = newState[i].quan + 1;
          }
        }
        yield newState;
        break;
      case EventType.dec:
        List<Foods> newState = List.from(state);
        for (var i = 0; i < newState.length; i++) {
          if (newState[i].id == event.id) {
            newState[i].quan = newState[i].quan - 1;
          }
        }
        yield newState;
        break;

      default:
        throw Exception('Event not found');
    }
  }
}
