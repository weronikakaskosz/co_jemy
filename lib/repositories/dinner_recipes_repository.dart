import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:co_jemy/models/dinner_recipe_model.dart';
import 'package:firebase_auth/firebase_auth.dart';

class DinnerRecipesRepository {
  Stream<List<DinnerRecipeModel>> getDinnerRecipesStream() {
    final userID = FirebaseAuth.instance.currentUser?.uid;
    if (userID == null) {
      throw Exception('Użytkownik nie jest zalogowany');
    }
    return FirebaseFirestore.instance
        .collection('users')
        .doc(userID)
        .collection('dinner_recipes')
        .snapshots()
        .map(
      (querySnapshot) {
        return querySnapshot.docs.map(
          (doc) {
            return DinnerRecipeModel(
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
        .collection('dinner_recipes')
        .doc(id)
        .delete();
  }

  Future<DinnerRecipeModel> get({required String id}) async {
    final userID = FirebaseAuth.instance.currentUser?.uid;
    if (userID == null) {
      throw Exception('Użytkownik nie jest zalogowany');
    }
    final doc = await FirebaseFirestore.instance
        .collection('users')
        .doc(userID)
        .collection('dinner_recipes')
        .doc(id)
        .get();
    return DinnerRecipeModel(
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
        .collection('dinner_recipes')
        .add(
      {
        'name': name,
        'ingredients': ingredients,
        'recipe': recipe,
      },
    );
  }
}
