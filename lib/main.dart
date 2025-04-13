import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:myapp/app/core/bloc/product_bloc.dart';
import 'package:myapp/app/core/bloc/vendor_bloc.dart';
import 'package:myapp/app/presentation/home_screen.dart';



void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
        return MultiBlocProvider(
      providers: [
        BlocProvider<VendorBloc>(create: (context) => VendorBloc()),
        BlocProvider<ProductBloc>(create: (context) => ProductBloc()),
        ],
      child: MaterialApp(
        title: 'Bazaar Buddy',
        theme: ThemeData(
          colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
          useMaterial3: true,
        ),
        home: const HomeScreen(), // Set HomeScreen as the home page
      ),
    );
  }
}
