part of 'cubit.dart';

class ProductsRepository {
  Future<List<Product>> fetch() => ProductsDataProvider.fetch();
}
