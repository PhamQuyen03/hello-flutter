class Token {
  final String symbol;
  final String base;
  final String quote;
  final int pricePrecision;

  Token({
    required this.symbol,
    required this.base,
    required this.quote,
    required this.pricePrecision,
  });

  factory Token.fromJson(Map<String, dynamic> json) {
    return Token(
      symbol: json['g'] as String,
      base: json['d'] as String,
      quote: json['f'] as String,
      pricePrecision: json['k'] as int,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'symbol': symbol,
      'base': base,
      'quote': quote,
      'pricePrecision': pricePrecision,
    };
  }
}
