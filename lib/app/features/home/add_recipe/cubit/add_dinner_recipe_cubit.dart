import 'package:bloc/bloc.dart';
import 'package:co_jemy/repositories/dinner_recipes_repository.dart';
import 'package:meta/meta.dart';

part 'add_dinner_recipe_state.dart';

class AddDinnerRecipeCubit extends Cubit<AddDinnerRecipeState> {
  AddDinnerRecipeCubit(this._dinnerRecipesRepository)
      : super(const AddDinnerRecipeState());

  final DinnerRecipesRepository _dinnerRecipesRepository;

  Future<void> add(
    String name,
    String ingredients,
    String recipe,
  ) async {
    try {
      await _dinnerRecipesRepository.add(name, ingredients, recipe);
      emit(const AddDinnerRecipeState(saved: true));
    } catch (error) {
      emit(
        AddDinnerRecipeState(
          errorMessage: error.toString(),
        ),
      );
    }
  }
}
