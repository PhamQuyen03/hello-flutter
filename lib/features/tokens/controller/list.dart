import 'dart:async';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../services/token_service.dart';
import '../models/info.dart';

final tokenServiceProvider = Provider((_) => TokenService());

class TokenListController extends AsyncNotifier<List<Info>> {
  late final TokenService _service;

  @override
  FutureOr<List<Info>> build() async {
    _service = ref.read(tokenServiceProvider);
    final resTokens = await _service.fetchTokens();
    final resTickers = await _service.fetchTickers();

    final result = resTokens.map((token) {
      final ticker = resTickers.firstWhere(
        (ticker) => ticker.symbol == token.symbol,
      );
      return Info.fromJson({...token.toJson(), ...ticker.toJson()});
    }).toList();

    return result;
  }

  Future<void> refresh() async {
    state = const AsyncLoading();
    // state = await AsyncValue.guard(() async => await _service.fetchTokens());

    final resTokens = await _service.fetchTokens();
    final resTickers = await _service.fetchTickers();

    final result = resTokens.map((token) {
      final ticker = resTickers.firstWhere(
        (ticker) => ticker.symbol == token.symbol,
      );
      return Info.fromJson({...token.toJson(), ...ticker.toJson()});
    }).toList();

    state = AsyncValue.data(result);
  }
}

final tokenListController =
    AsyncNotifierProvider<TokenListController, List<Info>>(
      () => TokenListController(),
    );
