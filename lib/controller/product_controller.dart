import 'package:get/route_manager.dart';
import 'package:get/state_manager.dart';
import 'package:ufs_task/models/product_model.dart';
import 'package:ufs_task/service/api_service.dart';

class ProductController extends GetxController {
  var productList = <ProductModel>[].obs;
  var isLoading = true.obs;
  var error = ''.obs;

  @override
  void onInit() {
    getProducts();
    super.onInit();
  }

  void getProducts() async {
    try {
      isLoading(true);

      final products = await ApiService().fetchData();

      productList.assignAll(
        products,
      );
    } catch (e) {
      error.value = 'Cannot get products';

      Get.snackbar('Error', error.value);
    } finally {
      isLoading(false);
    }
  }

  Future<void> deleteProduct(int id) async {
    try {
      await ApiService().deleteProduct(id);

      productList.removeWhere((product) => product.id == id);

      Get.snackbar("Success", "Product deleted successfully",
          snackPosition: SnackPosition.BOTTOM);
    } catch (e) {
      Get.snackbar("Error", "Failed to delete product: $e",
          snackPosition: SnackPosition.BOTTOM);
    }
  }

  Future<void> createProduct(ProductModel newProduct) async {
    try {
      final createdProduct = await ApiService().createProduct(newProduct);

      productList.add(createdProduct);

      Get.snackbar("Success", "Product created successfully",
          snackPosition: SnackPosition.BOTTOM);
    } catch (e) {
      Get.snackbar("Error", "Failed to create product: $e",
          snackPosition: SnackPosition.BOTTOM);
    }
  }
}
