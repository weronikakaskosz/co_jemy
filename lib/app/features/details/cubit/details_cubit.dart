import 'package:bloc/bloc.dart';
import 'package:co_jemy/models/cake_recipe_model.dart';
import 'package:co_jemy/repositories/cake_recipes_repository.dart';

part 'details_state.dart';

class DetailsCubit extends Cubit<DetailsState> {
  DetailsCubit(this._cakeRecipesRepository)
      : super(
          DetailsState(cakeRecipeModel: null),
        );

  final CakeRecipesRepository _cakeRecipesRepository;

  Future<void> getCakeRecipeWithID(String id) async {
    final cakeRecipeModel = await _cakeRecipesRepository.get(id: id);
    emit(
      DetailsState(cakeRecipeModel: cakeRecipeModel),
    );
  }
}
