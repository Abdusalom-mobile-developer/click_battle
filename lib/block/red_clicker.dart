import 'package:bloc/bloc.dart';

class RedClicker extends Cubit<double> {
  final double halfHeight;
  RedClicker(this.halfHeight) : super(halfHeight);

  
  // Method that helps to decrement the state by 10
  void increment() {
    if (state - 10 > 0) {
      emit(state - 10);
    } else {
      emit(state - state);
    }
  }

  // Method that helps to resatart the game by changing the state to the initial state.
  void restart() {
    emit(halfHeight);
  }
}
