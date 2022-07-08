import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:co_jemy/models/cake_recipe_model.dart';

class CakeRecipesRepository {
  Stream<List<CakeRecipeModel>> getCakeRecipesStream() {
    return FirebaseFirestore.instance
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
    return FirebaseFirestore.instance
        .collection('cake_recipes')
        .doc(id)
        .delete();
  }

  Future<CakeRecipeModel> get({required String id}) async {
    final doc = await FirebaseFirestore.instance
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
    await FirebaseFirestore.instance.collection('cake_recipes').add(
      {
        'name': name,
        'ingredients': ingredients,
        'recipe': recipe,
      },
    );
  }
}
