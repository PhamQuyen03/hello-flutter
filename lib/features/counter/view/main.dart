// ← UI dùng Riverpod
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'counter_action.dart';
import 'counter_content.dart';

import '../../../features/tokens/view/list_page.dart';

class CounterPage extends ConsumerWidget {
  const CounterPage({super.key});
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      appBar: null,
      body: SafeArea(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            CounterContent(),
            CounterAction(),

            Container(
              margin: const EdgeInsets.only(top: 20),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  ElevatedButton.icon(
                    label: const Text('Second Page'),
                    icon: const Icon(Icons.list),
                    style: ElevatedButton.styleFrom(
                      minimumSize: const Size(140, 48),
                    ),
                    onPressed: () => {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (_) => ListTokenPage()),
                      ),
                    },
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
