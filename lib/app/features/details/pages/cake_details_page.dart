import 'package:co_jemy/app/features/details/cubit/cake_details_cubit.dart';
import 'package:co_jemy/repositories/cake_recipes_repository.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';

class CakeDetailsPage extends StatelessWidget {
  const CakeDetailsPage({Key? key, required this.id}) : super(key: key);

  final String id;

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) =>
          CakeDetailsCubit(CakeRecipesRepository())..getCakeRecipeWithID(id),
      child: BlocBuilder<CakeDetailsCubit, CakeDetailsState>(
        builder: (context, state) {
          final cakeRecipeModel = state.cakeRecipeModel;

          if (cakeRecipeModel == null) {
            return const Center(child: CircularProgressIndicator());
          }

          return Scaffold(
            backgroundColor: const Color.fromARGB(255, 252, 239, 238),
            body: ListView(
              padding: const EdgeInsets.symmetric(
                vertical: 15,
                horizontal: 10,
              ),
              children: [
                CakeWidget(
                  cakeRecipeModel.name,
                  cakeRecipeModel.ingredients,
                  cakeRecipeModel.recipe,
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}

class CakeWidget extends StatelessWidget {
  const CakeWidget(
    this.name,
    this.ingredients,
    this.recipe, {
    Key? key,
  }) : super(key: key);

  final String name;
  final String ingredients;
  final String recipe;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          width: double.maxFinite,
          color: const Color.fromARGB(255, 252, 205, 226),
          padding: const EdgeInsets.all(20),
          margin: const EdgeInsets.all(10),
          child: Text(
            name,
            style: GoogleFonts.courgette(fontSize: 20, color: Colors.pink),
          ),
        ),
        Container(
          width: double.maxFinite,
          color: const Color.fromARGB(255, 252, 205, 226),
          padding: const EdgeInsets.all(20),
          margin: const EdgeInsets.all(10),
          child: Text(
            ingredients,
            style: GoogleFonts.courgette(fontSize: 20, color: Colors.pink),
          ),
        ),
        Container(
            width: double.maxFinite,
            color: const Color.fromARGB(255, 252, 205, 226),
            padding: const EdgeInsets.all(20),
            margin: const EdgeInsets.all(10),
            child: Text(
              recipe,
              style: GoogleFonts.courgette(fontSize: 20, color: Colors.pink),
            )),
      ],
    );
  }
}
