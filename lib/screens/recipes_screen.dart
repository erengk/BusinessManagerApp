import 'package:flutter/material.dart';
import '../api/mock_businesscard_service.dart';
import '../components/components.dart';
import '../models/models.dart';

class RecipesScreen extends StatelessWidget {
  final exploreService = MockBusinessCardService();

  RecipesScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: exploreService.getRecipes(),
      builder: (context, AsyncSnapshot<List<SimpleRecipe>> snapshot) {
        if (snapshot.connectionState == ConnectionState.done) {
          return RecipesGridView(recipes: snapshot.data ?? []);
        } else {
          return const Center(child: CircularProgressIndicator());
        }
      },
    );
  }
}
