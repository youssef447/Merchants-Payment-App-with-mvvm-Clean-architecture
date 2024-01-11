/* class ShippingDetails {
    String? notes;
    int? numberOfPackages;
    int? weight;
    String? weightUnit;
    int? length;
    int? width;
    int? height;
    String? contents;

    ShippingDetails({
        this.notes,
        this.numberOfPackages,
        this.weight,
        this.weightUnit,
        this.length,
        this.width,
        this.height,
        this.contents,
    });

    factory ShippingDetails.fromJson(Map<String, dynamic> json) => ShippingDetails(
        notes: json["notes"],
        numberOfPackages: json["number_of_packages"],
        weight: json["weight"],
        weightUnit: json["weight_unit"],
        length: json["length"],
        width: json["width"],
        height: json["height"],
        contents: json["contents"],
    );

    Map<String, dynamic> toJson() => {
        "notes": notes,
        "number_of_packages": numberOfPackages,
        "weight": weight,
        "weight_unit": weightUnit,
        "length": length,
        "width": width,
        "height": height,
        "contents": contents,
    };
} */