import 'package:bloc/bloc.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:meta/meta.dart';

part 'add_cake_recipe_state.dart';

class AddCakeRecipeCubit extends Cubit<AddCakeRecipeState> {
  AddCakeRecipeCubit() : super(const AddCakeRecipeState());

  Future<void> add(
    String name,
    String ingredients,
    String recipe,
  ) async {
    try {
      await FirebaseFirestore.instance.collection('cake_recipes').add(
        {
          'name': name,
          'ingredients': ingredients,
          'recipe': recipe,
        },
      );
      emit(const AddCakeRecipeState(saved: true));
    } catch (error) {
      emit(AddCakeRecipeState(errorMessage: error.toString()));
    }
  }
}
