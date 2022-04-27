import 'package:co_jemy/app/features/home/add_recipe/pages/add_cake_recipe_page_tab.dart';
import 'package:co_jemy/app/features/home/add_recipe/pages/add_dinner_recipe_page_tab.dart';
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
        backgroundColor: Colors.amberAccent,
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
        body: const TabBarView(
          children: [
            AddDinnerRecipePageTab(),
            AddCakeRecipePageTab(),
          ],
        ),
      ),
    );
  }
}
