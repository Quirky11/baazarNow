import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart'; // Added Equatable import
import 'package:myapp/app/core/models/vendor_model.dart';

part 'vendor_event.dart';
part 'vendor_state.dart';

class VendorBloc extends Bloc<VendorEvent, VendorState> {
  VendorBloc() : super(VendorInitial()){
     on<LoadVendors>((event, emit) async {
      emit(VendorLoading());
      try {

        await Future.delayed(const Duration(seconds: 2));
        final List<VendorModel> vendors = [
          VendorModel(
            id: '1',
            name: 'Sharma Groceries',
            products: ['Rice', 'Wheat', 'Pulses', 'Sugar', 'Oil'],
            location: 'Main Market',
            contact: '9876543210',
            rating: 4.5,
          ),
          VendorModel(
            id: '2',
            name: 'Verma Electronics',
            products: ['LED TV', 'Mobile Phone', 'Headphones', 'Charger'],
            location: 'Near Bus Stand',
            contact: '9988776655',
            rating: 4.0,
          ),
          VendorModel(
            id: '3',
            name: 'Rani Cloth Store',
            products: ['Sarees', 'Shirts', 'Trousers', 'Kurtis'],
            location: 'Gandhi Road',
            contact: '8877665544',
            rating: 4.8,
          ),
            VendorModel(
            id: '4',
            name: 'Gupta Vegetables',
            products: ['Tomatoes', 'Potatoes', 'Onions', 'Spinach'],
            location: 'Near Temple',
            contact: '9765432109',
            rating: 4.2,
          ),
        ];

        emit(VendorLoaded(vendors: vendors));
        } catch (e) {
          emit(VendorError(message: 'Failed to load vendors: $e'));
      }
    });
  }
}
