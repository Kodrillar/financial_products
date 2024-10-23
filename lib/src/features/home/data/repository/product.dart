import 'package:financial_products/src/core/utils/repository_operator.dart';
import 'package:financial_products/src/features/home/data/network/product.dart';
import 'package:financial_products/src/features/home/domain/model/product.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class ProductRepository extends RepositoryOperator {
  ProductRepository(this._ref);
  final Ref _ref;

  Future<List<Product>> fetchProducts() async {
    return processRepoOperation<List<Product>>(
        operation: () async =>
            _ref.read(productNetworkHelperProvider).fetchProducts());
  }
}

final productRepositoryProvider =
    Provider.autoDispose<ProductRepository>((ref) => ProductRepository(ref));

final fetchProductsProvider = FutureProvider<List<Product>>(
    (ref) => ref.watch(productRepositoryProvider).fetchProducts());
