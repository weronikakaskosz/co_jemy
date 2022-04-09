import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'add_cake_recipe_state.dart';

class AddCakeRecipeCubit extends Cubit<AddCakeRecipeState> {
  AddCakeRecipeCubit() : super(AddCakeRecipeInitial());
}
