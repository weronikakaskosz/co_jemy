part of 'dinner_cubit.dart';

@immutable
class DinnerState {
  final List<DinnerRecipeModel> recipes;
  final bool isLoading;
  final String errorMessage;

  const DinnerState({
    required this.recipes,
    required this.isLoading,
    required this.errorMessage,
  });
}
