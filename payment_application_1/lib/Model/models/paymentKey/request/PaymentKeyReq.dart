import 'billingData.dart';

class PaymentKeyReq {
  String? amountCents;
  int? expiration;
  String? orderId;
  BillingData? billingData;
  String? currency;
  int? integrationId;

  PaymentKeyReq({
    this.amountCents,
    this.expiration,
    this.orderId,
    this.billingData,
    this.currency,
    this.integrationId,
  });

  Map<String, dynamic> toJson() => {
        "amount_cents": amountCents,
        "expiration": expiration,
        "order_id": orderId,
        "billing_data": billingData?.toJson(),
        "currency": currency,
        "integration_id": integrationId,
      };
}
