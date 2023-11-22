// To parse this JSON data, do
//
//     final product = productFromJson(jsonString);

import 'dart:convert';

List<Product> productFromJson(String str) => List<Product>.from(json.decode(str).map((x) => Product.fromJson(x)));

String productToJson(List<Product> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class Product {
    String model;
    int pk;
    Fields fields;

    Product({
        required this.model,
        required this.pk,
        required this.fields,
    });

    factory Product.fromJson(Map<String, dynamic> json) => Product(
        model: json["model"],
        pk: json["pk"],
        fields: Fields.fromJson(json["fields"]),
    );

    Map<String, dynamic> toJson() => {
        "model": model,
        "pk": pk,
        "fields": fields.toJson(),
    };
}

class Fields {
    String product;
    int price;
    String description;
    String pet;
    int user;
    int amount;
    String image;

    Fields({
        required this.product,
        required this.price,
        required this.description,
        required this.pet,
        required this.user,
        required this.amount,
        required this.image,
    });

    factory Fields.fromJson(Map<String, dynamic> json) => Fields(
        product: json["product"],
        price: json["price"],
        description: json["description"],
        pet: json["pet"],
        user: json["user"],
        amount: json["amount"],
        image: json["image"],
    );

    Map<String, dynamic> toJson() => {
        "product": product,
        "price": price,
        "description": description,
        "pet": pet,
        "user": user,
        "amount": amount,
        "image": image,
    };
}
