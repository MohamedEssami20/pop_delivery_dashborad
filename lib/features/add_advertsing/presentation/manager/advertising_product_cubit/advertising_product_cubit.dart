import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter/material.dart';
import 'package:popo_delivery_dashboard/features/add_advertsing/domain/repos/advertising_product_repo.dart';

import '../../../domain/entities/advertising_product_input_entity.dart';
part 'advertising_product_state.dart';

class AdvertisingProductCubit extends Cubit<AdvertisingProductState> {
  AdvertisingProductCubit({required this.advertisingProductRepo})
    : super(AdvertisingProductInitial());

  final AdvertisingProductRepo advertisingProductRepo;
  // create method of add advertising product cubit;

  Future<void> addAdvertisingProduct({
    required AdvertisingProductInputEntity addProductInputEntity,
  }) async {
    emit(AdvertisingProductLoading());
    final result = await advertisingProductRepo.addAdvertising(
      addProductInputEntity,
    );
    result.fold(
      (l) => emit(AdvertisingProductError(l.errorMessage)),
      (r) => emit(AdvertisingProductSuccess()),
    );
  }
}
