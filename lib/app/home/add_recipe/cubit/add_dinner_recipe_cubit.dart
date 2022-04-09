import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'add_dinner_recipe_state.dart';

class AddDinnerRecipeCubit extends Cubit<AddDinnerRecipeState> {
  AddDinnerRecipeCubit() : super(AddDinnerRecipeInitial());
}
