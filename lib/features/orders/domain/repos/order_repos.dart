import 'package:dartz/dartz.dart';
import 'package:popo_delivery_dashboard/core/helper/order_state.dart';

import '../../../../core/errors/failure.dart';
import '../entities/order_entity.dart';

abstract class OrderRepos {
  // create method that get orders as stream from database;
  Stream<Either<Failure, List<OrderEntity>>> getOrders();

  // create method that change order state;
  Future<Either<Failure, void>> changeOrderState({required OrderState orderState,required String orderId});

}
