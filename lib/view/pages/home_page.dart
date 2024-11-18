import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:get/get.dart';
import 'package:ufs_task/controller/product_controller.dart';
import 'package:ufs_task/view/pages/new_product.dart';
import 'package:ufs_task/view/pages/product_details.dart';

class HomePage extends HookWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    Get.put(ProductController());
    final productController = Get.find<ProductController>();
    return Scaffold(
      body: SizedBox(
        child: Obx(() {
          if (productController.error.value.isNotEmpty) {
            return Center(
              child: Text(productController.error.value),
            );
          }

          if (productController.isLoading.value) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          }

          final products = productController.productList;

          return Obx(() {
            return ListView.builder(
                itemCount: products.length,
                itemBuilder: (context, index) {
                  return ListTile(
                    leading: Image.network(products[index].image),
                    title: Text(products[index].title),
                    subtitle: Text(products[index].price.toString()),
                    trailing: IconButton(
                        onPressed: () {
                          productController.deleteProduct(products[index].id);
                        },
                        icon: const Icon(Icons.delete)),
                    onTap: () {
                      Get.to(ProductDetails(
                        products: products[index],
                      ));
                    },
                  );
                });
          });
        }),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Get.to(NewProduct());
        },
        child: const Icon(Icons.add),
      ),
    );
  }
}
