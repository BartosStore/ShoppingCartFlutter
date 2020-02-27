import 'package:redux/redux.dart';
import 'package:redux_thunk/redux_thunk.dart';
import 'package:shop_list_redux/api/api_client.dart';
import 'package:shop_list_redux/model/cart_item.dart';
import 'package:shop_list_redux/redux/app_state.dart';

class AddCartItemAction {
  AddCartItemAction({this.item});

  final CartItem item;
}

class RemoveCartItemAction {
  RemoveCartItemAction(this.item);

  final CartItem item;
}

class RemoveCartItemsAction {
  RemoveCartItemsAction();
}

class ToggleItemStateAction {
  ToggleItemStateAction({this.item});

  final CartItem item;
}

/// == Middleware action ==
/// Every action goes throw thunkMiddleware
/// but only ThunkAction is resolved there
ThunkAction<AppState> fetchItemAction() {
  return (Store<AppState> store) async {
    ApiClient().fetchItem().then(
          (item) => store.dispatch(
            AddCartItemAction(
              item: CartItem(name: item.name, checked: item.checked),
            ),
          ),
        );
  };
}
