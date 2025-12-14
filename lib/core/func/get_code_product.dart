import '../utils/backend_endpoints.dart';

int getCodeWithProductType(String productType) {
  if (productType == BackendEndpoints.offers) {
    return 1;
  } else if (productType == BackendEndpoints.pizza) {
    return 2;
  } else if (productType == BackendEndpoints.softDrinks) {
    return 3;
  } else if (productType == BackendEndpoints.burger) {
    return 4;
  } else if (productType == BackendEndpoints.dounut) {
    return 5;
  } else if (productType == BackendEndpoints.iceCream) {
    return 6;
  } else if (productType == BackendEndpoints.indianFood) {
    return 7;
  } else if (productType == BackendEndpoints.desserts) {
    return 8;
  } else if (productType == BackendEndpoints.fastFood) {
    return 9;
  } else if (productType == BackendEndpoints.seaFood) {
    return 10;
  } else if (productType == BackendEndpoints.productAds) {
    return 11;
  } else {
    return 12;
  }
}
