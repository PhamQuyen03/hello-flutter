class Info {
  final String symbol;
  final String base;
  final String quote;
  final String currentPrice;
  final int pricePrecision;

  Info({
    required this.symbol,
    required this.base,
    required this.quote,
    required this.currentPrice,
    required this.pricePrecision,
  });

  factory Info.fromJson(Map<String, dynamic> json) {
    return Info(
      symbol: json['symbol'] as String,
      base: json['base'] as String,
      quote: json['quote'] as String,
      currentPrice: json['currentPrice'] as String,
      pricePrecision: json['pricePrecision'] as int,
    );
  }

  Info copyWith({
    String? symbol,
    String? base,
    String? quote,
    String? currentPrice,
    int? pricePrecision,
  }) {
    return Info(
      symbol: symbol ?? this.symbol,
      base: base ?? this.base,
      quote: quote ?? this.quote,
      currentPrice: currentPrice ?? this.currentPrice,
      pricePrecision: pricePrecision ?? this.pricePrecision,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'symbol': symbol,
      'base': base,
      'quote': quote,
      'currentPrice': currentPrice,
      'pricePrecision': pricePrecision,
    };
  }
}
