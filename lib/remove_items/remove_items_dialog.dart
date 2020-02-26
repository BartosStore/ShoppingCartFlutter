import 'package:flutter/material.dart';

import 'package:flutter_redux/flutter_redux.dart';

import 'package:shop_list_redux/model/cart_item.dart';
import 'package:shop_list_redux/redux/actions.dart';

typedef OnItemRemovedCallback = Function();

class RemoveItemsDialog extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new StoreConnector<List<CartItem>, OnItemRemovedCallback>(
      converter: (store) {
        return () => store.dispatch(RemoveCartItemsAction());
      },
      builder: (context, removeCallback) =>
          RemoveItemsDialogWidget(callback: removeCallback),
    );
  }
}

class RemoveItemsDialogWidget extends StatefulWidget {
  RemoveItemsDialogWidget({this.callback});

  final OnItemRemovedCallback callback;

  _RemoveItemsDialogWidgetState createState() =>
      _RemoveItemsDialogWidgetState(removeCallback: callback);
}

class _RemoveItemsDialogWidgetState extends State<RemoveItemsDialogWidget> {
  _RemoveItemsDialogWidgetState({this.removeCallback});

  final OnItemRemovedCallback removeCallback;

  @override
  Widget build(BuildContext context) {
    return new AlertDialog(
        contentPadding: EdgeInsets.all(16.0),
        content: Text(
          'Do you realy want to remove checked items?',
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
        actions: <Widget>[
          FlatButton(
            child: Text('Remove'),
            onPressed: () {
              Navigator.pop(context);
              removeCallback();
            },
          ),
          FlatButton(
            child: Text('Cancel'),
            onPressed: () => Navigator.pop(context),
          ),
        ]);
  }
}
