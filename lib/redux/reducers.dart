import 'package:shop_list_redux/model/cart_item.dart';
import 'package:shop_list_redux/redux/actions.dart';

List<CartItem> appReducers(List<CartItem> items, dynamic action) {
  if (action is AddCartItemAction) {
    return addItem(items, action);
  } else if (action is ToggleItemStateAction) {
    return toggleItemState(items, action);
  } 
  return items;
}

List<CartItem> addItem(List<CartItem> items, AddCartItemAction action) {
  return List.from(items)..add(action.item);
}

List<CartItem> toggleItemState(List<CartItem> items, ToggleItemStateAction action) {
  return items.map((item) => item.name == action.item.name ? action.item : item); // todo: toList?
}