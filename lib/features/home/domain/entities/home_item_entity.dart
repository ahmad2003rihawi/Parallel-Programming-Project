class HomeItemEntity {
  final String id;
  final String title;
  final String subtitle;
  final String? imageUrl;
  final double? price;
  final String? currency;

  const HomeItemEntity({
    required this.id,
    required this.title,
    required this.subtitle,
    this.imageUrl,
    this.price,
    this.currency,
  });
}
