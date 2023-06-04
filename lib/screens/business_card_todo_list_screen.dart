import 'package:flutter/material.dart';
import '../components/business_card_tile.dart';
import '../models/models.dart';
import 'business_card_item_screen.dart';

class BusinessCardToDoListScreen extends StatelessWidget {
  final BusinessCardManager manager;

  const BusinessCardToDoListScreen({
    Key? key,
    required this.manager,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    //1
    final groceryItems = manager.groceryItems;
    //2
    return Padding(
      padding: const EdgeInsets.all(16.0),
      //3
      child: ListView.separated(
        //4
        itemCount: groceryItems.length,
        itemBuilder: (context, index) {
          final item = groceryItems[index];
          //1
          return Dismissible(
            //6
            key: Key(item.id),
            //7
            direction: DismissDirection.endToStart,
            //8
            background: Container(
                color: Colors.red,
                alignment: Alignment.centerRight,
                child: const Icon(Icons.delete_forever,
                    color: Colors.white, size: 50.0)),
            //9
            onDismissed: (direction) {
              //10
              manager.deleteItem(index);
              //11
              ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(content: Text('${item.name} dismissed')));
            },
            child: InkWell(
              child: GroceryTile(
                key: Key(item.id),
                item: item,
                onComplete: (change) {
                  if (change != null) {
                    manager.completeItem(index, change);
                  }
                },
              ),
              //2
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => BusinessCardItemScreen(
                      originalItem: item,
                      //3
                      onUpdate: (item) {
                        //4
                        manager.updateItem(item, index);
                        //5
                        Navigator.pop(context);
                      },
                      //6
                      onCreate: (item) {},
                    ),
                  ),
                );
              },
            ),
          );
        },
        //8
        separatorBuilder: (context, index) {
          return const SizedBox(height: 16.0);
        },
      ),
    );
  }
}
