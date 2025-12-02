import 'package:dartz/dartz.dart';
import 'package:popo_delivery_dashboard/core/errors/failure.dart';
import 'package:popo_delivery_dashboard/features/add_advertsing/domain/entities/advertising_product_input_entity.dart';

abstract class AdvertisingProductRepo {
  // create method that add product;
  Future<Either<Failure, void>> addAdvertising(
    AdvertisingProductInputEntity addProductInputEntity,
  );
}
