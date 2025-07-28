import 'dart:async';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../models/token.dart';
import '../services/token_service.dart';

final tokenServiceProvider = Provider((_) => TokenService());

class TokenListController extends AsyncNotifier<List<Token>> {
  late final TokenService _service;

  @override
  FutureOr<List<Token>> build() async {
    _service = ref.read(tokenServiceProvider);
    final resTokens = await _service.fetchTokens();
    final resTickers = await _service.fetchTickers();
    return resTokens;
  }

  Future<void> refresh() async {
    state = const AsyncLoading();
    state = await AsyncValue.guard(() async => await _service.fetchTokens());
  }
}

final tokenListController =
    AsyncNotifierProvider<TokenListController, List<Token>>(
      () => TokenListController(),
    );
