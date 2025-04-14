import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:myapp/app/core/bloc/vendor_bloc.dart';
import 'package:myapp/app/core/bloc/product_bloc.dart';
import 'package:myapp/app/core/models/vendor_model.dart';
import 'package:myapp/app/core/models/product_model.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  void initState() {
    super.initState();
    // Dispatch events to load vendors and products when the screen initializes.
    context.read<VendorBloc>().add(LoadVendors());
    context.read<ProductBloc>().add(LoadProducts());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Bazaar Buddy'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            _buildVendorSection(),
            const SizedBox(height: 20),
            _buildProductSection(),
          ],
        ),
      ),
    );
  }

  // Vendor section UI
  Widget _buildVendorSection() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text(
          'Vendors',
          style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
        ),
        const SizedBox(height: 10),
        SizedBox(
          height: 150, // Fixed height for the vendor list
          child: BlocBuilder<VendorBloc, VendorState>(
            builder: (context, state) {
              if (state is VendorLoading) {
                return const Center(child: CircularProgressIndicator());
              } else if (state is VendorError) {
                return Center(child: Text(state.message));
              } else if (state is VendorLoaded) {
                return ListView.builder(
                  scrollDirection: Axis.horizontal,
                  itemCount: state.vendors.length,
                  itemBuilder: (context, index) {
                    final VendorModel vendor = state.vendors[index];
                    return GestureDetector(
                      onTap: () {
                        // Add interaction here if needed, e.g., navigate to vendor details
                      },
                      child: Card(
                        margin: const EdgeInsets.symmetric(horizontal: 8.0),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            // Add an image or other details about the vendor if needed
                            const Icon(Icons.store),
                            Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Text(
                                vendor.name,
                                style: const TextStyle(
                                  fontWeight: FontWeight.bold,
                                  fontSize: 16,
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    );
                  },
                );
              } else {
                return const Center(child: Text('No Vendors Available'));
              }
            },
          ),
        ),
      ],
    );
  }

  // Product section UI
  Widget _buildProductSection() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text('Products', style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
        const SizedBox(height: 10),
        BlocBuilder<ProductBloc, ProductState>(
          builder: (context, state) {
            if (state is ProductLoading) {
              return const Center(child: CircularProgressIndicator());
            } else if (state is ProductError) {
              return Center(child: Text(state.message));
            } else if (state is ProductLoaded) {
              return Container(
                height: 300, // Fixed height for the product list
                child: ListView.builder(
                  shrinkWrap: true,
                  physics: const NeverScrollableScrollPhysics(),
                  itemCount: state.products.length,
                  itemBuilder: (context, index) {
                    final ProductModel product = state.products[index];
                    return GestureDetector(
                      onTap: () {
                        // Add interaction here if needed, e.g., navigate to product details
                      },
                      child: Card(
                        margin: const EdgeInsets.symmetric(vertical: 8.0),
                        child: ListTile(
                          title: Text(product.name),
                          subtitle: Text("\$${product.price.toString()}"),
                        ),
                      ),
                    );
                  },
                ),
              );
            } else {
              return const Center(child: Text('No Products Available'));
            }
          },
        ),
      ],
    );
  }
}
