// To parse this JSON data, do
//
//     final OrderApiResponse = OrderApiResponseFromJson(jsonString);


import '../request/item.dart';
import '../shipping_data.dart';
import 'merchant.dart';


class OrderApiResponse {
  int id;
  DateTime createdAt;
  bool deliveryNeeded;
  Merchant merchant;
  dynamic collector;
  int amountCents;
  ShippingData shippingData;
  String currency;
  bool isPaymentLocked;
  bool isReturn;
  bool isCancel;
  bool isReturned;
  bool isCanceled;
  String merchantOrderApiResponse;
  dynamic walletNotification;
  int paidAmountCents;
  bool notifyUserWithEmail;
  List<Item> items;
  String orderUrl;
  int commissionFees;
  int deliveryFeesCents;
  int deliveryVatCents;
  String paymentMethod;
  String apiSource;
  String token;
  String url;

  OrderApiResponse({
    required this.id,
    required this.createdAt,
    required this.deliveryNeeded,
    required this.merchant,
    required this.collector,
    required this.amountCents,
    required this.shippingData,
    required this.currency,
    required this.isPaymentLocked,
    required this.isReturn,
    required this.isCancel,
    required this.isReturned,
    required this.isCanceled,
    required this.merchantOrderApiResponse,
    required this.walletNotification,
    required this.paidAmountCents,
    required this.notifyUserWithEmail,
    required this.items,
    required this.orderUrl,
    required this.commissionFees,
    required this.deliveryFeesCents,
    required this.deliveryVatCents,
    required this.paymentMethod,
    required this.apiSource,
    required this.token,
    required this.url,
  });

  factory OrderApiResponse.fromJson(Map<String, dynamic> json) => OrderApiResponse(
        id: json["id"],
        createdAt: DateTime.parse(json["created_at"]),
        deliveryNeeded: json["delivery_needed"],
        merchant: Merchant.fromJson(json["merchant"]),
        collector: json["collector"],
        amountCents: json["amount_cents"],
        shippingData: ShippingData.fromJson(json["shipping_data"]),
        currency: json["currency"],
        isPaymentLocked: json["is_payment_locked"],
        isReturn: json["is_return"],
        isCancel: json["is_cancel"],
        isReturned: json["is_returned"],
        isCanceled: json["is_canceled"],
        merchantOrderApiResponse: json["merchant_order_id"],
        walletNotification: json["wallet_notification"],
        paidAmountCents: json["paid_amount_cents"],
        notifyUserWithEmail: json["notify_user_with_email"],
        items: List<Item>.from(json["items"].map((x) => Item.fromJson(x))),
        orderUrl: json["order_url"],
        commissionFees: json["commission_fees"],
        deliveryFeesCents: json["delivery_fees_cents"],
        deliveryVatCents: json["delivery_vat_cents"],
        paymentMethod: json["payment_method"],
        apiSource: json["api_source"],
        token: json["token"],
        url: json["url"],
      );
}
