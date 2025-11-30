part of 'add_product_cubit.dart';

@immutable
sealed class AddProductState {}

final class AddProductInitial extends AddProductState {}

// create all state of add product cubit;

class AddProductLoading extends AddProductState {}

class AddProductError extends AddProductState {
  final String errorMessage;
  AddProductError({required this.errorMessage});
}

class AddProductSuccess extends AddProductState {}
