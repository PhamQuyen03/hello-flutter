// ← UI dùng Riverpod
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../models/counter_provider.dart';

class CounterPage extends ConsumerWidget {
  const CounterPage({super.key});
  @override
  Widget build(BuildContext ctx, WidgetRef ref) {
    final state = ref.watch(counterProvider);

    return Scaffold(
      appBar: null,
      body: SafeArea(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: <Widget>[
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Column(
                  children: [
                    Text(
                      '${state.dec}',
                      style: const TextStyle(fontSize: 40, color: Colors.red),
                    ),
                    ElevatedButton.icon(
                      icon: const Icon(Icons.remove),
                      label: const Text('Decrease'),
                      style: ElevatedButton.styleFrom(
                        minimumSize: const Size(140, 48),
                      ),
                      onPressed: () =>
                          ref.read(counterProvider.notifier).decrement(),
                    ),
                  ],
                ),
                const SizedBox(width: 30),
                Column(
                  children: [
                    Text(
                      '${state.inc}',
                      style: const TextStyle(fontSize: 40, color: Colors.green),
                    ),
                    ElevatedButton.icon(
                      icon: const Icon(Icons.add),
                      label: const Text('Increase'),
                      style: ElevatedButton.styleFrom(
                        minimumSize: const Size(140, 48),
                      ),
                      onPressed: () =>
                          ref.read(counterProvider.notifier).increment(),
                    ),
                  ],
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
