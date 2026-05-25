import 'package:dartz/dartz.dart';
import 'package:popo_delivery_dashboard/core/errors/failure.dart';

abstract class AuthRepo {
  Future<Either<Failure, void>> loginWithEmailAndPassword({
    required String email,
    required String password,
  });
}
