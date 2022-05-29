import 'package:co_jemy/app/features/home/add_recipe/pages/add_recipe_page_content.dart';
import 'package:co_jemy/app/features/home/recipes/pages/recipes_page_content.dart';
import 'package:co_jemy/app/features/home/my_account/my_account_page_content.dart';
import 'package:co_jemy/app/features/home/shopping_list/page/shopping_list_page_content.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({
    Key? key,
    required this.user,
  }) : super(key: key);

  final User user;

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  var currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Builder(builder: (context) {
        if (currentIndex == 0) {
          return const RecipesPageContent();
        }
        if (currentIndex == 1) {
          return const AddRecipePageContent();
        }
        if (currentIndex == 2) {
          return ShoppingListPageContent();
        }
        return MyAccountPageContent(email: widget.user.email);
      }),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: currentIndex,
        onTap: (newIndex) {
          setState(() {
            currentIndex = newIndex;
          });
        },
        type: BottomNavigationBarType.fixed,
        backgroundColor: const Color.fromARGB(255, 252, 239, 238),
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Strona główna',
          ),
          BottomNavigationBarItem(
              icon: Icon(Icons.add), label: 'Dodaj przepis'),
          BottomNavigationBarItem(
              icon: Icon(Icons.list), label: 'Lista zakupów'),
          BottomNavigationBarItem(
              icon: Icon(Icons.person), label: 'Moje konto'),
        ],
      ),
    );
  }
}
