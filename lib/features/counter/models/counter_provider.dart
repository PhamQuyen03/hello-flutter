// ← định nghĩa provider
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'counter_state.dart';
import 'counter_notifier.dart';

final counterProvider = StateNotifierProvider<CounterNotifier, CounterState>(
  (ref) => CounterNotifier(),
);
