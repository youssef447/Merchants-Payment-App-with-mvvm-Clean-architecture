
import '../../../../Domain/entities/Order Registration API/paymentKey/request/PaymentKeyReq.dart';

class PaymentKeyReqModel extends PaymentKeyReq{
  

  PaymentKeyReqModel({
    required super.amountCents,
   required super.expiration,
   required super.orderId,
  required  super.billingData,
  required  super.currency,
  required  super.integrationId,
  });
     Map<String, dynamic> toJson() => {
        "amount_cents": amountCents,
        "expiration": expiration,
        "order_id": orderId,
        "billing_data": billingData.toJson(),
        "currency": currency,
        "integration_id": integrationId,
      };
//PaymentKeyReqModel.fromJson()=>PaymentKeyReqModel(amountCents: 100,);
}
