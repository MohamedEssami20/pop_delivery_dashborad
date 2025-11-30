import 'package:dartz/dartz.dart';
import 'package:popo_delivery_dashboard/core/utils/backend_endpoints.dart';
import '../../../../core/errors/failure.dart';
import '../../../../core/services/data_base_service.dart';
import '../../domain/entities/product_input_entity.dart';
import '../../domain/repos/add_product_repo.dart';
import '../models/product_input_model.dart';

class AddProductRepoImpl implements AddProductRepo {
  final DataBaseService dataBaseService;

  AddProductRepoImpl({required this.dataBaseService});
  @override
  Future<Either<Failure, void>> addProduct(
  ProductInputEntity addProductInputEntity,
  ) async {
    try {
      await dataBaseService.addData(
        documentId: addProductInputEntity.id,
        path: BackendEndpoints.addProduct,
        data: ProductInputModel.fromProductEntity(
          addProductInputEntity,
        ).toMap(),
      );
      return right(null);
    } catch (e) {
      return left(ServerFailure(errorMessage: "Failed to add product"));
    }
  }
}
