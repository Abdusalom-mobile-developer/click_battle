import 'package:bloc/bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class BlueClicker extends Cubit<double> {
  BlueClicker() : super(300);

  void increment() {
    if (state - 10 > 0) {
      emit(state - 10);
    } else if (state != 0) {
      emit(state - (state - 10).abs());
    }
  }
}
