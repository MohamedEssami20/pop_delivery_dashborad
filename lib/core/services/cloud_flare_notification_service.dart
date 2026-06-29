import 'dart:developer';

import 'package:dio/dio.dart';
import '../utils/backend_endpoints.dart';
import 'dio_service.dart';

abstract class CloudflareNotificationService {
  /// Sends a push notification to a specific device FCM token
  Future<void> sendNotificationToToken({
    required String token,
    required String title,
    required String body,
    Map<String, dynamic>? data,
  });

  /// Sends a push notification to a topic group (e.g. 'orders')
  Future<void> sendNotificationToTopic({
    required String token,
    required String title,
    required String body,
    Map<String, dynamic>? data,
  });
}

class CloudflareNotificationServiceImpl
    implements CloudflareNotificationService {
  final DioService _dioService;

  CloudflareNotificationServiceImpl({required DioService dioService})
    : _dioService = dioService;

  @override
  Future<void> sendNotificationToToken({
    required String token,
    required String title,
    required String body,
    Map<String, dynamic>? data,
  }) async {
    final payload = {
      'token': token,
      'title': title,
      'body': body,
      'data': data ?? {},
    };
    await _send(payload);
  }

  @override
  Future<void> sendNotificationToTopic({
    required String token,
    required String title,
    required String body,
    Map<String, dynamic>? data,
  }) async {
    final payload = {
      'token': token,
      'title': title,
      'body': body,
      'data': data ?? {},
    };
    await _send(payload);
  }

  Future<void> _send(Map<String, dynamic> payload) async {
    final response = await _dioService.post(
      path: BackendEndpoints.cloudflareNotification,
      data: payload,
      options: Options(headers: {'Content-Type': 'application/json'}),
    );
    log("Cloudflare Response => ${response.data}");
  }
}
