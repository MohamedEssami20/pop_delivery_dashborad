import 'package:dartz/dartz.dart';
import 'package:popo_delivery_dashboard/core/errors/failure.dart';
import 'package:popo_delivery_dashboard/core/entities/product_input_entity.dart';

abstract class AddProductRepo {
  // create method that add product;
  Future<Either<Failure, void>> addProduct(ProductInputEntity addProductInputEntity);
  
}
