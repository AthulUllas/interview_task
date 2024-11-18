import 'package:flutter/material.dart';
import 'package:ufs_task/models/product_model.dart';

class ProductDetails extends StatelessWidget {
  const ProductDetails({super.key, required this.products});
  final ProductModel products;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          backgroundColor: Colors.white,
          leading: IconButton(
              onPressed: () {
                Navigator.pop(context);
              },
              icon: const Icon(Icons.chevron_left))),
      body: SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(
              width: double.infinity,
              height: 400,
              child: Image.network(fit: BoxFit.fill, products.image),
            ),
            Padding(
              padding: const EdgeInsets.all(24.0),
              child: Text(
                products.title,
                style:
                    const TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              ),
            ),
            Row(
              children: [
                Padding(
                  padding: const EdgeInsets.only(top: 24.0, left: 24),
                  child: Text(
                    products.price.toString(),
                    style: const TextStyle(
                        fontSize: 16, fontWeight: FontWeight.bold),
                  ),
                )
              ],
            ),
            Row(
              children: [
                Padding(
                  padding: const EdgeInsets.only(top: 24.0, left: 24),
                  child: Text(
                    products.category.name,
                    style: const TextStyle(
                        fontSize: 16, fontWeight: FontWeight.bold),
                  ),
                )
              ],
            ),
            Padding(
              padding: const EdgeInsets.all(24.0),
              child: Column(
                children: [
                  Text(
                    products.description,
                    style: const TextStyle(
                        fontSize: 16, fontWeight: FontWeight.bold),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
