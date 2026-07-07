import 'customer_type.dart';

class Customer {
  final int id;
  final String fullName;
  final CustomerType? type;
  final String? place;
  final String? address;
  final String? phone;
  final String? notes;
  final DateTime insertedAt;

  const Customer({
    required this.id,
    required this.fullName,
    this.type,
    this.place,
    this.address,
    this.phone,
    this.notes,
    required this.insertedAt,
  });
}
