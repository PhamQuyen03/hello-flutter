import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../controller/list.dart';

class ListTokenPage extends ConsumerWidget {
  const ListTokenPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final asyncTokens = ref.watch(tokenListController);

    return Scaffold(
      appBar: AppBar(
        title: const Text('Tokens'),
        actions: [
          IconButton(
            icon: const Icon(Icons.refresh),
            onPressed: () => ref.read(tokenListController.notifier).refresh(),
          ),
        ],
      ),
      body: SafeArea(
        child: RefreshIndicator(
          onRefresh: () => ref.read(tokenListController.notifier).refresh(),
          child: asyncTokens.when(
            loading: () => const Center(child: CircularProgressIndicator()),
            error: (err, _) => ListView(
              physics: const AlwaysScrollableScrollPhysics(),
              children: [Center(child: Text('Error: $err'))],
            ),
            data: (tokens) => ListView.builder(
              physics: const AlwaysScrollableScrollPhysics(),
              itemCount: tokens.length,
              itemBuilder: (_, idx) {
                final u = tokens[idx];
                return ListTile(
                  leading: CircleAvatar(
                    backgroundImage: NetworkImage(
                      'https://cloudfront.goonus.io/assets/icon/icon_${u.base}.png',
                    ),
                  ),
                  title: Text('${u.base}/${u.quote}'),
                  subtitle: Text(u.currentPrice.toString()),
                );
              },
            ),
          ),
        ),
      ),
    );
  }
}
