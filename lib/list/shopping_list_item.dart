import 'package:flutter/material.dart';

import 'package:flutter_redux/flutter_redux.dart';

import 'package:shop_list_redux/model/cart_item.dart';
import 'package:shop_list_redux/redux/actions.dart';

typedef OnStateChanged = Function(CartItem item);

class ShoppingListItem extends StatelessWidget {
  ShoppingListItem({this.item});

  final CartItem item;

  @override
  Widget build(BuildContext context) {
    return StoreConnector<List<CartItem>, OnStateChanged>(
      converter: (store) {
        return (item) => store.dispatch(ToggleItemStateAction(item: item));
      },
      builder: (context, callback) => Card(
        child: CheckboxListTile(
          title: Text(item.name),
          value: item.checked,
          onChanged: (bool newValue) => callback(
            CartItem(
              name: item.name,
              checked: newValue,
            ),
          ),
        ),
      ),
    );
  }
}
