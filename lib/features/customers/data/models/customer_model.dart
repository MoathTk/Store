import '../../domain/entities/customer.dart';
import '../../domain/entities/customer_type.dart';

class CustomerModel extends Customer {
  const CustomerModel({
    required super.id,
    required super.fullName,
    super.type,
    super.place,
    super.address,
    super.phone,
    super.notes,
    required super.insertedAt,
  });

  factory CustomerModel.fromCreateParams({
    required int id,
    required String fullName,
    String? type,
    String? place,
    String? address,
    String? phone,
    String? notes,
    required DateTime insertedAt,
  }) {
    return CustomerModel(
      id: id,
      fullName: fullName,
      type: type != null ? CustomerType.fromString(type) : null,
      place: place,
      address: address,
      phone: phone,
      notes: notes,
      insertedAt: insertedAt,
    );
  }

  factory CustomerModel.fromMap(Map<String, dynamic> map) {
    return CustomerModel(
      id: map['id'] as int,
      fullName: map['fullName'] as String,
      type: map['type'] != null ? CustomerType.fromString(map['type'] as String) : null,
      place: map['place'] as String?,
      address: map['address'] as String?,
      phone: map['phone'] as String?,
      notes: map['notes'] as String?,
      insertedAt: DateTime.parse(map['insertedAt'] as String),
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'fullName': fullName,
      'type': type?.value,
      'place': place,
      'address': address,
      'phone': phone,
      'notes': notes,
      'insertedAt': insertedAt.toIso8601String(),
    };
  }


}
