import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:shop_list_redux/model/cart_item.dart';
import 'package:shop_list_redux/redux/actions.dart';

typedef OnItemAddedCallback = Function(String itemName);

class AddItemDialog extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new StoreConnector<List<CartItem>, OnItemAddedCallback>(
      converter: (store) {
        return (itemName) => store.dispatch(
            AddCartItemAction(item: CartItem(name: itemName, checked: false)));
      },
      builder: (context, callback) => AddItemDialogWidget(callback: callback),
    );
  }
}

class AddItemDialogWidget extends StatefulWidget {
  AddItemDialogWidget({this.callback});

  final OnItemAddedCallback callback;

  @override
  State<AddItemDialogWidget> createState() {
    return AddItemDialogWidgetState(callback);
  }
}

class AddItemDialogWidgetState extends State<AddItemDialogWidget> {
  String itemName;

  final OnItemAddedCallback callback;
  AddItemDialogWidgetState(this.callback);

  _handleTextChanged(String newItemName) {
    setState(() {
      itemName = newItemName;
    });
  }

  @override
  Widget build(BuildContext context) {
    return new AlertDialog(
        content: TextField(
          onChanged: _handleTextChanged,
        ),
        actions: <Widget>[
          FlatButton(
            child: Text('Add'),
            onPressed: () {
              callback(itemName);
            },
          )
        ]);
  }
}
