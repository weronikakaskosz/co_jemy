import 'package:co_jemy/app/features/details/pages/dinner_details_page.dart';
import 'package:co_jemy/app/features/home/add_recipe/cubit/add_dinner_recipe_cubit.dart';
import 'package:co_jemy/repositories/dinner_recipes_repository.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class AddDinnerRecipePageTab extends StatefulWidget {
  const AddDinnerRecipePageTab({
    Key? key,
  }) : super(key: key);

  @override
  State<AddDinnerRecipePageTab> createState() => _AddDinnerRecipePageTabState();
}

class _AddDinnerRecipePageTabState extends State<AddDinnerRecipePageTab> {
  var dinnerRecipeName = '';
  var ingredientsName = '';
  var recipeName = '';

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => AddDinnerRecipeCubit(DinnerRecipesRepository()),
      child: ListView(
        children: [
          Padding(
            padding: const EdgeInsets.all(10.0),
            child: TextField(
              onChanged: (newValue) {
                setState(() {
                  dinnerRecipeName = newValue;
                });
              },
              decoration: const InputDecoration(
                border: OutlineInputBorder(),
                labelText: 'Nazwa',
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(10.0),
            child: TextField(
              onChanged: (newValue) {
                setState(() {
                  ingredientsName = newValue;
                });
              },
              minLines: 3,
              maxLines: 3,
              keyboardType: TextInputType.multiline,
              decoration: const InputDecoration(
                alignLabelWithHint: true,
                border: OutlineInputBorder(),
                labelText: 'Składniki',
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(10.0),
            child: TextField(
              onChanged: (newValue) {
                setState(() {
                  recipeName = newValue;
                });
              },
              minLines: 9,
              maxLines: 9,
              keyboardType: TextInputType.multiline,
              decoration: const InputDecoration(
                alignLabelWithHint: true,
                border: OutlineInputBorder(),
                labelText: 'Przepis',
              ),
            ),
          ),
          BlocBuilder<AddDinnerRecipeCubit, AddDinnerRecipeState>(
            builder: (context, state) {
              return Center(
                child: ElevatedButton(
                  onPressed: dinnerRecipeName.isEmpty ||
                          ingredientsName.isEmpty ||
                          recipeName.isEmpty
                      ? null
                      : () {
                          context.read<AddDinnerRecipeCubit>().add(
                                dinnerRecipeName,
                                ingredientsName,
                                recipeName,
                              );
                          Navigator.of(context).push(MaterialPageRoute(
                              builder: ((_) => DinnerDetailsPage(
                                  name: recipeName,
                                  ingredients: ingredientsName,
                                  recipe: dinnerRecipeName))));
                        },
                  child: const Text(
                    'Zatwierdź',
                  ),
                ),
              );
            },
          ),
        ],
      ),
    );
  }
}
