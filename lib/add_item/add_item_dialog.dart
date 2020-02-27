import 'package:flutter/material.dart';

import 'package:flutter_redux/flutter_redux.dart';

import 'package:shop_list_redux/add_item/app_item_dialog_view_model.dart';
import 'package:shop_list_redux/model/cart_item.dart';
import 'package:shop_list_redux/redux/actions.dart';
import 'package:shop_list_redux/redux/app_state.dart';

class AddItemDialog extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new StoreConnector<AppState, AddItemDialogViewModel>(
      converter: (store) {
        return AddItemDialogViewModel(
          addItem: (itemName) => store.dispatch(
            AddCartItemAction(item: CartItem(name: itemName, checked: false)),
          ),
        );
      },
      builder: (context, viewModel) =>
          AddItemDialogWidget(viewModel: viewModel),
    );
  }
}

class AddItemDialogWidget extends StatefulWidget {
  AddItemDialogWidget({this.viewModel});

  final AddItemDialogViewModel viewModel;

  @override
  State<AddItemDialogWidget> createState() {
    return AddItemDialogWidgetState(viewModel);
  }
}

class AddItemDialogWidgetState extends State<AddItemDialogWidget> {
  AddItemDialogWidgetState(this.viewModel);

  String itemName;
  final AddItemDialogViewModel viewModel;

  _handleTextChanged(String newItemName) {
    setState(() {
      itemName = newItemName;
    });
  }

  @override
  Widget build(BuildContext context) {
    return new AlertDialog(
        contentPadding: EdgeInsets.all(16.0),
        content: Row(
          children: <Widget>[
            Expanded(
              child: TextField(
                autofocus: true,
                decoration: InputDecoration(
                  labelText: 'Item Name',
                  hintText: 'eg. Milk',
                ),
                onChanged: _handleTextChanged,
              ),
            )
          ],
        ),
        actions: <Widget>[
          FlatButton(
            child: Text('Add'),
            onPressed: () {
              Navigator.pop(context);
              viewModel.addItem(itemName);
            },
          ),
          FlatButton(
            child: Text('Cancel'),
            onPressed: () => Navigator.pop(context),
          ),
        ]);
  }
}
