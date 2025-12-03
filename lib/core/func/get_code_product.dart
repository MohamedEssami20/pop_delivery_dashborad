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
  } else {
    return 6;
  }
}