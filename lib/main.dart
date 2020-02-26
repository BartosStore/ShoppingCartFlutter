import 'package:flutter/material.dart';

import 'package:flutter_redux/flutter_redux.dart';
import 'package:redux/redux.dart';

import 'package:shop_list_redux/redux/reducers.dart';
import 'package:shop_list_redux/model/cart_item.dart';
import 'package:shop_list_redux/shopping_cart_app.dart';

void main() {
  final store = new Store<List<CartItem>>(
    appReducers,
    initialState: new List(),
  );

  runApp(new ReduxApp(store: store));
}

class ReduxApp extends StatelessWidget {
  ReduxApp({this.store});

  final Store<List<CartItem>> store;

  @override
  Widget build(BuildContext context) {
    return new StoreProvider<List<CartItem>>(
      store: store,
      child: new ShoppingCartApp(store: store),
    );
  }
}
