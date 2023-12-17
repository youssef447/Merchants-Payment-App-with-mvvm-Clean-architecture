/* import 'package:flutter/Material.dart';
import 'package:payment_application_1/Presentation/widgets/defaultButton.dart';

import '../../Presentation/widgets/FadeInDown.dart';
import 'constants.dart';

class DefaultAlertDialog extends StatelessWidget {
  final IconData icon;
  final Color? iconColor;
  final String content;
  final String? buttonText;

  const DefaultAlertDialog(
      {super.key,
      required this.icon,
       this.iconColor,
      this.buttonText,
      required this.content});

  @override
  Widget build(BuildContext context) {
    return FadeInDown(
      child: AlertDialog(
        icon: Icon(
          icon,
          color: iconColor??Colors.black,
          size: 45,
        ),
        backgroundColor: defaultFieldsColor,
        content: SizedBox(
          height: height*0.18,
          width: width*0.5,
          child: Column(
            
            children: [
              Text(
                content,
                style: Theme.of(context)
                    .textTheme
                    .titleMedium!.copyWith(fontWeight: FontWeight.bold)
                    ,
                textAlign: TextAlign.center,
              ),
              const Spacer(),
              DefaultButton(
                foregroundColor: Colors.white,
                backgroundColor: defaultColor,
                raduis: 50,
                
                width: width*0.5*0.5,
                onClicked: () {
                  Navigator.of(context).pop();
                },
                child: Text(
                  buttonText??'OK',
                 
                  textAlign: TextAlign.center,
                ),
              ),
            ],
          ),
        ),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(25),
          
        ),
      ),
    );
  }
}
 */