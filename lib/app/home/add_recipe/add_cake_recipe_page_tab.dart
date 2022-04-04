import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

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
    return ListView(
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
            FirebaseFirestore.instance.collection('cake_recipes').add({
              'name': cakeRecipeName,
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
