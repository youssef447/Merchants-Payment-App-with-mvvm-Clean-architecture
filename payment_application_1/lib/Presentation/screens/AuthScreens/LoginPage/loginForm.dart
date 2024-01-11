part of 'loginScreen.dart';

class LoginForm extends StatelessWidget {
  static late final TextEditingController _emailController;

  static late final TextEditingController _passController;
  static late final GlobalKey<FormState> _formkey;

  const LoginForm({super.key});

  @override
  Widget build(BuildContext context) {
    _formkey = GlobalKey<FormState>();
    _emailController = TextEditingController();
    _passController = TextEditingController();

    return BlocConsumer<LoginCubit, LoginStates>(
      listener: (context, state) {},
      builder: (context, state) {
        LoginCubit cubit = LoginCubit.get(context);

        return LayoutBuilder(builder: (context, constraints) {
          return Form(
            key: _formkey,
            child: Center(
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    FittedBox(
                      child: Text(
                        globalLocale!.loginPageTitle,
                        style: Theme.of(context).textTheme.titleLarge,
                      ),
                    ),
                    SizedBox(
                      height: constraints.maxHeight * 0.1,
                    ),
                    DefaultFormField(
                      context: context,
                      controller: _emailController,
                      type: TextInputType.emailAddress,

                      /*  suffixWidget: const Icon(
                                              Icons.email_outlined,
                                            ), */
                      hintText: globalLocale!.emailHintText,
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
                      height: constraints.maxHeight * 0.04,
                    ),
                    PassFormField(
                      passController: _passController,
                      loginCubit: cubit,
                      helperPassText: cubit.helperText,
                      hintText: globalLocale!.passwordHintText,
                    ),
                    Row(
                      children: [
                        const Spacer(),
                        TextButton(
                          onPressed: () {
                            //FOROGT PASSWORD
                          },
                          child: TextButton(
                            onPressed: () {},
                            child: Text(
                              globalLocale!.forgotPassword,
                            ),
                          ),
                        ),
                      ],
                    ),
                    state is LoginLoadingState
                        ? const CircularProgressIndicator.adaptive()
                        : DefaultButton(
                            backgroundColor: AppColors.defaultColor,
                            foregroundColor: Colors.white,
                            elevation: 10,
                            shadowColor: Colors.black,
                            raduis: 20,
                            onClicked: () {
                              if (_formkey.currentState!.validate()) {
                                //OTP Done Before Signing In
                                cubit.signIn(
                                    ctx: context,
                                    email: _emailController.text,
                                    pass: _passController.text);
                              } else {}
                            },
                            child: Text(globalLocale!.loginText),
                          ),
                    SizedBox(
                      height: constraints.maxHeight * 0.04,
                    ),
                    Row(
                      children: [
                        Expanded(
                            child: Divider(
                          color: Colors.grey[300],
                          endIndent: 10,
                        )),
                        Text(
                          'Or connect using',
                          style: Theme.of(context)
                              .textTheme
                              .titleSmall!
                              .copyWith(fontWeight: FontWeight.bold),
                        ),
                        Expanded(
                          child: Divider(
                            color: Colors.grey[300],
                            indent: 10,
                          ),
                        ),
                      ],
                    ),
                    SizedBox(
                      height: constraints.maxHeight * 0.03,
                    ),
                    state is GoogleLoginLoadingState
                        ? const CircularProgressIndicator.adaptive()
                        : DefaultButton(
                            backgroundColor: AppColors.defaultFieldsColor,
                            foregroundColor: Colors.black,
                            elevation: 5,
                            shadowColor: Colors.black,
                            raduis: 20,
                            onClicked: () {
                              cubit.signInWithGoogle(
                                ctx: context,
                              );
                            },
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                CachedNetworkImage(
                                  imageUrl:
                                      'http://pngimg.com/uploads/google/google_PNG19635.png',
                                  height: 40,
                                  width: 40,
                                ),
                                const Text('Sign in with Google'),
                              ],
                            ),
                          ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          globalLocale!.notRegistered,
                          style: Theme.of(context)
                              .textTheme
                              .titleSmall!
                              .copyWith(fontWeight: FontWeight.bold),
                        ),
                        TextButton(
                          onPressed: () {
                            navigate(
                              context,
                              //MapScreen(),
                              LogupScreen(),
                            );
                          },
                          child: Text(
                            globalLocale!.createAccount,
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          );
        });
      },
    );
  }
}
