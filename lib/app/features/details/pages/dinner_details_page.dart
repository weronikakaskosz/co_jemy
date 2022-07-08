import 'package:co_jemy/app/features/details/cubit/dinner_details_cubit.dart';
import 'package:co_jemy/repositories/dinner_recipes_repository.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';

class DinnerDetailsPage extends StatelessWidget {
  const DinnerDetailsPage({Key? key, required this.id}) : super(key: key);

  final String id;

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => DinnerDetailsCubit(DinnerRecipesRepository())
        ..getDinnerRecipeWithID(id),
      child: BlocBuilder<DinnerDetailsCubit, DinnerDetailsState>(
        builder: (context, state) {
          final dinnerRecipeModel = state.dinnerRecipeModel;

          if (dinnerRecipeModel == null) {
            return const Center(child: CircularProgressIndicator());
          }

          return ListView(
            padding: const EdgeInsets.symmetric(
              vertical: 15,
              horizontal: 10,
            ),
            children: [
              DinnerWidget(
                dinnerRecipeModel.name,
              ),
            ],
          );
        },
      ),
    );
  }
}

class DinnerWidget extends StatelessWidget {
  const DinnerWidget(
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
