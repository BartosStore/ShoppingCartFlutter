import 'package:shop_list_redux/model/cart_item.dart';

class AddCartItemAction {
  final CartItem item;

  AddCartItemAction({this.item});
}

class ToggleItemStateAction {
  final CartItem item;

  ToggleItemStateAction({this.item});
}