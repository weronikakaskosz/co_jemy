import 'package:co_jemy/app/features/details/cubit/details_cubit.dart';
import 'package:co_jemy/repositories/cake_recipes_repository.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';

class DetailsPage extends StatelessWidget {
  const DetailsPage({Key? key, required this.id}) : super(key: key);

  final String id;

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) =>
          DetailsCubit(CakeRecipesRepository())..getCakeRecipeWithID(id),
      child: BlocBuilder<DetailsCubit, DetailsState>(builder: (context, state) {
        final cakeRecipeModel = state.cakeRecipeModel;

        if (cakeRecipeModel == null) {
          return const Center(child: CircularProgressIndicator());
        }

        return ListView(
          padding: const EdgeInsets.symmetric(
            vertical: 15,
            horizontal: 10,
          ),
          children: [
            DetailsWidget(
              cakeRecipeModel.name,
            ),
          ],
        );
      }),
    );
  }
}

class DetailsWidget extends StatelessWidget {
  const DetailsWidget(
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
