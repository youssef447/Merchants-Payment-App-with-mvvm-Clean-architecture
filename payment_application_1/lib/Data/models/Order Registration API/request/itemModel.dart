import '../../../../Domain/entities/Order Registration API/request/item.dart';

class ItemModel extends Item {
  ItemModel({
    required super.name,
    required super.description,
    required super.amountCents,
    required super.quantity,
  });

  factory ItemModel.fromJson(Map<String, dynamic> json) => ItemModel(
        name: json["name"],
        description: json["description"],
        amountCents: json["amount_cents"].toString(),
        quantity: json["quantity"].toString(),
      );

  Map<String, dynamic> toJson() => {
        "name": name,
        "amount_cents": amountCents,
        "description": description?.trim(),
        "quantity": quantity,
      };
}
