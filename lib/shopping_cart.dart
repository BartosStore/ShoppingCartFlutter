import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';

import 'package:shop_list_redux/add_item/add_item_dialog.dart';

import 'package:shop_list_redux/list/shopping_list.dart';
import 'package:shop_list_redux/redux/app_state.dart';
import 'package:shop_list_redux/remove_items/remove_items_dialog.dart';
import 'package:shop_list_redux/shopping_cart_view_model.dart';

class ShoppingCart extends StatelessWidget {
  ShoppingCart({Key key}) : super(key: key);

  _openAddItemDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (context) => AddItemDialog(),
    );
  }

  _openRemoveItemsDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (context) => RemoveItemsDialog(),
    );
  }

  _renderDescription() {
    return StoreConnector<AppState, ShoppingCartViewModel>(
      converter: (store) => ShoppingCartViewModel(
        itemsCount: store.state.cartItems.length,
        checkedItemsCount:
            store.state.cartItems.where((item) => item.checked == true).length,
      ),
      builder: (context, viewModel) => Container(
        alignment: Alignment.topLeft,
        padding: EdgeInsets.all(8.0),
        child: Text(
            '${viewModel.itemsCount} items in your cart and ${viewModel.checkedItemsCount} checked'),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('ShoppingCart'),
      ),
      body: Column(
        children: <Widget>[
          _renderDescription(),
          Flexible(
            child: ShoppingList(),
          ),
        ],
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.endFloat,
      floatingActionButton: Padding(
        padding: EdgeInsets.all(8.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.end,
          children: <Widget>[
            Padding(
              padding: EdgeInsets.only(bottom: 8.0),
              child: FloatingActionButton(
                onPressed: () => _openAddItemDialog(context),
                child: Icon(
                  Icons.add,
                ),
              ),
            ),
            FloatingActionButton(
              onPressed: () => _openRemoveItemsDialog(context),
              child: Icon(
                Icons.remove,
              ),
            )
          ],
        ),
      ),
    );
  }
}
