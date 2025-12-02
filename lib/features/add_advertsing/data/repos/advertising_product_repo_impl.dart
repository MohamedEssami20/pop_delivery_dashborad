import 'package:dartz/dartz.dart';
import 'package:popo_delivery_dashboard/core/repos/images_repo.dart';
import 'package:popo_delivery_dashboard/core/utils/app_keys.dart';
import 'package:popo_delivery_dashboard/core/utils/backend_endpoints.dart';
import 'package:popo_delivery_dashboard/features/add_advertsing/domain/entities/advertising_product_input_entity.dart';
import 'package:popo_delivery_dashboard/features/add_advertsing/domain/repos/advertising_product_repo.dart';
import '../../../../core/errors/failure.dart';
import '../../../../core/services/data_base_service.dart';
import '../models/advertising_product_input_model.dart';

class AdvertisingProductRepoImpl implements AdvertisingProductRepo {
  final DataBaseService dataBaseService;
  final ImagesRepo imagesRepo;
  AdvertisingProductRepoImpl({
    required this.dataBaseService,
    required this.imagesRepo,
  });
  @override
  Future<Either<Failure, void>> addAdvertising(
    AdvertisingProductInputEntity entity,
  ) async {
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
          .map((e) => e.fold((l) => "", (r) => AppKeys.baseImageUrl + r))
          .toList();

      final finalEntity = entity.copyWith(
        baseImageUrl: AppKeys.baseImageUrl + baseImageUrl,
        productImageUrls: productImageUrls,
      );

      await dataBaseService.addData(
        documentId: finalEntity.id,
        path: BackendEndpoints.addAd,
        data: AdvertisingProductInputModel.fromProductEntity(finalEntity).toMap(),
      );

      return right(null);
    } catch (e) {
      return left(ServerFailure(errorMessage: "Failed to add product"));
    }
  }
}
