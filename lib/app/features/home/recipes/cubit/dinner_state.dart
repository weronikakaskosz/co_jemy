part of 'dinner_cubit.dart';

@immutable
class DinnerState {
  final List<QueryDocumentSnapshot<Object?>> documents;
  final bool isLoading;
  final String errorMessage;

  const DinnerState({
    required this.documents,
    required this.isLoading,
    required this.errorMessage,
  });
}
