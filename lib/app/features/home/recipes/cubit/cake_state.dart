part of 'cake_cubit.dart';

@immutable
class CakeState {
  const CakeState({
    required this.recipes,
    required this.isLoading,
    required this.errorMessage,
  });

  final List<CakeRecipeModel> recipes;
  final bool isLoading;
  final String errorMessage;
}
