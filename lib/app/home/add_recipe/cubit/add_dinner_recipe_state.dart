part of 'add_dinner_recipe_cubit.dart';

@immutable
class AddDinnerRecipeState {
  final bool saved;
  final String errorMessage;

  const AddDinnerRecipeState({
    this.saved = true,
    this.errorMessage = '',
  });
}
