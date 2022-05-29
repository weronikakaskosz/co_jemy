import 'package:co_jemy/app/cubit/root_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';

class MyAccountPageContent extends StatelessWidget {
  const MyAccountPageContent({
    Key? key,
    required this.email,
  }) : super(key: key);

  final String? email;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 252, 239, 238),
      appBar: AppBar(
        title: Text('Już nas opuszczasz?',
            style: GoogleFonts.courgette(fontSize: 23)),
        centerTitle: true,
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text('Jesteś zalogowany jako $email',
                style: GoogleFonts.courgette(fontSize: 18)),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                context.read<RootCubit>().signOut();
              },
              child:
                  Text('Wyloguj', style: GoogleFonts.courgette(fontSize: 18)),
            ),
          ],
        ),
      ),
    );
  }
}
