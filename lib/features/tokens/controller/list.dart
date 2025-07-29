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

    final res = resTokens.map((e) {
      final ticker = resTickers.firstWhere((el) => el.symbol == e.symbol);
      return Info.fromJson({...e.toJson(), ...ticker.toJson()});
    }).toList();

    return res;
  }

  Future<void> refresh() async {
    state = const AsyncLoading();
    // state = await AsyncValue.guard(() async => await _service.fetchTokens());

    final resTokens = await _service.fetchTokens();
    final resTickers = await _service.fetchTickers();

    final res = resTokens.map((e) {
      final ticker = resTickers.firstWhere((el) => el.symbol == e.symbol);
      return Info.fromJson({...e.toJson(), ...ticker.toJson()});
    }).toList();

    state = AsyncValue.data(res);
  }
}

final tokenListController =
    AsyncNotifierProvider<TokenListController, List<Info>>(
      () => TokenListController(),
    );
