import 'dart:developer';
import 'dart:io';
import 'package:popo_delivery_dashboard/core/services/storage_service.dart';
import 'package:supabase_flutter/supabase_flutter.dart';
import 'package:path/path.dart' as p;
import '../utils/app_keys.dart';

class SupabaseStorageService implements StorageService {
  static late Supabase _supabase;

  static Future<void> createBucket(String bucketName) async {
    BucketOptions bucketOptions = const BucketOptions(public: true);
    List<Bucket> bucketList = await _supabase.client.storage.listBuckets();
    bool isbucketExits = false;
    for (var bucket in bucketList) {
      if (bucket.id == bucketName) {
        isbucketExits = true;
        break;
      }
    }
    if (!isbucketExits) {
      await _supabase.client.storage.createBucket(bucketName, bucketOptions);
    }
  }

  static Future<void> initSupabaseService() async {
    _supabase = await Supabase.initialize(
      url: AppKeys.supabaseProjectUrl,
      anonKey: AppKeys.supabaseAnonKey,
    );
  }

  @override
  Future<String> uploadImage(File file, String path) async {
    String fileName = p.basenameWithoutExtension(file.path);
    String fileExetension = p.extension(file.path);
    String result = await _supabase.client.storage
        .from("fruitsimages")
        .upload(
          "$path/$fileName/$fileExetension",
          file,
          fileOptions: const FileOptions(upsert: true),
        );
    log("image url in storage service= $result");
    return result;
  }

  @override
  Future<String> editImage({required File file, required String path}) async {
    String fileName = p.basenameWithoutExtension(file.path);
    String fileExetension = p.extension(file.path);
    String result = await _supabase.client.storage
        .from("fruitsimages")
        .update(
          "$path/$fileName.$fileExetension",
          file,
          fileOptions: const FileOptions(upsert: true),
        );

    log("update image url in storage service= $result");
    return result;
  }

  @override
  Future<void> deleteImage({required File file, required String path}) async {
    String fileName = p.basename(file.path);
    String fileExetension = p.extension(file.path);
    await _supabase.client.storage.from("fruitsimages").remove([
      "$path/$fileName/$fileExetension",
    ]);
  }
}
