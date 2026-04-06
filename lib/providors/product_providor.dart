import 'package:flutter/material.dart';
import 'package:supabase_flutter/supabase_flutter.dart';
import '../model/product_model.dart';

class ProductProvider with ChangeNotifier {
  List<Product> _products = [];
  bool _isLoading = false;

  List<Product> get products => _products;
  bool get isLoading => _isLoading;

  final supabase = Supabase.instance.client;
  Future<void> fetchProducts({String? searchText, String? categoryName}) async {
  _isLoading = true;
  notifyListeners(); 

  try {
    var query = supabase.from('products').select('*, product_colors(*)');

    if (searchText != null && searchText.isNotEmpty) {
      query = query.ilike('name', '%$searchText%');
    }

    if (categoryName != null && categoryName != 'Smart Watch') {
      query = query.eq('brand', categoryName); 
    }

    final List<dynamic> data = await query;
    _products = data.map((json) => Product.fromMap(json)).toList();
    
  } catch (e) {
    debugPrint(" Error fetching products: $e");
  } finally {
    _isLoading = false;
    notifyListeners();
  }
}}