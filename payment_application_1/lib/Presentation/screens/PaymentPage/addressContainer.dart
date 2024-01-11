part of 'orderConfirmationScreen.dart';

class AddressContainer extends StatelessWidget {
  const AddressContainer({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      decoration: BoxDecoration(
        border: Border.all(color: Colors.grey),
        color: AppColors.defaultFieldsColor,
        borderRadius: const BorderRadius.all(
          Radius.circular(15),
        ),
      ),
      height: height * 0.12,
      padding: const EdgeInsets.all(10),
      child: Column(
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
