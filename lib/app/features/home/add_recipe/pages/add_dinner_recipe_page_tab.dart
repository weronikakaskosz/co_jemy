import 'package:co_jemy/app/features/home/add_recipe/cubit/add_dinner_recipe_cubit.dart';
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
      create: (context) => AddDinnerRecipeCubit(),
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
                hintText: 'Nazwa',
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
              minLines: 6,
              maxLines: 6,
              keyboardType: TextInputType.multiline,
              decoration: const InputDecoration(
                border: OutlineInputBorder(),
                hintText: 'Składniki',
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
                border: OutlineInputBorder(),
                hintText: 'Przepis',
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
