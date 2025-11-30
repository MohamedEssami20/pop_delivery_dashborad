import 'dart:developer';
import 'dart:io';

import 'package:dartz/dartz.dart';
import 'package:popo_delivery_dashboard/core/utils/backend_endpoints.dart';

import '../errors/failure.dart';
import '../services/storage_service.dart';
import 'images_repo.dart';

class ImagesRepoImpl implements ImagesRepo {
  final StorageService storageService;

  ImagesRepoImpl({required this.storageService});
  @override
  Future<Either<Failure, String>> uploadImage(File image) async {
    try {
      String imageUrl =
          await storageService.uploadImage(image, BackendEndpoints.imagePath);
      return right(imageUrl);
    } catch (e) {
      log("image Error= $e");
      return left(
        ServerFailure(errorMessage: "Failed to upload image"),
      );
    }
  }

  @override
  Future<Either<Failure, String>> editProductImage({required File file}) async {
    try {
      final imageUrl = await storageService.uploadImage(
        file,
        BackendEndpoints.imagePath,
      );
      return right(imageUrl);
    } catch (error) {
      return left(
        ServerFailure(
          errorMessage: "Failed to Edit image",
        ),
      );
    }
  }
}
