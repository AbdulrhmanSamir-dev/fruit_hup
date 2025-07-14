import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:fruit_hup/models/product_model.dart';

class ProductService {
  final _productCollection = FirebaseFirestore.instance.collection('products');

  Future<void> addProduct(ProductModel product) async {
    await _productCollection.add(product.toMap());
  }

  Future<List<ProductModel>> getAllProducts() async {
    final snapShot = await _productCollection.get();
    return snapShot.docs
        .map((doc) => ProductModel.fromMap(doc.data(), doc.id))
        .toList();
  }

  Future<void> updateProduct(ProductModel product) async {
    await _productCollection.doc(product.id).update(product.toMap());
  }

  Future<void> deleteProduct(String id)async{
    await _productCollection.doc(id).delete();
  }
}
