import 'package:bloc/bloc.dart';
import 'package:co_jemy/repositories/cake_recipes_repository.dart';
import 'package:meta/meta.dart';

part 'add_cake_recipe_state.dart';

class AddCakeRecipeCubit extends Cubit<AddCakeRecipeState> {
  AddCakeRecipeCubit(this._cakeRecipesRepository)
      : super(const AddCakeRecipeState());

  final CakeRecipesRepository _cakeRecipesRepository;

  Future<void> add(
    String name,
    String ingredients,
    String recipe,
  ) async {
    try {
      await _cakeRecipesRepository.add(name, ingredients, recipe);
      emit(const AddCakeRecipeState(saved: true));
    } catch (error) {
      emit(AddCakeRecipeState(errorMessage: error.toString()));
    }
  }
}
