import 'package:flutter/material.dart';
import 'empty_invoice_screen.dart';
import 'package:provider/provider.dart';
import '../models/models.dart';
import 'business_card_item_screen.dart';
import 'business_card_todo_list_screen.dart';

class BusinessCardListScreen extends StatelessWidget {
  const BusinessCardListScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    //5
    return Scaffold(
      //6
      floatingActionButton: FloatingActionButton(
        child: const Icon(Icons.add),
        onPressed: () {
          //1
          final manager = Provider.of<BusinessCardManager>(
              context,
              listen: false);
          //2
          Navigator.push(
            context,
            //3
            MaterialPageRoute(
              //4
              builder: (context) => BusinessCardItemScreen(
                //5
                onCreate: (item) {
                  //6
                  manager.addItem(item);
                  //7
                  Navigator.pop(context);
                },
                //8
                onUpdate: (item) {},
              ),
            ),
          );
        },
      ),
      //7
      body: buildGroceryScreen(),
    );
  }

  Widget buildGroceryScreen() {
    //1
    return Consumer<BusinessCardManager>(
      //2
      builder: (context, manager, child) {
        //3
        if (manager.groceryItems.isNotEmpty) {
          return BusinessCardToDoListScreen(manager: manager);
        } else {
          //4
          return const EmptyInvoiceScreen();
        }
      },
    );
  }
}
