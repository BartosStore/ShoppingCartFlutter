class ShoppingCartViewModel {
  ShoppingCartViewModel({
    this.itemsCount,
    this.checkedItemsCount,
    this.isAnyItemChecked,
    this.onItemsDelete,
  });

  final int itemsCount;
  final int checkedItemsCount;
  final bool isAnyItemChecked;
  final Function onItemsDelete;
}
