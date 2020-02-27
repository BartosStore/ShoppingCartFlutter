import 'package:shop_list_redux/model/cart_item.dart';

class AppState {
  final List<CartItem> cartItems;

  AppState({this.cartItems});

  factory AppState.init() =>
      AppState(cartItems: List()..add(CartItem(name: "Eggs", checked: false)));

  AppState copyWith(List<CartItem> cartItems) {
    return AppState(cartItems: cartItems);
  }
}
