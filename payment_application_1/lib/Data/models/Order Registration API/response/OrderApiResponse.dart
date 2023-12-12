class OrderApiResponse {
  int id;
  DateTime createdAt;
  bool deliveryNeeded;

  OrderApiResponse({
    required this.id,
    required this.createdAt,
    required this.deliveryNeeded,
  });

  factory OrderApiResponse.fromJson(Map<String, dynamic> json) =>
      OrderApiResponse(
        id: json["id"],
        createdAt: DateTime.parse(json["created_at"]),
        deliveryNeeded: json["delivery_needed"],
      );
}
