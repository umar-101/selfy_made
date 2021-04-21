
import 'dart:convert';

Product productFromJson(String str) => Product.fromJson(json.decode(str));

String productToJson(Product data) => json.encode(data.toJson());

class Product {
    Product({
        this.id,
        this.title,
        this.explanation,
        this.category,
        this.code,
        this.pieces,
        this.cost,
        this.cargoName,
        this.cargoCost,
        this.imageUrl,
        this.createdAt,
        this.updatedAt,
    });

    int id;
    String title;
    String explanation;
    String category;
    int code;
    String pieces;
    String cost;
    String cargoName;
    int cargoCost;
    String imageUrl;
    DateTime createdAt;
    DateTime updatedAt;

    factory Product.fromJson(Map<String, dynamic> json) => Product(
        id: json["id"],
        title: json["title"],
        explanation: json["explanation"],
        category: json["category"],
        code: json["code"],
        pieces: json["pieces"],
        cost: json["cost"],
        cargoName: json["cargo_name"],
        cargoCost: json["cargo_cost"],
        imageUrl: json["imageUrl"],
        createdAt: DateTime.parse(json["created_at"]),
        updatedAt: DateTime.parse(json["updated_at"]),
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "title": title,
        "explanation": explanation,
        "category": category,
        "code": code,
        "pieces": pieces,
        "cost": cost,
        "cargo_name": cargoName,
        "cargo_cost": cargoCost,
        "imageUrl": imageUrl,
        "created_at": createdAt.toIso8601String(),
        "updated_at": updatedAt.toIso8601String(),
    };
}

List<Product> products = [
  Product(
    id: 1,
    cost: '₺79.99',
    title: 'Uçak Tablo',
    imageUrl: 'assets/images/image1.png',
  ),
  Product(
    id: 1,
    cost: '₺19.99',
    title: 'Manzara Dağ Çadır Tablo',
    imageUrl: 'assets/images/image2.png',
  ),
  Product(
    id: 1,
    cost: '₺129.99',
    title: 'Renkli Mağara Tablo Yağlı Boya',
    imageUrl: 'assets/images/image3.png',
  ),
  Product(
    id: 1,
    cost: '₺89.99',
    title: 'Uçak Tablo',
    imageUrl: 'assets/images/image4.png',
  ),
  Product(
    id: 1,
    cost: '₺24.99',
    title: 'Mor Oda Süsleri',
    imageUrl: 'assets/images/image5.png',
  ),
  Product(
    id: 1,
    cost: '₺12.99',
    title: 'Uçak Mor Oda Süsleri',
    imageUrl: 'assets/images/image6.png',
  ),
];
