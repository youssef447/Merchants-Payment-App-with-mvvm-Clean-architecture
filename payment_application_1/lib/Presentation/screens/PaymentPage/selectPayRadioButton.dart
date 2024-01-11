part of 'orderConfirmationScreen.dart';

class _SelectPayRadioButton extends StatefulWidget {
  final OrderConfirmationCubit cubit;
  const _SelectPayRadioButton({super.key, required this.cubit});

  @override
  State<_SelectPayRadioButton> createState() => _SelectPayRadioButtonState();
}

class _SelectPayRadioButtonState extends State<_SelectPayRadioButton> {
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      children: <Widget>[
        ListTile(
          title: Text(
            'Instant Pay',
            style: Theme.of(context)
                .textTheme
                .titleMedium!
                .copyWith(fontWeight: FontWeight.bold),
          ),
          trailing: Radio(
            value: widget.cubit.selections[0],
            groupValue: widget.cubit.currentSelection,
            onChanged: (value) {
              widget.cubit.changeRadioButton(value!);
            },
            activeColor: AppColors.defaultColor,
          ),
        ),
        ListTile(
          title: Text(
            'Cash On Delivery',
            style: Theme.of(context)
                .textTheme
                .titleMedium!
                .copyWith(fontWeight: FontWeight.bold),
          ),
          trailing: Radio(
            value: widget.cubit.selections[1],
            groupValue: widget.cubit.currentSelection,
            onChanged: (value) {
              widget.cubit.changeRadioButton(value!);
            },
            activeColor: AppColors.defaultColor,
          ),
        ),
      ],
    );
  }
}
