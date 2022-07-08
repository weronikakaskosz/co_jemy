import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:co_jemy/models/dinner_recipe_model.dart';

class DinnerRecipesRepository {
  Stream<List<DinnerRecipeModel>> getDinnerRecipesStream() {
    return FirebaseFirestore.instance
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
    return FirebaseFirestore.instance
        .collection('dinner_recipes')
        .doc(id)
        .delete();
  }

  Future<DinnerRecipeModel> get({required String id}) async {
    final doc = await FirebaseFirestore.instance
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
    await FirebaseFirestore.instance.collection('dinner_recipes').add(
      {
        'name': name,
        'ingredients': ingredients,
        'recipe': recipe,
      },
    );
  }
}
