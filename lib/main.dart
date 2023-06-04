import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'models/models.dart';
import 'business_card_theme.dart';
import 'home.dart';

void main() {
  runApp(const BusinessCard());
}

class BusinessCard extends StatelessWidget {
  const BusinessCard({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final theme = BusinessCardTheme.light();
    return MaterialApp(
      theme: theme,
      title: 'BusinessCard',
      //1
      home: MultiProvider(
        providers: [
          //2
          ChangeNotifierProvider(create: (context) => TabManager()),
          ChangeNotifierProvider(create: (context) => BusinessCardManager()),
        ],
        child: const Home(),
      ),
    );
  }
}
