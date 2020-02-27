import 'package:shop_list_redux/model/cart_item.dart';

class ApiClient {
  Future<List<CartItem>> fetchItem() async {
    List<CartItem> items = [
      CartItem(name: "Eggs", checked: false),
      CartItem(name: "Bread", checked: false),
      CartItem(name: "Ham", checked: false),
    ];
    return new Future.delayed(
        Duration(seconds: 1), () => items);
  }
}
