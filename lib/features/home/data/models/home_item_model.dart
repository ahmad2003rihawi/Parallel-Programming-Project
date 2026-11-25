import '../../domain/entities/home_item_entity.dart';

class HomeItemModel extends HomeItemEntity {
  const HomeItemModel({
    required super.id,
    required super.title,
    required super.subtitle,
    super.imageUrl,
    super.price,
    super.currency,
  });

  factory HomeItemModel.fromJson(Map<String, dynamic> json) {
    return HomeItemModel(
      id: (json['id'] ?? json['seatId'] ?? json['flightId'] ?? '').toString(),
      title: (json['title'] ?? json['name'] ?? json['city'] ?? '').toString(),
      subtitle: (json['subtitle'] ?? json['description'] ?? json['city'] ?? '')
          .toString(),
      imageUrl: (json['imageUrl'] ?? json['image'])?.toString(),
      price: _parseDouble(json['price'] ?? json['amount']),
      currency: json['currency']?.toString(),
    );
  }

  static double? _parseDouble(dynamic value) {
    if (value == null) return null;
    if (value is num) return value.toDouble();
    return double.tryParse(value.toString());
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'title': title,
      'subtitle': subtitle,
      'imageUrl': imageUrl,
      'price': price,
      'currency': currency,
    };
  }
}
