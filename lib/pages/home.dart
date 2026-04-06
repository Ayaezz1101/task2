import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';
import 'package:task2/providors/product_providor.dart';
import 'package:task2/wigets/category.dart';
import 'package:task2/wigets/homeSearchBar.dart';
import 'package:task2/wigets/productCard.dart';
import 'package:task2/pages/details.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  final TextEditingController _searchController = TextEditingController();
  Timer? _debounce;

  void _onSearchChanged(String query) {
    if (_debounce?.isActive ?? false) _debounce!.cancel();
    _debounce = Timer(const Duration(milliseconds: 500), () {
     
      context.read<ProductProvider>().fetchProducts(searchText: query);
    });
  }

  @override
  void dispose() {
    _searchController.dispose();
    _debounce?.cancel();
    super.dispose();
  }

 
  void _showFilterDialog(BuildContext context) {
    showModalBottomSheet(
      context: context,
      builder: (context) => Container(
        padding: EdgeInsets.all(20.w),
        height: 200.h,
        child: const Center(child: Text("Filter Options Coming Soon")),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final productProvider = context.watch<ProductProvider>();

    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: EdgeInsets.only(top: 68.h, left: 24.w),
                child: Text(
                  "Find your suitable\nwatch now.",
                  style: Theme.of(context).textTheme.titleLarge,
                ),
              ),
              
              HomeSearchBar(
                controller: _searchController,
                onChanged: _onSearchChanged, 
                onFilterTap: () => _showFilterDialog(context),
              ),

              const CategorySection(),

              Padding(
                padding: EdgeInsets.symmetric(horizontal: 24.w, vertical: 20.h),
                child: productProvider.isLoading 
                    ? SizedBox(
                        height: 200.h,
                        child: const Center(child: CircularProgressIndicator()),
                      )
                    : productProvider.products.isEmpty 
                        ? Center(
                            child: Padding(
                              padding: EdgeInsets.only(top: 50.h),
                              child: const Text("No products found."),
                            ),
                          )
                        : GridView.builder(
                            shrinkWrap: true,
                            physics: const NeverScrollableScrollPhysics(),
                            itemCount: productProvider.products.length,
                            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                              crossAxisCount: 2, 
                              crossAxisSpacing: 16.w,
                              mainAxisSpacing: 16.h,
                              mainAxisExtent: 213.h, 
                            ),
                            itemBuilder: (context, index) {
                              final product = productProvider.products[index];
                              return ProductCard(
                                product: product,
                                onTap: () => Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) => Details(product: product),
                                  ),
                                ),
                              );
                            },
                          ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}