class OrderItem {
  final int product;
  final int id;
  final int quantity;
  final String total;
  final String productName;
  final double productPrice;
  final String? productImage;

  OrderItem({
    required this.product,
    required this.id,
    required this.quantity,
    required this.total,
    required this.productName,
    required this.productPrice,
    this.productImage,
  });
}

class OrderResult {
  final String uid;
  final List<OrderItem> items;
  final String orderTotal;

  OrderResult({
    required this.uid,
    required this.items,
    required this.orderTotal,
  });
}
