class Item {
  String imageUrl;
  String name;
  String description;
  int amountCents;
  int quantity;

  Item({
    required this.name,
    required this.description,
    required this.amountCents,
    required this.quantity,
    required this.imageUrl,
  });

  factory Item.fromJson(Map<String, dynamic> json) => Item(
        name: json["name"],
        description: json["description"],
        amountCents: json["amount_cents"],
        quantity: json["quantity"],
        imageUrl: json["image_url"],
      );

  Map<String, dynamic> toJson() => {
        "name": name,
        "amount_cents": amountCents,
        "description": description,
        "quantity": quantity,
        "image_url": imageUrl,
      };
}
