part of 'cubit.dart';

class ProductsDataProvider {
  static final firebase = FirebaseFirestore.instance;

  static Future<List<Product>> fetch() async {
    try {
      final projectRef = firebase.collection('products');
      final raw = await projectRef.get();

      List data = raw.docs;

      List<Product> products = List.generate(
        data.length,
        (index) => Product.fromMap(
          data[index].data(),
          data[index].id,
        ),
      );
      return products;
    } catch (e) {
      debugPrint(e.toString());
      throw Exception(e.toString());
    }
  }
}
