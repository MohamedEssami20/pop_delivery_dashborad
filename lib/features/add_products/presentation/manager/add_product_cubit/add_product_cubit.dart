import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:popo_delivery_dashboard/core/entities/product_input_entity.dart';
import '../../../domain/repos/add_product_repo.dart';

part 'add_product_state.dart';

class AddProductCubit extends Cubit<AddProductState> {
  AddProductCubit({required this.addProductRepo}) : super(AddProductInitial());

  final AddProductRepo addProductRepo;

  Future<void> addProduct(ProductInputEntity productInputEntity) async {
    emit(AddProductLoading());
    final addProduct = await addProductRepo.addProduct(productInputEntity);
    addProduct.fold(
      (failure) => emit(AddProductError(errorMessage: failure.errorMessage)),
      (r) => emit(AddProductSuccess()),
    );
  }
}
