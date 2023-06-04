import 'package:flutter/material.dart';
import 'screens/business_card_ui.dart';
import 'screens/business_card_screen.dart';
import 'screens/explore_screen.dart';
import 'package:provider/provider.dart';
import 'models/models.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  HomeState createState() => HomeState();
}

class HomeState extends State<Home> {
  int _selectedIndex = 0;

  static List<Widget> pages = <Widget>[
    BusinessCardUI(),
    ExploreScreen(),
    const BusinessCardListScreen(),
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    //1
    return Consumer<TabManager>(
      builder: (context, tabManager, child) {
        return Scaffold(
          appBar: AppBar(
            title: Text(
              'BusinessCardManager',
              style: Theme.of(context).textTheme.headline6,
            ),
          ),
          //2
          body: IndexedStack(index: tabManager.selectedTab,children: pages),
          bottomNavigationBar: BottomNavigationBar(
            selectedItemColor:
                Theme.of(context).textSelectionTheme.selectionColor,
            //3
            currentIndex: tabManager.selectedTab,
            onTap: (index) {
              //4
              tabManager.goToTab(index);
            },
            items: <BottomNavigationBarItem>[
              const BottomNavigationBarItem(
                icon: Icon(Icons.explore),
                label: 'BusinessCard',
              ),
              const BottomNavigationBarItem(
                icon: Icon(Icons.book),
                label: 'Projects',
              ),
              const BottomNavigationBarItem(
                icon: Icon(Icons.list),
                label: 'Invoice',
              ),
            ],
          ),
        );
      },
    );
  }
}
