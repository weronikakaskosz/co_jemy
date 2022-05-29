import 'package:co_jemy/app/features/home/recipes/pages/cake_page_tab.dart';
import 'package:co_jemy/app/features/home/recipes/pages/dinner_page_tab.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class RecipesPageContent extends StatelessWidget {
  const RecipesPageContent({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        backgroundColor: const Color.fromARGB(255, 252, 239, 238),
        appBar: AppBar(
          title: Text(
            'Co jemy?',
            style: GoogleFonts.courgette(fontSize: 30),
          ),
          centerTitle: true,
          bottom: TabBar(
            tabs: [
              Text('Obiad', style: GoogleFonts.courgette(fontSize: 20)),
              Text('Ciasto', style: GoogleFonts.courgette(fontSize: 20)),
            ],
          ),
        ),
        body: const TabBarView(
          children: [
            DinnerPageTab(),
            CakePageTab(),
          ],
        ),
      ),
    );
  }
}
