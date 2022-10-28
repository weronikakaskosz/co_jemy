import 'package:co_jemy/app/features/details/cubit/dinner_details_cubit.dart';
import 'package:co_jemy/repositories/dinner_recipes_repository.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';

class DinnerDetailsPage extends StatelessWidget {
  const DinnerDetailsPage(
      {Key? key,
      required this.name,
      required this.ingredients,
      required this.recipe})
      : super(key: key);

  final String name;
  final String ingredients;
  final String recipe;

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => DinnerDetailsCubit(DinnerRecipesRepository()),
      child: Scaffold(
        backgroundColor: const Color.fromARGB(255, 252, 239, 238),
        body: ListView(
          padding: const EdgeInsets.symmetric(
            vertical: 15,
            horizontal: 10,
          ),
          children: [
            DinnerWidget(
              name,
              ingredients,
              recipe,
            ),
          ],
        ),
      ),
    );
  }
}

class DinnerWidget extends StatelessWidget {
  const DinnerWidget(
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
          ),
        ),
      ],
    );
  }
}
