import 'package:financial_products/src/features/home/domain/model/sub_product.dart';

class Product {
  final String id;
  final String name;
  final String currency;
  final String description;
  final int? minWithdrawal;
  final int? minFund;
  final String? features;
  final DateTime lastUpdated;
  final List<SubProduct> subProducts;

  Product({
    required this.id,
    required this.name,
    required this.currency,
    required this.description,
    this.minWithdrawal,
    this.minFund,
    this.features,
    required this.lastUpdated,
    required this.subProducts,
  });

  @override
  String toString() {
    return 'Product(id: $id, name: $name, currency: $currency, description: $description, minWithdrawal: $minWithdrawal, minFund: $minFund, features: $features, lastUpdated: $lastUpdated, subProducts: $subProducts)';
  }

  factory Product.fromMap(Map<String, dynamic> map) {
    return Product(
      id: map['product_id'] ?? '',
      name: map['product_name'] ?? '',
      currency: map['currency'] ?? '',
      description: map['description'] ?? '',
      minWithdrawal: map['minWithrawal']?.toInt(),
      minFund: map['minFund']?.toInt(),
      features: map['features'],
      lastUpdated: DateTime.parse(map['updatedAt']),
      subProducts: (map['sub_product'] != null && map['sub_product'] is List)
          ? List<SubProduct>.from(
              map['sub_product']!.map((product) => SubProduct.fromMap(product)))
          : [],
    );
  }

  factory Product.fromJson(source) => Product.fromMap(source);
}
