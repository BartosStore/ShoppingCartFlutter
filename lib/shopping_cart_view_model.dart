class ShoppingCartViewModel {
  ShoppingCartViewModel(
      {this.itemsCount, this.checkedItemsCount, this.isAnyItemChecked});

  final int itemsCount;
  final int checkedItemsCount;
  final bool isAnyItemChecked;
}
