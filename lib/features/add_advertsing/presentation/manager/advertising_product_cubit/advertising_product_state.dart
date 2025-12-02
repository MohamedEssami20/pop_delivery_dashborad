part of 'advertising_product_cubit.dart';

@immutable
sealed class AdvertisingProductState {}

final class AdvertisingProductInitial extends AdvertisingProductState {}

// create all state of add advertising product cubit;
final class AdvertisingProductLoading extends AdvertisingProductState {}

final class AdvertisingProductSuccess extends AdvertisingProductState {}

final class AdvertisingProductError extends AdvertisingProductState {
  final String errorMessage;
  AdvertisingProductError(this.errorMessage);
}