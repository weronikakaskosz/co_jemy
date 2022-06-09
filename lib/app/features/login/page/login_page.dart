import 'package:co_jemy/app/features/login/cubit/login_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';

class LoginPage extends StatefulWidget {
  LoginPage({
    Key? key,
  }) : super(key: key);

  final emailController = TextEditingController();
  final passwordController = TextEditingController();

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  var errorMessage = '';
  var isCreatingAccount = false;

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => LoginCubit(),
      child: BlocBuilder<LoginCubit, LoginState>(
        builder: (context, state) {
          return Scaffold(
            backgroundColor: const Color.fromARGB(255, 252, 239, 238),
            body: Center(
              child: Padding(
                padding: const EdgeInsets.all(20.0),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                        isCreatingAccount == true
                            ? 'Zarejestruj się'
                            : 'Zaloguj się',
                        style: GoogleFonts.courgette(fontSize: 23)),
                    const SizedBox(
                      height: 20,
                    ),
                    TextField(
                      controller: widget.emailController,
                      decoration: const InputDecoration(
                        border: OutlineInputBorder(),
                        labelText: 'E-mail',
                      ),
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    TextField(
                      controller: widget.passwordController,
                      obscureText: true,
                      decoration: const InputDecoration(
                        border: OutlineInputBorder(),
                        labelText: 'Hasło',
                      ),
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    Text(errorMessage),
                    const SizedBox(height: 20),
                    ElevatedButton(
                      onPressed: () async {
                        if (isCreatingAccount == true) {
                          // rejestracja
                          try {
                            context.read<LoginCubit>().signUp(
                                  widget.emailController.text,
                                  widget.passwordController.text,
                                );
                          } catch (error) {
                            setState(() {
                              errorMessage = 'Coś poszło nie tak';
                            });
                          }
                        } else {
                          // logowanie
                          try {
                            context.read<LoginCubit>().signIn(
                                  widget.emailController.text,
                                  widget.passwordController.text,
                                );
                          } catch (error) {
                            setState(() {
                              errorMessage = 'Coś poszło nie tak';
                            });
                          }
                        }
                      },
                      child: Text(
                          isCreatingAccount == true
                              ? 'Zarejestruj się'
                              : 'Zaloguj się',
                          style: GoogleFonts.courgette(fontSize: 18)),
                    ),
                    const SizedBox(height: 20),
                    if (isCreatingAccount == false) ...[
                      TextButton(
                        onPressed: () {
                          setState(() {
                            isCreatingAccount = true;
                          });
                        },
                        child: const Text('Utwórz konto'),
                      ),
                    ],
                    if (isCreatingAccount == true) ...[
                      TextButton(
                        onPressed: () {
                          setState(() {
                            isCreatingAccount = false;
                          });
                        },
                        child: const Text('Masz już konto?'),
                      ),
                    ],
                  ],
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
