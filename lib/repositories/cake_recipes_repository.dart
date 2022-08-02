import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:co_jemy/models/cake_recipe_model.dart';
import 'package:firebase_auth/firebase_auth.dart';

class CakeRecipesRepository {
  Stream<List<CakeRecipeModel>> getCakeRecipesStream() {
    final userID = FirebaseAuth.instance.currentUser?.uid;
    if (userID == null) {
      throw Exception('Użytkownik nie jest zalogowany');
    }
    return FirebaseFirestore.instance
        .collection('users')
        .doc(userID)
        .collection('cake_recipes')
        .snapshots()
        .map(
      (querySnapshot) {
        return querySnapshot.docs.map(
          (doc) {
            return CakeRecipeModel(
              id: doc.id,
              name: doc['name'],
              ingredients: doc['ingredients'],
              recipe: doc['recipe'],
            );
          },
        ).toList();
      },
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
        .collection('cake_recipes')
        .doc(id)
        .delete();
  }

  Future<CakeRecipeModel> get({required String id}) async {
    final userID = FirebaseAuth.instance.currentUser?.uid;
    if (userID == null) {
      throw Exception('Użytkownik nie jest zalogowany');
    }
    final doc = await FirebaseFirestore.instance
        .collection('users')
        .doc(userID)
        .collection('cake_recipes')
        .doc(id)
        .get();
    return CakeRecipeModel(
      id: doc.id,
      name: doc['name'],
      ingredients: doc['ingredients'],
      recipe: doc['recipe'],
    );
  }

  Future<void> add(
    String name,
    String ingredients,
    String recipe,
  ) async {
    final userID = FirebaseAuth.instance.currentUser?.uid;
    if (userID == null) {
      throw Exception('Użytkownik nie jest zalogowany');
    }
    await FirebaseFirestore.instance
        .collection('users')
        .doc(userID)
        .collection('cake_recipes')
        .add(
      {
        'name': name,
        'ingredients': ingredients,
        'recipe': recipe,
      },
    );
  }
}
