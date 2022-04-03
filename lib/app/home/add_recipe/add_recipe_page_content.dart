import 'package:flutter/material.dart';

class AddRecipePageContent extends StatelessWidget {
  const AddRecipePageContent({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        appBar: AppBar(
          title: const Text('Jaki chcesz dodać przepis?'),
          centerTitle: true,
          bottom: const TabBar(
            tabs: [
              Tab(text: 'Przepis na Obiad'),
              Tab(text: 'Przepis na Ciasto'),
            ],
          ),
        ),
        body: const TabBarView(children: [
          AddDinnerRecipePageTab(),
          AddCakeRecipePageTab(),
        ]),
      ),
    );
  }
}

class AddDinnerRecipePageTab extends StatelessWidget {
  const AddDinnerRecipePageTab({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView(
      children: const [
        TextField(
          decoration: InputDecoration(
            border: OutlineInputBorder(),
            hintText: 'Nazwa',
          ),
        ),
        TextField(
          minLines: 4,
          maxLines: 8,
          keyboardType: TextInputType.multiline,
          decoration: InputDecoration(
            border: OutlineInputBorder(),
            hintText: 'Składniki',
          ),
        ),
        TextField(
          minLines: 8,
          maxLines: 12,
          keyboardType: TextInputType.multiline,
          decoration: InputDecoration(
            border: OutlineInputBorder(),
            hintText: 'Przepis',
          ),
        ),
      ],
    );
  }
}

class AddCakeRecipePageTab extends StatelessWidget {
  const AddCakeRecipePageTab({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView(
      children: const [
        TextField(
          decoration: InputDecoration(
            border: OutlineInputBorder(),
            hintText: 'Nazwa',
          ),
        ),
        TextField(
          minLines: 4,
          maxLines: 8,
          keyboardType: TextInputType.multiline,
          decoration: InputDecoration(
            border: OutlineInputBorder(),
            hintText: 'Składniki',
          ),
        ),
        TextField(
          minLines: 8,
          maxLines: 12,
          keyboardType: TextInputType.multiline,
          decoration: InputDecoration(
            border: OutlineInputBorder(),
            hintText: 'Przepis',
          ),
        ),
      ],
    );
  }
}
