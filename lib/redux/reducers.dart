import 'package:shop_list_redux/redux/actions.dart';
import 'package:shop_list_redux/redux/app_state.dart';

AppState appReducers(AppState state, dynamic action) {
  if (action is AddCartItemAction) {
    return addItem(state, action);
  } else if (action is AddCartItemsAction) {
    return addItems(state, action);
  } else if (action is RemoveCartItemAction) {
    return removeItem(state, action);
  } else if (action is RemoveCartItemsAction) {
    return removeItems(state, action);
  } else if (action is ToggleItemStateAction) {
    return toggleItemState(state, action);
  }
  return state;
}

AppState addItem(AppState state, AddCartItemAction action) {
  return state.copyWith(List.from(state.cartItems)..add(action.item));
}

AppState addItems(AppState state, AddCartItemsAction action) {
  return state.copyWith(List.from(state.cartItems)..addAll(action.items));
}

AppState removeItem(AppState state, RemoveCartItemAction action) {
  return AppState(cartItems: List.from(state.cartItems)..remove(action.item));
}

AppState removeItems(AppState state, RemoveCartItemsAction action) {
  return AppState(
      cartItems: List.from(state.cartItems)
        ..removeWhere((item) => item.checked == true));
}

AppState toggleItemState(AppState state, ToggleItemStateAction action) {
  return state.copyWith(state.cartItems
      .map((item) => item.name == action.item.name ? action.item : item)
      .toList());
}
