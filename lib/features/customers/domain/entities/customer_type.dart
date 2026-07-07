enum CustomerType {
  normal,
  provider,
  providerAndCustomer;

  String get value {
    switch (this) {
      case CustomerType.normal:
        return 'normal';
      case CustomerType.provider:
        return 'provider';
      case CustomerType.providerAndCustomer:
        return 'provider_and_customer';
    }
  }

  static CustomerType fromString(String value) {
    switch (value) {
      case 'normal':
        return CustomerType.normal;
      case 'provider':
        return CustomerType.provider;
      case 'provider_and_customer':
        return CustomerType.providerAndCustomer;
      default:
        return CustomerType.normal;
    }
  }
}
