import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:popo_delivery_dashboard/core/services/data_base_service.dart';

class FirestoreService implements DataBaseService {
  FirebaseFirestore firebaseFirestore = FirebaseFirestore.instance;
  @override
  Future<void> addData(
      {required String path,
      required Map<String, dynamic> data,
      String? documentId}) async {
    if (documentId == null) {
      await firebaseFirestore.collection(path).add(data);
    } else {
      await firebaseFirestore.collection(path).doc(documentId).set(data);
    }
  }

  @override
  Future<dynamic> getData({
    required String path,
    String? documentId,
    Map<String, dynamic>? query,
    dynamic startAfter,
  }) async {
    if (documentId != null) {
      final documentSnapshot =
          await firebaseFirestore.collection(path).doc(documentId).get();
      return documentSnapshot.data();
    }

    Query<Map<String, dynamic>> firestoreQuery =
        firebaseFirestore.collection(path);
    if (query != null && query.containsKey('orderBy')) {
      firestoreQuery = firestoreQuery.orderBy(
        query['orderBy'],
        descending: query['descending'] ?? false,
      );
    }

    if (query != null && query.containsKey('limit')) {
      firestoreQuery = firestoreQuery.limit(query['limit']);
    }

    if (startAfter != null) {
      firestoreQuery = firestoreQuery.startAfterDocument(startAfter);
    }

    final result = await firestoreQuery.get();

    return {
      "data": result.docs.map((e) => e.data()).toList(),
      "lastDocument": result.docs.isNotEmpty ? result.docs.last : null,
    };
  }

  @override
  Future<bool> checkDataExists(
      {required String path, required String documentId}) async {
    DocumentSnapshot<Map<String, dynamic>> documentSnapshot =
        await firebaseFirestore.collection(path).doc(documentId).get();
    return documentSnapshot.exists;
  }

  @override
  Stream<dynamic> getStreamData(
      {required String path, Map<String, dynamic>? query}) async* {
    Query<Map<String, dynamic>> documentSnapshot =
        firebaseFirestore.collectionGroup(path);
    if (query != null) {
      if (query['orderBy'] != null) {
        String orderBy = query['orderBy'];
        bool isAscending = query['descending'];
        documentSnapshot =
            documentSnapshot.orderBy(orderBy, descending: isAscending);
      }
      if (query['limit'] != null) {
        int limit = query['limit'];
        documentSnapshot = documentSnapshot.limit(limit);
      }
    }
    await for (var data in documentSnapshot.snapshots()) {
      yield data.docs.map((e) => e.data()).toList();
    }
  }

  @override
  Future<void> updateData(
      {required String mainPath,
      required String? subPath,
      required Map<String, dynamic> data,
      required String mainDocumentId,
      required String? subDocumentId}) async {
    if (subPath == null || subDocumentId == null) {
      await firebaseFirestore.collection(mainPath).doc(mainDocumentId).update(
            data,
          );
    } else {
      await firebaseFirestore
          .collection(mainPath)
          .doc(mainDocumentId)
          .collection(subPath)
          .doc(subDocumentId)
          .update(data);
    }
  }
}
