import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:co_jemy/models/shopping_list_model.dart';
import 'package:firebase_auth/firebase_auth.dart';

class ShoppingListRepository {
  Stream<List<ShoppingListModel>> getShoppingListStream() {
    final userID = FirebaseAuth.instance.currentUser?.uid;
    if (userID == null) {
      throw Exception('Użytkownik nie jest zalogowany');
    }
    return FirebaseFirestore.instance
        .collection('users')
        .doc(userID)
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
    final userID = FirebaseAuth.instance.currentUser?.uid;
    if (userID == null) {
      throw Exception('Użytkownik nie jest zalogowany');
    }
    await FirebaseFirestore.instance
        .collection('users')
        .doc(userID)
        .collection('categories')
        .add(
      {'title': categoryName},
    );
  }

  Future<void> delete({required String id}) {
    final userID = FirebaseAuth.instance.currentUser?.uid;
    if (userID == null) {
      throw Exception('Użytkownik nie jest zalogowany');
    }
    return FirebaseFirestore.instance
        .collection('users')
        .doc(userID)
        .collection('categories')
        .doc(id)
        .delete();
  }
}
