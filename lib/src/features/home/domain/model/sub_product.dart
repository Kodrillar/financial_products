class SubProduct {
  final String id;
  final String title;
  final String currency;
  final String description;
  final String? minWithdrawal;
  final String? minFund;
  final String? features;
  final DateTime lastUpdated;

  SubProduct({
    required this.id,
    required this.title,
    required this.currency,
    required this.description,
    this.minWithdrawal,
    this.minFund,
    this.features,
    required this.lastUpdated,
  });

  @override
  String toString() {
    return 'SubProduct(id: $id, title: $title, currency: $currency, description: $description, minWithdrawal: $minWithdrawal, minFund: $minFund, features: $features, lastUpdated: $lastUpdated)';
  }

  factory SubProduct.fromMap(Map<String, dynamic> map) {
    return SubProduct(
      id: map['product_id'] ?? '',
      title: map['title'] ?? '',
      currency: map['currency'] ?? '',
      description: map['description'] ?? '',
      minWithdrawal: map['minWithrawal'],
      minFund: map['minFund'],
      features: map['features'],
      lastUpdated: DateTime.parse(map['updatedAt']),
    );
  }

  factory SubProduct.fromJson(source) => SubProduct.fromMap(source);
}
