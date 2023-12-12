import 'package:flutter/material.dart';
import 'package:payment_application_1/Presentation/view-model/Auth/loginCubit.dart';

import '../../core/utils/constants.dart';
import '../view-model/Auth/logupCubit.dart';
import 'defaultFormField.dart';

class PassFormField extends StatelessWidget {
  late final TextEditingController _passController;
  final LoginCubit? loginCubit;
  final LogupCubit? logupCubit;
  final bool? secondPassField;

 late final String? _pass1;
  late final String _hintText;
  late final String _helperPassText;

  PassFormField(
      {required TextEditingController passController,
      this.loginCubit,
      this.logupCubit,
      String? pass1,
      this.secondPassField,
      required String hintText,
      required String helperPassText,
      super.key}) {
    _passController = passController;
    _hintText = hintText;
     _pass1 = pass1;
    _helperPassText = helperPassText;
  }

  @override
  Widget build(BuildContext context) {
    bool login = logupCubit == null ? true : false;

    return DefaultFormField(
      context: context,
      controller: _passController,
      isPassword: login
          ? loginCubit!.showPassword
          : secondPassField == true
              ? logupCubit!.showPassword2
              : logupCubit!.showPassword1,
      filled: true,
      fillColor: defaultFieldsColor,
      borderNone: true,
      radius: 25,
      enabled:
          //not login page,,  secondField, first field contains value
           secondPassField != null && _pass1==null ? false : true,
      helperText: _helperPassText,
      hintText: _hintText,
      onchanged: (value) {
        if (secondPassField == true) {
          //cuz if null then this field is disabled and no comaprision is required and just return ""
          if (_pass1!=null && value != _pass1) {
            String helperText = globalLocale!.passMatch;
            logupCubit!.changeHelperText2(helperText);
          } else {
            logupCubit!.changeHelperText2("");          }
        } else {
          if (value.length < 6) {
            String helperText = globalLocale!.weakPass;
            if(!login)
                 {logupCubit!
                    .firstPasswordChanged(pass: value, helperText: helperText);
                 }
          } else {
             if(!login)
                 {
                logupCubit!.firstPasswordChanged(pass: value, helperText: "");
                 }
          }
        }
      },
      validate: (value) {
        if (secondPassField == true) {
          //cuz if null then this field is disabled and no comaprision is required and just return ""
          if (_pass1!=null && value != _pass1) {
            return globalLocale!.passMatch;
          } 
        } else {
          if (value!.isEmpty) {
            return globalLocale!.passwordRequiredWarning;
          } else if (value.length < 6) {
            if(!login){
            return globalLocale!.weakPass;
            }
          }
        }
        return null;
      },
      suffixWidget: IconButton(
        onPressed: () {
          login
              ? loginCubit!.uncoverPassword()
              : secondPassField == true
                  ? logupCubit!.uncoverPassword2()
                  : logupCubit!.uncoverPassword1();
        },
        icon: Icon(login
            ? loginCubit!.showPassword
                ? Icons.visibility_outlined
                : Icons.visibility_off_outlined
            : secondPassField == true
                ? logupCubit!.showPassword2
                    ? Icons.visibility_outlined
                    : Icons.visibility_off_outlined
                : logupCubit!.showPassword1
                    ? Icons.visibility_outlined
                    : Icons.visibility_off_outlined),
      ),
    );
  }
}
