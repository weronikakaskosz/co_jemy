import 'package:bloc/bloc.dart';
import 'package:co_jemy/models/dinner_recipe_model.dart';
import 'package:co_jemy/repositories/dinner_recipes_repository.dart';

part 'dinner_details_state.dart';

class DinnerDetailsCubit extends Cubit<DinnerDetailsState> {
  DinnerDetailsCubit(this._dinnerRecipesRepository)
      : super(DinnerDetailsState(dinnerRecipeModel: null));

  final DinnerRecipesRepository _dinnerRecipesRepository;

  Future<void> getDinnerRecipeWithID(String id) async {
    final dinnerRecipeModel = await _dinnerRecipesRepository.get(id: id);
    emit(DinnerDetailsState(dinnerRecipeModel: dinnerRecipeModel));
  }
}
