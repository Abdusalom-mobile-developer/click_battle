import 'package:bloc/bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class RedClicker extends Cubit<double> {
  RedClicker() : super(300);

  void increment() {
    if (state - 10 > 0) {
      emit(state - 10);
    } else if (state != 0) {
      emit(state - (state - 10).abs());
    }
  }
}
