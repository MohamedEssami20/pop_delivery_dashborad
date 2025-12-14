import '../utils/backend_endpoints.dart';

String getCategory({required String productType}) {
  if (productType == BackendEndpoints.offers) {
    return "Offers";
  } else if (productType == BackendEndpoints.pizza) {
    return "Pizza";
  } else if (productType == BackendEndpoints.softDrinks) {
    return "SoftDrinks";
  } else if (productType == BackendEndpoints.burger) {
    return "Burger";
  } else if (productType == BackendEndpoints.dounut) {
    return "Dounut";
  } else if (productType == BackendEndpoints.iceCream) {
    return "IceCream";
  } else if (productType == BackendEndpoints.indianFood) {
    return "IndianFood";
  } else if (productType == BackendEndpoints.desserts) {
    return "Desserts";
  } else if (productType == BackendEndpoints.fastFood) {
    return "FastFood";
  } else if (productType == BackendEndpoints.seaFood) {
    return "SeaFood";
  } else if (productType == BackendEndpoints.productAds) {
    return "Ads";
  } else {
    return "Others";
  }
}
