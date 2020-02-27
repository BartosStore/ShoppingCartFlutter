import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:shop_list_redux/list/shopping_list_item_view_model.dart';

import 'package:shop_list_redux/model/cart_item.dart';
import 'package:shop_list_redux/redux/actions.dart';
import 'package:shop_list_redux/redux/app_state.dart';

class ShoppingListItem extends StatelessWidget {
  ShoppingListItem({this.item});

  final CartItem item;

  @override
  Widget build(BuildContext context) {
    return StoreConnector<AppState, ShoppingListItemViewModel>(
      converter: (store) {
        return ShoppingListItemViewModel(
          onToggle: (item) => store.dispatch(ToggleItemStateAction(item: item)),
          removeItem: (item) => store.dispatch(RemoveCartItemAction(item)),
        );
      },
      builder: (context, viewModel) => Dismissible(
        key: Key(item.name),
        onDismissed: (_) => viewModel.removeItem(item),
        child: Card(
          child: CheckboxListTile(
            title: Text(item.name),
            value: item.checked,
            onChanged: (bool newValue) => viewModel.onToggle(
              CartItem(
                name: item.name,
                checked: newValue,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
