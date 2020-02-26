import 'package:flutter/material.dart';
import 'package:shop_list_redux/model/cart_item.dart';

class ShoppingListItem extends StatelessWidget {
  ShoppingListItem({this.item});

  final CartItem item;

  @override
  Widget build(BuildContext context) {
    return Text(item.name);
  }
}
