abstract class DataBaseService {
  // ── Top-level collection ──────────────────────────────────────────────────

  // Add data to a top-level collection.
  Future<void> addData(
      {required String path,
      required Map<String, dynamic> data,
      String? documentId});

  // Get data from a top-level collection or a single document.
  Future<dynamic> getData(
      {required String path,
      String? documentId,
      Map<String, dynamic>? query,
      dynamic startAfter});

  // Get a real-time stream of a collection group.
  Stream<dynamic> getStreamData(
      {required String path, Map<String, dynamic>? query});

  // Check whether a document exists.
  Future<bool> checkDataExists(
      {required String path, required String documentId});

  // Update fields inside a document (supports one level of sub-collection).
  Future<void> updateData(
      {required String mainPath,
      required String? subPath,
      required Map<String, dynamic> data,
      required String mainDocumentId,
      required String? subDocumentId});

  // ── Sub-collection helpers ────────────────────────────────────────────────

  // Add / overwrite a document inside a sub-collection.
  // Path: {mainPath}/{mainDocumentId}/{subPath}/{subDocumentId}
  Future<void> addSubCollectionData({
    required String mainPath,
    required String mainDocumentId,
    required String subPath,
    required String subDocumentId,
    required Map<String, dynamic> data,
  });

  // Get a real-time stream from a sub-collection, with optional ordering.
  // Path: {mainPath}/{mainDocumentId}/{subPath}
  Stream<List<Map<String, dynamic>>> getSubCollectionStream({
    required String mainPath,
    required String mainDocumentId,
    required String subPath,
    Map<String, dynamic>? query,
  });

  // Delete a single document from a sub-collection.
  // Path: {mainPath}/{mainDocumentId}/{subPath}/{subDocumentId}
  Future<void> deleteSubCollectionData({
    required String mainPath,
    required String mainDocumentId,
    required String subPath,
    required String subDocumentId,
  });
}
