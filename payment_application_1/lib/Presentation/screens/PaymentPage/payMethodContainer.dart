part of 'orderConfirmationScreen.dart';

class PayMethodContainer extends StatelessWidget {
  const PayMethodContainer({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: height * 0.29,
      decoration: BoxDecoration(
        border: Border.all(color: Colors.grey),
        color: AppColors.backgroundColor,
        borderRadius: const BorderRadius.all(
          Radius.circular(15),
        ),
      ),
      padding: const EdgeInsets.all(10),
      child: 1 + 1 == 2
          ? Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                const Expanded(
                  child: DefaultCachedImage(
                      imgUrl:
                          'https://nichegamer.com/wp-content/uploads/2022/03/visa-mastercard-paypal-block-russia-03-06-22-1.jpg'),
                ),
                const SizedBox(
                  height: 10,
                ),
                Text(
                  'Add  Payment Method',
                  style: Theme.of(context).textTheme.titleLarge!.copyWith(
                        fontWeight: FontWeight.bold,
                        color: AppColors.defaultColor,
                      ),
                ),
                DefaultButton(
                  width: 0,
                  height: 0,
                  raduis: 50,
                  onClicked: () {},
                  backgroundColor: AppColors.defaultAddbtnColor,
                  child: const Icon(Icons.add_outlined),
                ),
              ],
            )
          : Column(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  currentUser.address.split(', ')[1],
                  style: Theme.of(context).textTheme.titleMedium!.copyWith(
                      fontWeight: FontWeight.bold,
                      color: AppColors.defaultColor),
                ),
                Text(
                  currentUser.address.split(', ')[0],
                  style: Theme.of(context)
                      .textTheme
                      .titleMedium!
                      .copyWith(color: AppColors.defaultColor),
                ),
              ],
            ),
    );
  }
}
