import 'package:get/get.dart';
import 'package:shopping/models/shopping_item.dart';
import '../database/database_helper.dart';

class ShoppingController extends GetxController {
  final DatabaseHelper _dbHelper = DatabaseHelper();
  var items = <ShoppingItem>[].obs;

  @override
  void onInit() {
    super.onInit();
    loadItems();
  }

  Future<void> loadItems() async {
    items.value = await _dbHelper.getItems();
  }

  Future<void> addItem(String name, int quantity) async {
    final item = ShoppingItem(name: name, quantity: quantity);
    await _dbHelper.insertItem(item);
    loadItems();
  }

  Future<void> deleteItem(int id) async {
    await _dbHelper.deleteItem(id);
    loadItems();
  }
}
