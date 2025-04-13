import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart'; // Added import for Equatable
import 'package:myapp/app/core/models/product_model.dart';

part 'product_event.dart';
part 'product_state.dart';

final List<ProductModel> mockProducts = [
  ProductModel(id: '1', name: 'Basmati Rice', price: 120.0, category: 'Groceries', vendorId: '1', description: 'High-quality Basmati rice'),
  ProductModel(id: '2', name: 'Mustard Oil', price: 150.0, category: 'Grocery', vendorId: 'v1', description: 'Pure mustard oil'),
  ProductModel(id: '3', name: 'LED TV 40"', price: 25000.0, category: 'Electronics', vendorId: '2', description: 'Full HD LED TV'),
  ProductModel(
      id: '4',
      name: 'Cotton Saree',
      price: 800.0,
      category: 'Clothing',
      vendorId: '3',
      description: 'Comfortable cotton saree'),
  ProductModel(
      id: '5',
      name: 'Fresh Tomatoes',
      price: 40.0,
      category: 'Vegetables',
      vendorId: '4',
      description: 'Fresh and ripe tomatoes'),
  ProductModel(
      id: '6', name: 'Lays Chips', price: 20.0, category: 'Snacks', vendorId: '5', description: 'Salted potato chips'),
  ProductModel(
      id: '7', name: 'Wheat Flour', price: 45.0, category: 'Groceries', vendorId: '1', description: 'Whole wheat flour'),
];


// --- BLoC ---
class ProductBloc extends Bloc<ProductEvent, ProductState> {
  ProductBloc() : super(ProductInitial()) {
    on<LoadProducts>((event, emit) async{
      emit(ProductLoading());
       try {
        await Future.delayed(const Duration(seconds: 2));
        emit(ProductLoaded(products: mockProducts));
      } catch (error) {
        emit(ProductError(message: 'Failed to load products: $error'));
      }
    });
  }
}