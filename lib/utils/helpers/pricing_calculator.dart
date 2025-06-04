
class TPricingCalculator {
  /// -- Calculate Price based on tax and shipping
  static double calculateTotalPrice(double productPrice, String location) {
    double shippingCost = getShippingCost(location);
    double totalPrice = productPrice + shippingCost;
    return totalPrice;
  }

  /// -- Calculate shipping cost (now returns double)
  static double calculateShippingCost(double productPrice, String location) {
    return getShippingCost(location);
  }



  static double getShippingCost(String location) {
    return 50.00; // Example shipping cost
  }
}

