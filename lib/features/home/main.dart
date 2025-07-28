// ← UI dùng Riverpod
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../features/tokens/view/list_page.dart';
import '../../../features/counter/view/main.dart';

class HomePage extends ConsumerWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      appBar: null,
      body: SafeArea(
        child: Container(
          margin: const EdgeInsets.only(top: 40),
          child: Column(
            children: [
              Row(
                children: [
                  Expanded(
                    child: Align(
                      alignment: Alignment.center,
                      child: ElevatedButton.icon(
                        icon: const Icon(Icons.add_card_rounded),
                        label: const Text('Counter'),
                        style: ElevatedButton.styleFrom(
                          minimumSize: const Size(140, 48),
                        ),
                        onPressed: () => {
                          Navigator.push(
                            context,
                            MaterialPageRoute(builder: (_) => CounterPage()),
                          ),
                        },
                      ),
                    ),
                  ),
                  Expanded(
                    child: Align(
                      alignment: Alignment.center,
                      child: ElevatedButton.icon(
                        icon: const Icon(Icons.list_outlined),
                        label: const Text('Tokens'),
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
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
