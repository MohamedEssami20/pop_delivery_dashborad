import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:popo_delivery_dashboard/core/errors/custom_exception.dart';
import 'package:popo_delivery_dashboard/core/repos/admin_repo.dart';
import 'package:popo_delivery_dashboard/core/services/data_base_service.dart';

class AdminRepoImpl implements AdminRepo {
  final DataBaseService dataBaseService;
  @override
  AdminRepoImpl({required this.dataBaseService});
  @override
  Future<void> updateFCMToken(String token) async {
    try {
      await dataBaseService.updateData(
        mainPath: 'Admin',
        mainDocumentId: 'yMKLnEB1FIdUlHD2h3ev',
        subPath: null,
        subDocumentId: null,
        data: {'fcmToken': token, 'updatedAt': FieldValue.serverTimestamp()},
      );
    } on FirebaseException catch (e) {
      throw CustomException(
        errorMessage: "error when uploading token ${e.message}",
      );
    } catch (e) {
      throw CustomException(
        errorMessage: 'an error accured when uploading token',
      );
    }
  }
}