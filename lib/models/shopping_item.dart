class ShoppingItem {
  final int? id;
  final String name;
  final int quantity;

  ShoppingItem({this.id, required this.name, required this.quantity});

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'name': name,
      'quantity': quantity,
    };
  }
}