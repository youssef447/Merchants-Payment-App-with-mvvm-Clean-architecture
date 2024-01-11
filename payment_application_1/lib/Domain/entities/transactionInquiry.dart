class TxnInquiryResponse {
  int id;
  String pending;
  int amountCents;
  String success;
  String currency;
  Order order;
  SourceData sourceData;
  Data data;

  TxnInquiryResponse({
    required this.id,
    required this.pending,
    required this.amountCents,
    required this.success,
    required this.currency,
    required this.order,
    required this.sourceData,
    required this.data,
  });
}

class Data {
  String transactionNo;

  Data({
    required this.transactionNo,
  });
}

class Order {
  int id;
  DateTime createdAt;

  Order({
    required this.id,
    required this.createdAt,
  });
}

class SourceData {
  String subType;
  String pan;
  String type;

  SourceData({
    required this.subType,
    required this.pan,
    required this.type,
  });
}
