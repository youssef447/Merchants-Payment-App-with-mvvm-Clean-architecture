class PaymobConstants {
  static const baseUrl = "https://accept.paymob.com/api/";

  static const authMethod = "auth/tokens";

  ///response is order id , created time and etc..
  static const orderRegMethod = "ecommerce/orders";

  ///response is a token of the man who u will deal with , who posted the order
  static const paymentKeyReqMethod = "acceptance/payment_keys";

  static const kioskMethod="acceptance/payments/pay";

  //static const trasnactionInquiryMethod = "acceptance/transactions/";

  static const integrationIdCard = 4062925;
  static const integrationIdKiosk = 4140496;
}
