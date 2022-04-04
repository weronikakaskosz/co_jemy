import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

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
    return ListView(
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
        ElevatedButton(
          onPressed: () {
            FirebaseFirestore.instance.collection('dinner_recipes').add({
              'name': dinnerRecipeName,
              'ingredients': ingredientsName,
              'recipe': recipeName,
            });
          },
          child: const Text(
            'Zatwierdź',
          ),
        ),
      ],
    );
  }
}
