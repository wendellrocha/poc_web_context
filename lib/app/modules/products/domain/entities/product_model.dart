import 'package:collection/collection.dart';

class ProductModel {
  final String? brand;
  final String? category;
  final String? description;
  final double? discountPercentage;
  final int? id;
  final List<String>? images;
  final int? price;
  final double? rating;
  final int? stock;
  final String? thumbnail;
  final String? title;

  const ProductModel({
    this.brand,
    this.category,
    this.description,
    this.discountPercentage,
    this.id,
    this.images,
    this.price,
    this.rating,
    this.stock,
    this.thumbnail,
    this.title,
  });

  @override
  String toString() {
    return 'ProductModel(brand: $brand, category: $category,'
        ' description: $description, discountPercentage: $discountPercentage,'
        ' id: $id, images: $images, price: $price, rating: $rating,'
        ' stock: $stock, thumbnail: $thumbnail, title: $title)';
  }

  factory ProductModel.fromJson(Map<String, dynamic> json) => ProductModel(
        brand: json['brand'] as String?,
        category: json['category'] as String?,
        description: json['description'] as String?,
        discountPercentage: (json['discountPercentage'] as num?)?.toDouble(),
        id: json['id'] as int?,
        images: List.from(json['images'] as List<dynamic>),
        price: json['price'] as int?,
        rating: (json['rating'] as num?)?.toDouble(),
        stock: json['stock'] as int?,
        thumbnail: json['thumbnail'] as String?,
        title: json['title'] as String?,
      );

  Map<String, dynamic> toJson() => {
        'brand': brand,
        'category': category,
        'description': description,
        'discountPercentage': discountPercentage,
        'id': id,
        'images': images,
        'price': price,
        'rating': rating,
        'stock': stock,
        'thumbnail': thumbnail,
        'title': title,
      };

  ProductModel copyWith({
    String? brand,
    String? category,
    String? description,
    double? discountPercentage,
    int? id,
    List<String>? images,
    int? price,
    double? rating,
    int? stock,
    String? thumbnail,
    String? title,
  }) {
    return ProductModel(
      brand: brand ?? this.brand,
      category: category ?? this.category,
      description: description ?? this.description,
      discountPercentage: discountPercentage ?? this.discountPercentage,
      id: id ?? this.id,
      images: images ?? this.images,
      price: price ?? this.price,
      rating: rating ?? this.rating,
      stock: stock ?? this.stock,
      thumbnail: thumbnail ?? this.thumbnail,
      title: title ?? this.title,
    );
  }

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    if (other is! ProductModel) return false;
    final mapEquals = const DeepCollectionEquality().equals;
    return mapEquals(other.toJson(), toJson());
  }

  @override
  int get hashCode =>
      brand.hashCode ^
      category.hashCode ^
      description.hashCode ^
      discountPercentage.hashCode ^
      id.hashCode ^
      images.hashCode ^
      price.hashCode ^
      rating.hashCode ^
      stock.hashCode ^
      thumbnail.hashCode ^
      title.hashCode;
}
