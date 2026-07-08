enum OrderStatus {
  cancelled,
  done,
  notBought,
  notPaid;

  String get value {
    switch (this) {
      case OrderStatus.cancelled:
        return 'cancelled';
      case OrderStatus.done:
        return 'done';
      case OrderStatus.notBought:
        return 'not_bought';
      case OrderStatus.notPaid:
        return 'not_paid';
    }
  }

  static OrderStatus fromString(String value) {
    switch (value) {
      case 'cancelled':
        return OrderStatus.cancelled;
      case 'done':
        return OrderStatus.done;
      case 'not_bought':
        return OrderStatus.notBought;
      case 'not_paid':
        return OrderStatus.notPaid;
      default:
        return OrderStatus.notBought;
    }
  }
}
