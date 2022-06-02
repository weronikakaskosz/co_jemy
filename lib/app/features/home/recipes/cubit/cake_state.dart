part of 'cake_cubit.dart';

@immutable
class CakeState {
  final List<QueryDocumentSnapshot<Object?>> documents;
  final bool isLoading;
  final String errorMessage;

  const CakeState({
    required this.documents,
    required this.isLoading,
    required this.errorMessage,
  });
}
