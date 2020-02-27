import 'package:flutter/material.dart';

import 'package:redux/redux.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:redux_thunk/redux_thunk.dart';

import 'package:shop_list_redux/redux/app_state.dart';
import 'package:shop_list_redux/redux/reducers.dart';
import 'package:shop_list_redux/shopping_cart.dart';

void main() {
  final store = new Store<AppState>(
    appReducers,
    initialState: AppState.init(),
    middleware: [thunkMiddleware]
  );

  runApp(new ReduxApp(store: store));
}

class ReduxApp extends StatelessWidget {
  ReduxApp({this.store});

  final Store<AppState> store;

  @override
  Widget build(BuildContext context) {
    return new StoreProvider<AppState>(
      store: store,
      child: MaterialApp(
        title: 'ShoppingCart',
        theme: new ThemeData(primarySwatch: Colors.blue),
        home: ShoppingCart(),
      ),
    );
  }
}
