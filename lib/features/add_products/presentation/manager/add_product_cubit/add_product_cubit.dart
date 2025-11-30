import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:popo_delivery_dashboard/core/repos/images_repo.dart';
import 'package:popo_delivery_dashboard/features/add_products/domain/entities/product_input_entity.dart';
import 'package:popo_delivery_dashboard/features/add_products/domain/repos/add_product_repo/add_product_repo.dart';

part 'add_product_state.dart';

class AddProductCubit extends Cubit<AddProductState> {
  AddProductCubit({required this.addProductRepo, required this.imagesRepo})
    : super(AddProductInitial());

  final AddProductRepo addProductRepo;
  final ImagesRepo imagesRepo;

  Future<void> addProduct(ProductInputEntity productInputEntity) async {
    emit(AddProductLoading());
    final addProduct = await addProductRepo.addProduct(productInputEntity);
    addProduct.fold(
      (failure) => emit(AddProductError(errorMessage: failure.errorMessage)),
      (r) => emit(AddProductSuccess()),
    );
  }
}
