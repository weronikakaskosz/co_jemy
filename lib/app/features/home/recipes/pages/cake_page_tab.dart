import 'package:co_jemy/app/features/home/recipes/cubit/cake_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';

class CakePageTab extends StatelessWidget {
  const CakePageTab({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => CakeCubit()..start(),
      child: BlocBuilder<CakeCubit, CakeState>(builder: (context, state) {
        if (state.errorMessage.isNotEmpty) {
          return Center(
            child: Text(
              'Something went wrong: ${state.errorMessage}',
            ),
          );
        }

        if (state.isLoading) {
          return const Center(child: CircularProgressIndicator());
        }

        final documents = state.documents;

        return ListView(
          padding: const EdgeInsets.symmetric(
            vertical: 15,
            horizontal: 10,
          ),
          children: [
            for (final document in documents) ...[
              Dismissible(
                key: ValueKey(document.id),
                background: const DecoratedBox(
                  decoration: BoxDecoration(color: Colors.pink),
                  child: Align(
                    alignment: Alignment.centerRight,
                    child: Padding(
                      padding: EdgeInsets.only(right: 35),
                      child: Icon(Icons.delete),
                    ),
                  ),
                ),
                onDismissed: (_) {
                  context.read<CakeCubit>().removeCake(documentID: document.id);
                },
                child: CakeWidget(
                  document['name'],
                ),
              ),
            ],
          ],
        );
      }),
    );
  }
}

class CakeWidget extends StatelessWidget {
  const CakeWidget(
    this.name, {
    Key? key,
  }) : super(key: key);

  final String name;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.maxFinite,
      color: const Color.fromARGB(255, 252, 205, 226),
      padding: const EdgeInsets.all(20),
      margin: const EdgeInsets.all(10),
      child: Text(
        name,
        style: GoogleFonts.courgette(fontSize: 20, color: Colors.pink),
      ),
    );
  }
}
