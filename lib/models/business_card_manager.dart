import 'package:flutter/material.dart';
import 'business_card_item.dart';

class BusinessCardManager extends ChangeNotifier{
  //1
  final _businessCardItems = <BusinessCardItem>[];
  //2
List<BusinessCardItem> get groceryItems =>
    List.unmodifiable(_businessCardItems);
//3
void deleteItem(int index){
  _businessCardItems.removeAt(index);
  notifyListeners();
}
//4
void addItem(BusinessCardItem item){
  _businessCardItems.add(item);
  notifyListeners();
}
//5
void updateItem(BusinessCardItem item, int index){
  _businessCardItems[index] = item;
  notifyListeners();
}
//6
void completeItem(int index, bool change){
  final item = _businessCardItems[index];
  _businessCardItems[index] = item.copyWith(isComplete: change);
  notifyListeners();
}
}