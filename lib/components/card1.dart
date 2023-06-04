import 'package:flutter/material.dart';

import '../business_card_theme.dart';
import '../models/models.dart';

class Card1 extends StatelessWidget {
  final ExploreRecipe recipe;

  const Card1({
    super.key,
    required this.recipe,
  });

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        padding: const EdgeInsets.all(16),
        constraints: const BoxConstraints.expand(
          width: 350,
          height: 450,
        ),
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage(recipe.backgroundImage),
            fit: BoxFit.cover,
          ),
          borderRadius: const BorderRadius.all(Radius.circular(10.0)),
        ),
        child: Stack(
          children: [
            Text(
              recipe.subtitle,
              style: BusinessCardTheme.darkTextTheme.bodyText1,
            ),
            Positioned(
              top: 20,
              child: Text(
                recipe.title,
                style: BusinessCardTheme.darkTextTheme.headline2,
              ),
            ),
            Positioned(
              bottom: 30,
              right: 0,
              child: Text(
                recipe.message,
                style: BusinessCardTheme.darkTextTheme.bodyText1,
              ),
            ),
            Positioned(
              bottom: 10,
              right: 0,
              child: Text(
                recipe.authorName,
                style: BusinessCardTheme.darkTextTheme.bodyText1,
              ),
            )
          ],
        ),
      ),
    );
  }
}
