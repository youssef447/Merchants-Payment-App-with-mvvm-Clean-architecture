part of 'orderScreen.dart';

class OrderDetailsCard extends StatelessWidget {
  final OrderApiResponseModel order;
  final Merchant merchant;
  const OrderDetailsCard({
    super.key,
    required this.order,
    required this.merchant,
  });

  @override
  Widget build(BuildContext context) {
    return ExpansionTile(
      expandedCrossAxisAlignment: CrossAxisAlignment.start,
      backgroundColor: AppColors.expansiondColor,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10),
        side: const BorderSide(color: Colors.grey),
      ),
      childrenPadding: const EdgeInsets.all(15),
      collapsedBackgroundColor: AppColors.backgroundColor,
      collapsedShape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10),
        side: const BorderSide(color: Colors.grey),
      ),
      title: Text(
        'Order Details',
        style: Theme.of(context).textTheme.titleMedium!,
      ),
      children: [
          Row(
            children: [
              Text(
                'Merchant:',
                style: Theme.of(context).textTheme.titleMedium!,
              ),
              const SizedBox(
                width: 10,
              ),
              Text(
                '${merchant.firstName} ${merchant.lastName}',
                style: Theme.of(context)
                    .textTheme
                    .titleMedium!
                    .copyWith(fontWeight: FontWeight.bold,color:AppColors.defaultColor),
              ),
            ],
          ),
         
        Row(
          children: [
            Text(
              'order ID:',
              style: Theme.of(context).textTheme.titleMedium!,
            ),
            const SizedBox(
              width: 10,
            ),
            Text(
              '#${order.id}',
              style: Theme.of(context)
                  .textTheme
                  .titleMedium!
                  .copyWith(fontWeight: FontWeight.bold),
            ),
          ],
        ),
        Row(
          children: [
            Text(
              'order placed:',
              style: Theme.of(context).textTheme.titleMedium!,
            ),
            const SizedBox(
              width: 10,
            ),
            Text(
              DateFormat('M/d/y, hh:mm aa').format(
                DateTime.fromMicrosecondsSinceEpoch(
                    order.createdAt.microsecondsSinceEpoch),
              ),
              style: Theme.of(context)
                  .textTheme
                  .titleMedium!
                  .copyWith(fontWeight: FontWeight.bold),
            ),
          ],
        ),




         Wrap(
          children: [
            Text(
              'Shipping from:',
              style: Theme.of(context).textTheme.titleMedium!,
            ),
            const SizedBox(
              width: 10,
            ),
            Text(
              order.shippingData==null? 'NA':
             
             '${order.shippingData!.street}, ${order.shippingData!.city} ${order.shippingData!.country}'
              ,
              style: Theme.of(context)
                  .textTheme
                  .titleMedium!
                  .copyWith(fontWeight: FontWeight.bold),
            ),
          ],
        ),
        
      ],
    );
    /*  OrderDetailsCard(
                          order: widget.order,
                        ), */
  }
}
