class Token {
  final String symbol;
  final String base;
  final String quote;

  Token({required this.symbol, required this.base, required this.quote});

  factory Token.fromJson(Map<String, dynamic> json) {
    return Token(
      symbol: json['g'] as String,
      base: json['d'] as String,
      quote: json['f'] as String,
    );
  }
}
