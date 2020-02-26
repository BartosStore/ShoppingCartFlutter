import 'package:flutter/material.dart';

import 'package:flutter_redux/flutter_redux.dart';

import 'package:shop_list_redux/list/shopping_list_item.dart';
import 'package:shop_list_redux/model/cart_item.dart';

class ShoppingList extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new StoreConnector<List<CartItem>, List<CartItem>>(
      converter: (store) => store.state,
      builder: (context, list) {
        return new ListView.builder(
          itemCount: list.length,
          itemBuilder: (context, position) =>
              new ShoppingListItem(item: list[position]),
        );
      },
    );
  }
}
