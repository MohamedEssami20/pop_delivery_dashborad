import 'package:dartz/dartz.dart';
import 'package:popo_delivery_dashboard/core/repos/images_repo.dart';
import 'package:popo_delivery_dashboard/core/utils/backend_endpoints.dart';
import '../../../../core/errors/failure.dart';
import '../../../../core/services/data_base_service.dart';
import '../../domain/entities/product_input_entity.dart';
import '../../domain/repos/add_product_repo.dart';
import '../models/product_input_model.dart';

class AddProductRepoImpl implements AddProductRepo {
  final DataBaseService dataBaseService;
  final ImagesRepo imagesRepo;
  AddProductRepoImpl({required this.dataBaseService, required this.imagesRepo});
  @override
  Future<Either<Failure, void>> addProduct(ProductInputEntity entity) async {
  try {
    // Upload base image
    final baseImageFuture = imagesRepo.uploadImage(entity.imageFile!);

    // Upload product images in parallel
    final otherImagesFutures = entity.productImages!
        .map((image) => imagesRepo.uploadImage(image!))
        .toList();

    // Wait for all uploads to finish
    final results = await Future.wait([
      baseImageFuture,
      ...otherImagesFutures,
    ]);

    final baseImageUrl = results.first.fold((l) => "", (r) => r);

    final List<String> productImageUrls = results
        .sublist(1)
        .map((e) => e.fold((l) => "", (r) => r))
        .toList();

    final finalEntity = entity.copyWith(
      baseImageUrl: baseImageUrl,
      productImageUrls: productImageUrls,
    );

    await dataBaseService.addData(
      documentId: finalEntity.id,
      path: BackendEndpoints.addProduct,
      data: ProductInputModel.fromProductEntity(finalEntity).toMap(),
    );

    return right(null);

  } catch (e) {
    return left(ServerFailure(errorMessage: "Failed to add product"));
  }
}

}
