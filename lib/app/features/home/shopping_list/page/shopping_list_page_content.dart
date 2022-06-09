import 'package:co_jemy/app/features/home/shopping_list/cubit/shopping_list_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';

class ShoppingListPageContent extends StatelessWidget {
  ShoppingListPageContent({
    Key? key,
  }) : super(key: key);

  final controller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => ShoppingListCubit()..start(),
      child: BlocBuilder<ShoppingListCubit, ShoppingListState>(
        builder: (context, state) {
          if (state.errorMessage.isNotEmpty) {
            return Center(
              child: Text(
                'Something went wrong: ${state.errorMessage}',
              ),
            );
          }

          if (state.isLoading) {
            return const Center(child: CircularProgressIndicator());
          }

          final documents = state.documents;

          return Scaffold(
            backgroundColor: const Color.fromARGB(255, 252, 239, 238),
            appBar: AppBar(
              title: Text('Czego potrzebujesz do przepisu?',
                  style: GoogleFonts.courgette(fontSize: 23)),
              centerTitle: true,
            ),
            floatingActionButton: FloatingActionButton(
              onPressed: () {
                context
                    .read<ShoppingListCubit>()
                    .addCategory(categoryName: controller.text);

                controller.clear();
              },
              child: const Icon(Icons.add),
            ),
            body: ListView(
              children: [
                for (final document in documents) ...[
                  Dismissible(
                    key: ValueKey(document.id),
                    onDismissed: (_) {
                      context
                          .read<ShoppingListCubit>()
                          .removeCategory(documentID: document.id);
                    },
                    child: CategoryWidget(
                      document['title'],
                    ),
                  ),
                ],
                Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: TextField(
                    decoration: const InputDecoration(
                      border: OutlineInputBorder(),
                      labelText: 'Składnik',
                    ),
                    controller: controller,
                  ),
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}

class CategoryWidget extends StatelessWidget {
  const CategoryWidget(
    this.title, {
    Key? key,
  }) : super(key: key);

  final String title;

  @override
  Widget build(BuildContext context) {
    return Container(
      color: const Color.fromARGB(255, 252, 205, 226),
      padding: const EdgeInsets.all(20),
      margin: const EdgeInsets.all(10),
      child: Text(
        title,
        style: GoogleFonts.courgette(fontSize: 20, color: Colors.pink),
      ),
    );
  }
}
