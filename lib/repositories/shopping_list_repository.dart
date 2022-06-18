import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:co_jemy/models/shopping_list_model.dart';

class ShoppingListRepository {
  Stream<List<ShoppingListModel>> getShoppingListStream() {
    return FirebaseFirestore.instance
        .collection('categories')
        .snapshots()
        .map((querySnapshot) {
      return querySnapshot.docs.map(
        (doc) {
          return ShoppingListModel(
            id: doc.id,
            title: doc['title'],
          );
        },
      ).toList();
    });
  }

  Future<void> addCategory({required String categoryName}) async {
    await FirebaseFirestore.instance.collection('categories').add(
      {'title': categoryName},
    );
  }

  Future<void> delete({required String id}) {
    return FirebaseFirestore.instance.collection('categories').doc(id).delete();
  }
}
