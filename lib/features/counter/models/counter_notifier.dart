// ← logic thay đổi state
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'counter_state.dart';

class CounterNotifier extends StateNotifier<CounterState> {
  CounterNotifier() : super(const CounterState(inc: 0, dec: 0));

  void increment() => state = state.copyWith(inc: state.inc + 1);
  void decrement() => state = state.copyWith(dec: state.dec - 1);

  void reset() => state = const CounterState(inc: 0, dec: 0);
}
