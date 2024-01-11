
import '../../../../../Data/models/paymentKey/request/billingDataModel.dart';

class PaymentKeyReq {
  String amountCents;
  int expiration;
  String orderId;
   BillingDataModel billingData;
  String currency;
  int integrationId;

  PaymentKeyReq({
  required  this.amountCents,
  required  this.expiration,
   required this.orderId,
    required this.billingData,
   required this.currency,
   required this.integrationId,
  });

 
}
