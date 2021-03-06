import 'package:co_jemy/app/features/home/add_recipe/pages/add_cake_recipe_page_tab.dart';
import 'package:co_jemy/app/features/home/add_recipe/pages/add_dinner_recipe_page_tab.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class AddRecipePageContent extends StatelessWidget {
  const AddRecipePageContent({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        backgroundColor: const Color.fromARGB(255, 252, 239, 238),
        appBar: AppBar(
          title: Text('Jaki chcesz dodać przepis?',
              style: GoogleFonts.courgette(fontSize: 25)),
          centerTitle: true,
          bottom: TabBar(
            tabs: [
              Padding(
                padding: const EdgeInsets.symmetric(
                  vertical: 18,
                ),
                child: Text(
                  'Na Obiad',
                  style: GoogleFonts.courgette(
                    fontSize: 19,
                  ),
                ),
              ),
              Text(
                'Na Ciasto',
                style: GoogleFonts.courgette(
                  fontSize: 19,
                ),
              ),
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
