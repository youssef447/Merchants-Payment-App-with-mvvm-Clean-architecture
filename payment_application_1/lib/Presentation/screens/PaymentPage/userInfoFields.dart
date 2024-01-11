part of 'orderConfirmationScreen.dart';

class UserInfoFields extends StatefulWidget {
  final TextEditingController firstNameController;

  final TextEditingController lastNameController;
  final OrderConfirmationCubit cubit;
  final TextEditingController emailController;
  final GlobalKey<FormState> formkey;

  const UserInfoFields(
      {super.key,
      required this.lastNameController,
      required this.emailController,
      required this.cubit,
      required this.formkey,
      required this.firstNameController});

  @override
  State<UserInfoFields> createState() => _UserInfoFieldsState();
}

class _UserInfoFieldsState extends State<UserInfoFields> {
  @override
  Widget build(BuildContext context) {
    return Form(
      key: widget.formkey,
      child: Column(
        children: [
          Row(
            children: [
              Expanded(
                child: DefaultFormField(
                  controller: widget.firstNameController,
                  context: context,
                  filled: true,
                  fillColor: AppColors.defaultFieldsColor,
                  borderNone: true,
                  helperText: 'first name',
                  radius: 25,
                  validate: (str) {
                    if (str!.isEmpty) {
                      return globalLocale!.firstNameRequiredText;
                    }
                    return null;
                  },
                ),
              ),
              SizedBox(
                width: (width * 0.05),
              ),
              Expanded(
                child: DefaultFormField(
                  controller: widget.lastNameController,
                  context: context,
                  borderNone: true,
                  filled: true,
                  helperText: 'last name',
                  radius: 25,
                  fillColor: AppColors.defaultFieldsColor,
                  validate: (str) {
                    if (str!.isEmpty) {
                      return globalLocale!.lastNameRequiredText;
                    }
                    return null;
                  },
                ),
              ),
            ],
          ),
          SizedBox(
            height: height * 0.02,
          ),
          DefaultFormField(
            context: context,
            controller: widget.emailController,
            type: TextInputType.emailAddress,
            helperText: 'email Address',
            filled: true,
            fillColor: AppColors.defaultFieldsColor,
            borderNone: true,
            radius: 25,
            validate: (str) {
              if (str!.isEmpty) {
                return globalLocale!.emailRequiredWarning;
              } else if (!str.isValidEmail) {
                return globalLocale!.emailFormatWarning;
              }
              return null;
            },
          ),
          SizedBox(
            height: height * 0.02,
          ),
          IntlPhoneField(
            invalidNumberMessage: globalLocale!.phoneInvalidText,
            decoration: InputDecoration(
              fillColor: AppColors.defaultFieldsColor,
              filled: true,
              prefixIconColor: AppColors.defaultColor,
              labelText: globalLocale!.phoneNumber,
              border: const OutlineInputBorder(
                borderSide: BorderSide.none,
                borderRadius: BorderRadius.all(
                  Radius.circular(25),
                ),
              ),
            ),
            initialCountryCode: currentUser.phone['countryCode'],
            initialValue: currentUser.phone['number']!.substring(3),
            onChanged: (phone) {
              print(
                  'chaangeeee ahoooooo ${phone.countryCode}, ${phone.completeNumber}, ${phone.countryISOCode}  ');
              widget.cubit.changeNumber(phone);
            },
            onCountryChanged: (value) {},
          ),
          /*  cubit.phoneRequiredMessage
                      ? Align(
                          alignment: Alignment.bottomLeft,
                          child: Padding(
                            padding: const EdgeInsets.only(left: 25.0),
                            child: Text(
                              globalLocale!.phoneNumberRequired,
                              style: Theme.of(context)
                                  .textTheme
                                  .titleSmall!
                                  .copyWith(
                                      color: const Color.fromARGB(
                                          255, 195, 50, 40)),
                            ),
                          ),
                        )
                      : const SizedBox(), */
        ],
      ),
    );
  }
}
