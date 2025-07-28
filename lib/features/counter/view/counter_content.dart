import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../models/counter_provider.dart';

class CounterContent extends ConsumerWidget {
  const CounterContent({super.key});
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final state = ref.watch(counterProvider);

    return Column(
      children: [
        Row(
          children: [
            Expanded(
              child: Align(
                alignment: Alignment.center,
                child: Text(
                  '${state.dec}',
                  style: const TextStyle(fontSize: 40, color: Colors.red),
                ),
              ),
            ),
            Expanded(
              child: Align(
                alignment: Alignment.center,
                child: Text(
                  '${state.inc}',
                  style: const TextStyle(fontSize: 40, color: Colors.blue),
                ),
              ),
            ),
          ],
        ),
      ],
    );
  }
}
