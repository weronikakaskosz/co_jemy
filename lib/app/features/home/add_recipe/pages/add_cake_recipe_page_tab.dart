import 'package:co_jemy/app/features/home/add_recipe/cubit/add_cake_recipe_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class AddCakeRecipePageTab extends StatefulWidget {
  const AddCakeRecipePageTab({
    Key? key,
  }) : super(key: key);

  @override
  State<AddCakeRecipePageTab> createState() => _AddCakeRecipePageTabState();
}

class _AddCakeRecipePageTabState extends State<AddCakeRecipePageTab> {
  var cakeRecipeName = '';
  var ingredientsName = '';
  var recipeName = '';

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => AddCakeRecipeCubit(),
      child: ListView(
        children: [
          Padding(
            padding: const EdgeInsets.all(10.0),
            child: TextField(
              onChanged: (newValue) {
                setState(() {
                  cakeRecipeName = newValue;
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
          BlocBuilder<AddCakeRecipeCubit, AddCakeRecipeState>(
            builder: (context, state) {
              return Center(
                child: ElevatedButton(
                  onPressed: cakeRecipeName.isEmpty ||
                          ingredientsName.isEmpty ||
                          recipeName.isEmpty
                      ? null
                      : () {
                          context.read<AddCakeRecipeCubit>().add(
                                cakeRecipeName,
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
