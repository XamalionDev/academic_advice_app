import 'package:academic_advice_app/controller/auth_controller.dart';
import 'package:academic_advice_app/model/dialogs/error_dialog.dart';
import 'package:academic_advice_app/model/utils/manipule_ui.dart';
import 'package:academic_advice_app/model/utils/set_messages.dart';
import 'package:academic_advice_app/view/custom_widgets/custom_text_field.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class RecoverPasswordScreen extends ConsumerWidget {
  final double height;
  final double width;
  const RecoverPasswordScreen({super.key, required this.height, required this.width});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final color = Theme.of(context).cardColor;

    return AnimatedContainer(
      decoration: BoxDecoration(
          boxShadow: <BoxShadow>[
            BoxShadow(
                color: Colors.grey,
                offset: Offset.fromDirection(6, 0.5),
                blurRadius: 0.3
            ),
            BoxShadow(
                color: Colors.grey,
                offset: Offset.fromDirection(6, 0.5),
                blurRadius: 0.3
            ),
            BoxShadow(
                color: Colors.grey,
                offset: Offset.fromDirection(6, 0.5),
                blurRadius: 0.3
            ),
            BoxShadow(
                color: Colors.grey,
                offset: Offset.fromDirection(6, 0.5),
                blurRadius: 0.3
            )
          ],
          color: color,
          borderRadius: const BorderRadius.only(
              topLeft: Radius.circular(15),
              topRight: Radius.circular(15)
          )
      ),

      duration: const Duration(milliseconds: 500),
      curve: Curves.easeInOut,
      height: height,
      width: width,

      child: SingleChildScrollView(
          padding: const EdgeInsets.all(20),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              IconButton(
                  onPressed: (){
                    hideRecoverPassword(ref);
                  },
                  icon: const Icon(Icons.arrow_drop_down)),
              FormRecoverPassword(ref: ref)
            ],
          )
      ),
    );
  }
}

class FormRecoverPassword extends StatefulWidget {
  final WidgetRef ref;
  const FormRecoverPassword({super.key, required this.ref});

  @override
  State<FormRecoverPassword> createState() => _FormRecoverPasswordState();
}

class _FormRecoverPasswordState extends State<FormRecoverPassword> {
  final formKey = GlobalKey<FormState>();
  final controllerEmail = TextEditingController();
  
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Form(
          key: formKey,
          child: CustomTextField(
              controller: controllerEmail,
              inputType: TextInputType.emailAddress,
              label: 'Correo electrónico',
              empty: false
          ),
        ),
        const SizedBox(height: 20),
        OutlinedButton(
            onPressed: (){
              if(formKey.currentState!.validate()){
                resetPassword(controllerEmail.text).then((value) {
                  if (value == 'Success'){
                    openDialog(context, 'Correo de recuperación enviado', 'Revisa tu bandeja de mensajes para recuperar su contraseña.');
                    hideRecoverPassword(widget.ref);
                  } else {
                    openDialog(context, 'Error', getErrorMessage(value));
                  }
                });
              }
            },
            child: const Text('Enviar correo de recuperación')
        )
      ],
    );
  }
}

