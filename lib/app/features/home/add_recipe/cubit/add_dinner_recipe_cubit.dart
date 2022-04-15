import 'package:bloc/bloc.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:meta/meta.dart';

part 'add_dinner_recipe_state.dart';

class AddDinnerRecipeCubit extends Cubit<AddDinnerRecipeState> {
  AddDinnerRecipeCubit() : super(const AddDinnerRecipeState());

  Future<void> add(
    String name,
    String ingredients,
    String recipe,
  ) async {
    try {
      await FirebaseFirestore.instance.collection('dinner_recipes').add(
        {
          'name': name,
          'ingredients': ingredients,
          'recipe': recipe,
        },
      );
      emit(const AddDinnerRecipeState(saved: true));
    } catch (error) {
      emit(AddDinnerRecipeState(errorMessage: error.toString()));
    }
  }
}
