import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:ufs_task/models/product_model.dart';

const baseUrl = "https://fakestoreapi.com/products";

class ApiService {
  Future<List<ProductModel>> fetchData() async {
    try {
      final url = Uri.parse(baseUrl);
      final response = await http.get(url);

      if (response.statusCode == 200) {
        if (response.body.isEmpty) {
          throw Exception("Response from the API is empty");
        }
        final List<dynamic> data = jsonDecode(response.body);
        final products = data.map((e) => ProductModel.fromJson(e)).toList();
        return products;
      } else {
        throw Exception("Failed to load data: ${response.statusCode}");
      }
    } catch (e) {
      throw Exception("Error fetching data: $e");
    }
  }

  //delete request

  Future<void> deleteProduct(int id) async {
    try {
      final url = Uri.parse('$baseUrl/$id');
      final response = await http.delete(url);

      if (response.statusCode == 200) {
        print("Product deleted successfully");
      } else {
        throw Exception("Failed to delete product: ${response.statusCode}");
      }
    } catch (e) {
      throw Exception("Error deleting product: $e");
    }
  }

  //create request

  Future<ProductModel> createProduct(ProductModel newProduct) async {
    try {
      final url = Uri.parse(baseUrl);
      final response = await http.post(
        url,
        headers: {"Content-Type": "application/json"},
        body: jsonEncode(newProduct.toJson()),
      );
      if (response.statusCode == 201) {
        final data = jsonDecode(response.body);
        return ProductModel.fromJson(data);
      } else {
        throw Exception("Failed to create product: ${response.statusCode}");
      }
    } catch (e) {
      throw Exception("Error creating product: $e");
    }
  }
}
