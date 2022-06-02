part of 'login_cubit.dart';

@immutable
class LoginState {
  final String errorMessage;
  final bool isCreatingAccount;

  const LoginState({
    required this.errorMessage,
    required this.isCreatingAccount,
  });
}
