part of 'add_cake_recipe_cubit.dart';

@immutable
class AddCakeRecipeState {
  final bool saved;
  final String errorMessage;

  const AddCakeRecipeState({
    this.saved = false,
    this.errorMessage = '',
  });
}
