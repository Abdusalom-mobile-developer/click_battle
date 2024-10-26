import 'package:bloc/bloc.dart';

class RedClicker extends Cubit<double> {
  final double halfHeight;
  RedClicker(this.halfHeight) : super(halfHeight);

  void increment() {
    if (state - 10 > 0) {
      emit(state - 10);
    } else {
      emit(state - state);
    }
  }

  void restart() {
    emit(halfHeight);
  }
}
