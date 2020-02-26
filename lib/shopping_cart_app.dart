import 'package:flutter/material.dart';

import 'package:redux/redux.dart';
import 'package:shop_list_redux/add_item/add_item_dialog.dart';

import 'package:shop_list_redux/list/shopping_list.dart';
import 'package:shop_list_redux/model/cart_item.dart';

class ShoppingCartApp extends StatelessWidget {
  ShoppingCartApp({this.store});

  final Store<List<CartItem>> store;

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'ShoppingCart',
      theme: new ThemeData(primarySwatch: Colors.blue),
      home: ShoppingCart(),
    );
  }
}

class ShoppingCart extends StatelessWidget {
  ShoppingCart({this.store});

  final Store<List<CartItem>> store;

  _openAddItemDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (context) => AddItemDialog(),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('ShoppingCart'),
        ),
        body: ShoppingList(),
        floatingActionButton: FloatingActionButton(
          onPressed: () => _openAddItemDialog(context),
          child: Icon(
            Icons.add,
          ),
        ));
  }
}
