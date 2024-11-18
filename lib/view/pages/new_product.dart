import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ufs_task/controller/product_controller.dart';
import 'package:ufs_task/models/product_model.dart';

class NewProduct extends StatelessWidget {
  final titleController = TextEditingController();
  final descriptionController = TextEditingController();
  final priceController = TextEditingController();
  final imageController = TextEditingController();
  final categoryController = TextEditingController();
  final rateController = TextEditingController();
  final countController = TextEditingController();
  final productController = Get.find<ProductController>();

  NewProduct({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Create Product")),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            TextField(
              controller: titleController,
              decoration: const InputDecoration(labelText: "Title"),
            ),
            TextField(
              controller: descriptionController,
              decoration: const InputDecoration(labelText: "Description"),
            ),
            TextField(
              controller: priceController,
              decoration: const InputDecoration(
                labelText: "Price",
              ),
              keyboardType: TextInputType.number,
            ),
            TextField(
              controller: imageController,
              decoration: const InputDecoration(labelText: "Image URL"),
            ),
            TextField(
              controller: categoryController,
              decoration: const InputDecoration(labelText: "Category"),
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                final newProduct = ProductModel(
                    id: 1,
                    title: titleController.text,
                    description: descriptionController.text,
                    price: double.parse(priceController.text),
                    image: imageController.text,
                    category: Category.OTHER,
                    rating: Rating(rate: 0.0, count: 1));
                productController.createProduct(newProduct);
                Get.back();
              },
              child: const Text("Create Product"),
            ),
          ],
        ),
      ),
    );
  }
}
