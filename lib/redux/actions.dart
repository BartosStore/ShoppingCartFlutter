import 'package:shop_list_redux/model/cart_item.dart';

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
