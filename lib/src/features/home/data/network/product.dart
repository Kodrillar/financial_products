import 'package:financial_products/src/core/network/api_urls.dart';
import 'package:financial_products/src/core/utils/data_layer_processor.dart';
import 'package:financial_products/src/features/home/domain/model/product.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:http/http.dart' as http;

class ProductNetworkHelper {
  Future<List<Product>> fetchProducts() async {
    final http.Response response = await http.get(Uri.parse(ApiUrls.products));

    return DataLayerProcessor.processRequestResponse<List<Product>>(
        response,
        (decodedResponseData) =>
            (decodedResponseData as List).map(Product.fromJson).toList());
  }
}

final productNetworkHelperProvider =
    Provider.autoDispose<ProductNetworkHelper>((ref) => ProductNetworkHelper());
