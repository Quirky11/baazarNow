
part of 'vendor_bloc.dart';

abstract class VendorState extends Equatable {
  const VendorState();

  @override
  List<Object> get props => [];
}

class VendorInitial extends VendorState {}

class VendorLoading extends VendorState {}

class VendorLoaded extends VendorState {
  final List<VendorModel> vendors;

  const VendorLoaded({required this.vendors});

  @override
  List<Object> get props => [vendors];
}

class VendorError extends VendorState {
  final String message;

  const VendorError({required this.message});

  @override
  List<Object> get props => [message];
}
