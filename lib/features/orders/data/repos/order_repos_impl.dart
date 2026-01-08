import 'dart:developer';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dartz/dartz.dart';

import 'package:popo_delivery_dashboard/core/errors/failure.dart';
import 'package:popo_delivery_dashboard/core/services/data_base_service.dart';
import 'package:popo_delivery_dashboard/features/orders/data/models/orders_model.dart';

import 'package:popo_delivery_dashboard/features/orders/domain/entities/order_entity.dart';

import '../../domain/repos/order_repos.dart';

class OrderReposImpl implements OrderRepos {
  final DataBaseService dataBaseService;

  OrderReposImpl({required this.dataBaseService});
  @override
  Stream<Either<Failure, List<OrderEntity>>> getOrders() async* {
    try {
      await for (var (data as List<Map<String, dynamic>>)
          in dataBaseService.getStreamData(path: "UserOrders")) {
        List<OrderEntity> orders = data
            .map<OrderEntity>((e) => OrderModel.fromMap(e).toEntity())
            .toList();
        yield right(orders);
      }
    } on FirebaseException catch (e) {
      log("error while getting orders from firebase ${e.message}");
      yield left(ServerFailure(errorMessage: e.message!));
    } catch (e) {
      log("error while getting orders ${e.toString()}");
      yield left(ServerFailure(errorMessage: e.toString()));
    }
  }
}
