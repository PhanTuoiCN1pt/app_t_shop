enum ProductType {
  single,
  variable,
}

extension ProductTypeExtension on ProductType {
  String get name {
    switch (this) {
      case ProductType.single:
        return 'Single';
      case ProductType.variable:
        return 'Variable';
    }
  }

  static ProductType fromString(String type) {
    switch (type) {
      case 'ProductType.single':
        return ProductType.single;
      case 'ProductType.variable':
        return ProductType.variable;
      default:
        throw ArgumentError('Invalid product type: $type');
    }
  }
}
