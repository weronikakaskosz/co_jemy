import 'package:co_jemy/app/home/recipes/pages/cake_page_tab.dart';
import 'package:co_jemy/app/home/recipes/pages/dinner_page_tab.dart';
import 'package:flutter/material.dart';

class RecipesPageContent extends StatelessWidget {
  const RecipesPageContent({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        appBar: AppBar(
          title: const Text('Co jemy?'),
          centerTitle: true,
          bottom: const TabBar(
            tabs: [
              Tab(text: 'Obiad'),
              Tab(text: 'Ciasto'),
            ],
          ),
        ),
        body: const TabBarView(children: [
          DinnerPageTab(),
          CakePageTab(),
        ]),
      ),
    );
  }
}
