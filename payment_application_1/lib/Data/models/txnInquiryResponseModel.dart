import '../../Domain/entities/transactionInquiry.dart';

class TxnInquiryResponseModel extends TxnInquiryResponse {
  TxnInquiryResponseModel({
    required super.id,
    required super.pending,
    required super.amountCents,
    required super.success,
    required super.currency,
    required super.order,
    required super.sourceData,
    required super.data,
  });
}
