abstract class DataBaseService {
  //create method to add data to database;
  Future<void> addData(
      {required String path,
      required Map<String, dynamic> data,
      String? documentId});

  //create method to get usesr data from database;
  Future<dynamic> getData(
      {required String path, String? documentId, Map<String, dynamic>? query, dynamic startAfter});

  // create method to get stream of data from database;
  Stream<dynamic> getStreamData(
      {required String path, Map<String, dynamic>? query});

  // create method that check if data is exits;
  Future<bool> checkDataExists(
      {required String path, required String documentId});

  // create method that update data in database;
  Future<void> updateData(
      {required String mainPath,
      required String? subPath,
      required Map<String, dynamic> data,
      required String mainDocumentId, required String? subDocumentId});
}
