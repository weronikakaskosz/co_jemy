import 'package:flutter/material.dart';

class AddCakeRecipePageTab extends StatelessWidget {
  const AddCakeRecipePageTab({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView(
      children: const [
        Padding(
          padding: EdgeInsets.all(10.0),
          child: TextField(
            decoration: InputDecoration(
              border: OutlineInputBorder(),
              hintText: 'Nazwa',
            ),
          ),
        ),
        Padding(
          padding: EdgeInsets.all(10.0),
          child: TextField(
            minLines: 8,
            maxLines: 8,
            keyboardType: TextInputType.multiline,
            decoration: InputDecoration(
              border: OutlineInputBorder(),
              hintText: 'Składniki',
            ),
          ),
        ),
        Padding(
          padding: EdgeInsets.all(10.0),
          child: TextField(
            minLines: 11,
            maxLines: 11,
            keyboardType: TextInputType.multiline,
            decoration: InputDecoration(
              border: OutlineInputBorder(),
              hintText: 'Przepis',
            ),
          ),
        ),
      ],
    );
  }
}
