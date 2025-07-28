class Ticker {
  final String symbol;
  final String currentPrice;

  Ticker({required this.symbol, required this.currentPrice});

  factory Ticker.fromJson(Map<String, dynamic> json) {
    return Ticker(
      symbol: json['a'] as String,
      currentPrice: json['b'] as String,
    );
  }

  Map<String, dynamic> toJson() {
    return {'symbol': symbol, 'currentPrice': currentPrice};
  }
}
