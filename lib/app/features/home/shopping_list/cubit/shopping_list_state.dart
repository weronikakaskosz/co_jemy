part of 'shopping_list_cubit.dart';

@immutable
class ShoppingListState {
  final List<QueryDocumentSnapshot<Map<String, dynamic>>> documents;
  final List<QueryDocumentSnapshot<Map<String, dynamic>>> document;

  final bool isLoading;
  final String errorMessage;
  final bool added;

  const ShoppingListState(
      {required this.documents,
      required this.document,
      required this.isLoading,
      required this.errorMessage,
      required this.added});
}
