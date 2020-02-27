import 'package:shop_list_redux/model/cart_item.dart';

class ApiClient {
  Future<CartItem> fetchItem() async {
    return new Future.delayed(
        Duration(seconds: 1), () => CartItem(name: "Fetch", checked: false));
  }
}
