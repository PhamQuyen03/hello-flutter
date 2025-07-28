import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../models/counter_provider.dart';

class CounterAction extends ConsumerWidget {
  const CounterAction({super.key});
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final notifier = ref.read(counterProvider.notifier);

    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Expanded(
              child: Align(
                alignment: Alignment.center,
                child: ElevatedButton.icon(
                  icon: const Icon(Icons.remove),
                  label: const Text('Decrease'),
                  style: ElevatedButton.styleFrom(
                    minimumSize: const Size(140, 48),
                  ),
                  onPressed: () => notifier.decrement(),
                ),
              ),
            ),
            Expanded(
              child: Align(
                alignment: Alignment.center,
                child: ElevatedButton.icon(
                  icon: const Icon(Icons.add),
                  label: const Text('Increase'),
                  style: ElevatedButton.styleFrom(
                    minimumSize: const Size(140, 48),
                  ),
                  onPressed: () => notifier.increment(),
                ),
              ),
            ),
          ],
        ),
      ],
    );
  }
}
