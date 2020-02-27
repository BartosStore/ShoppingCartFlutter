import 'package:flutter/material.dart';

import 'package:flutter_redux/flutter_redux.dart';

import 'package:shop_list_redux/redux/actions.dart';
import 'package:shop_list_redux/redux/app_state.dart';
import 'package:shop_list_redux/remove_items/remove_items_dialog_view_model.dart';

typedef OnItemRemovedCallback = Function();

class RemoveItemsDialog extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new StoreConnector<AppState, RemoveItemsDialogViewModel>(
      converter: (store) {
        return RemoveItemsDialogViewModel(
          () => store.dispatch(RemoveCartItemsAction()),
        );
      },
      builder: (context, viewModel) =>
          RemoveItemsDialogWidget(viewModel: viewModel),
    );
  }
}

class RemoveItemsDialogWidget extends StatefulWidget {
  RemoveItemsDialogWidget({this.viewModel});

  final RemoveItemsDialogViewModel viewModel;

  _RemoveItemsDialogWidgetState createState() =>
      _RemoveItemsDialogWidgetState(viewModel: viewModel);
}

class _RemoveItemsDialogWidgetState extends State<RemoveItemsDialogWidget> {
  _RemoveItemsDialogWidgetState({this.viewModel});

  final RemoveItemsDialogViewModel viewModel;

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
              viewModel.deleteCheckedItems();
            },
          ),
          FlatButton(
            child: Text('Cancel'),
            onPressed: () => Navigator.pop(context),
          ),
        ]);
  }
}
