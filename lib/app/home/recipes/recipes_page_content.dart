import 'package:cloud_firestore/cloud_firestore.dart';
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

class DinnerPageTab extends StatelessWidget {
  const DinnerPageTab({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return StreamBuilder<QuerySnapshot<Map<String, dynamic>>>(
        stream:
            FirebaseFirestore.instance.collection('dinner_recipes').snapshots(),
        builder: (context, snapshot) {
          if (snapshot.hasError) {
            return const Center(child: Text('Something went wrong'));
          }

          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(child: Text("Loading"));
          }

          final documents = snapshot.data!.docs;

          return ListView(
            children: [
              for (final document in documents) ...[
                Padding(
                  padding: const EdgeInsets.all(20.0),
                  child: Text(document['name']),
                ),
                const SizedBox(height: 20),
                Padding(
                  padding: const EdgeInsets.all(20.0),
                  child: Text(document['ingredients']),
                ),
                const SizedBox(height: 20),
                Padding(
                  padding: const EdgeInsets.all(20.0),
                  child: Text(document['recipe']),
                ),
              ],
            ],
          );
        });
  }
}

class CakePageTab extends StatelessWidget {
  const CakePageTab({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return StreamBuilder<QuerySnapshot<Map<String, dynamic>>>(
        stream:
            FirebaseFirestore.instance.collection('cake_recipes').snapshots(),
        builder: (context, snapshot) {
          if (snapshot.hasError) {
            return const Center(child: Text('Something went wrong'));
          }

          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(child: Text("Loading"));
          }

          final documents = snapshot.data!.docs;

          return ListView(
            children: [
              for (final document in documents) ...[
                Padding(
                  padding: const EdgeInsets.all(20.0),
                  child: Text(document['name']),
                ),
                const SizedBox(height: 20),
                Padding(
                  padding: const EdgeInsets.all(20.0),
                  child: Text(document['ingredients']),
                ),
                const SizedBox(height: 20),
                Padding(
                  padding: const EdgeInsets.all(20.0),
                  child: Text(document['recipe']),
                ),
              ],
            ],
          );
        });
  }
}
