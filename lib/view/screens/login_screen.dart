import 'package:academic_advice_app/controller/auth_controller.dart';
import 'package:academic_advice_app/model/dialogs/error_dialog.dart';
import 'package:academic_advice_app/model/utils/manipule_ui.dart';
import 'package:academic_advice_app/view/custom_widgets/custom_password_field.dart';
import 'package:academic_advice_app/view/custom_widgets/custom_text_field.dart';
import 'package:academic_advice_app/view/screens/home_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

class LoginScreen extends ConsumerWidget {
  final double heightLogin;
  final double widthLogin;

  const LoginScreen({super.key, required this.heightLogin, required this.widthLogin});

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
      height: heightLogin,
      width: widthLogin,
      child: Align(
        alignment: Alignment.center,
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(20),
          child: Column(
            children: [
              IconButton(
                  onPressed: (){
                    hideLogin(ref);
                  },
                  icon: const Icon(Icons.arrow_drop_down)),
              const Text('INICIO DE SESIÓN',
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.w700
                )
              ),
              const SizedBox(height: 15),
              LoginForm(ref: ref),
              Align(
                alignment: Alignment.centerRight,
                child: TextButton(
                    onPressed: (){

                    },
                    child: const Text('Olvidé mi contraseña',  style: TextStyle(decoration: TextDecoration.underline))
                ),
              ),
              Align(
                alignment: Alignment.centerRight,
                child: TextButton(
                    onPressed: (){
                      toggleLoginRegister(0.0, MediaQuery.of(context).size.height, ref);
                    },
                    child: const Text('Quiero registrarme', style: TextStyle(decoration: TextDecoration.underline))
                ),
              )
            ],
          )
        ),
      ),
    );
  }
}

class LoginForm extends StatefulWidget {
  final WidgetRef ref;
  const LoginForm({super.key, required this.ref});

  @override
  State<LoginForm> createState() => _LoginFormState();
}

class _LoginFormState extends State<LoginForm> {
  final _formKey = GlobalKey<FormState>();
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  bool showPassword = true;

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          CustomTextField(label: 'Email', controller: emailController, inputType: TextInputType.emailAddress, empty: false),
          const SizedBox(height: 10),
          CustomPasswordField(controller: passwordController, validate: false),
          const SizedBox(height: 20),
          OutlinedButton(
              onPressed: (){
                if(_formKey.currentState!.validate()) {
                  signIn(emailController.text.trim(), passwordController.text.trim())
                  .then((value){
                    if(value == 'Success'){
                      hideLogin(widget.ref);
                      context.pushNamed(HomeScreen.routeName);
                    }else{
                      openDialog(context, 'Error de inicio de sesión', 'Correo o contraseña incorrectos.');
                    }
                  });
                }
              },
              child: const Text('Entrar')
          ),
        ],
      ),
    );
  }
}

