import 'dart:convert';
import 'package:http/http.dart' as http;
import '../models/token.dart';

class UserService {
  Future<List<Token>> fetchTokens() async {
    final resp = await http.get(
      Uri.parse('https://spot-markets.goonus.io/symbol-configs'),
    );

    if (resp.statusCode == 200) {
      final list = (jsonDecode(resp.body)['a'] as List);

      return list
          .map((e) => Token.fromJson(e as Map<String, dynamic>))
          .toList();
    }
    throw Exception('Failed to fetch');
  }
}
