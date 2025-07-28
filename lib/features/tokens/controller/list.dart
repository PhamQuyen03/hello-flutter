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
    return await _service.fetchTokens();
  }

  Future<void> refresh() async {
    state = const AsyncLoading();
    state = await AsyncValue.guard(() async => await _service.fetchTokens());
  }

  // Cập nhật toàn bộ list mới (ví dụ thêm user)
  void setTokens(List<Token> newList) {
    state = AsyncData(newList);
  }

  void addToken(Token token) {
    state = AsyncData([...state.requireValue, token]);
  }

  void removeToken(String symbol) {
    final prev = state.requireValue;
    state = AsyncData(prev.where((u) => u.symbol != symbol).toList());
  }

  void updateToken(Token token) {
    final prev = state.requireValue;
    final updated = prev
        .map((u) => u.symbol == token.symbol ? token : u)
        .toList();
    state = AsyncData(updated);
  }
}

final tokenListController =
    AsyncNotifierProvider<TokenListController, List<Token>>(
      () => TokenListController(),
    );
