import 'package:bloc/bloc.dart';
import 'package:co_jemy/models/cake_recipe_model.dart';
import 'package:co_jemy/repositories/cake_recipes_repository.dart';

part 'cake_details_state.dart';

class CakeDetailsCubit extends Cubit<CakeDetailsState> {
  CakeDetailsCubit(this._cakeRecipesRepository)
      : super(
          CakeDetailsState(cakeRecipeModel: null),
        );

  final CakeRecipesRepository _cakeRecipesRepository;

  Future<void> getCakeRecipeWithID(String id) async {
    final cakeRecipeModel = await _cakeRecipesRepository.get(id: id);
    emit(
      CakeDetailsState(cakeRecipeModel: cakeRecipeModel),
    );
  }
}
