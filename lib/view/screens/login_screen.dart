import 'package:academic_advice_app/model/providers/height_provider.dart';
import 'package:academic_advice_app/view/custom_widgets/custom_password_field.dart';
import 'package:academic_advice_app/view/custom_widgets/custom_text_field.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart' show SystemChannels;
import 'package:flutter_riverpod/flutter_riverpod.dart';

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
                    ref.read(heightLoginProvider.notifier).state = 0.0;
                    SystemChannels.textInput.invokeMethod('TextInput.hide');
                  },
                  icon: const Icon(Icons.arrow_drop_down)),
              const Text('INICIO DE SESIÓN',
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.w700
                )),
              const SizedBox(height: 15),
              const LoginForm(),
              Align(
                alignment: Alignment.centerRight,
                child: TextButton(
                    onPressed: (){

                    },
                    child: const Text('Olvidé mi contraseña')
                ),
              ),
              Align(
                alignment: Alignment.centerRight,
                child: TextButton(
                    onPressed: (){
                      ref.read(heightLoginProvider.notifier).state = 0.0;
                      SystemChannels.textInput.invokeMethod('TextInput.hide');
                      ref.read(heightRegisterProvider.notifier).state = MediaQuery.of(context).size.height;
                    },
                    child: const Text('Quiero registrarme')
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
  const LoginForm({super.key});

  @override
  State<LoginForm> createState() => _LoginFormState();
}

class _LoginFormState extends State<LoginForm> {
  final _formKey = GlobalKey<FormState>();
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  bool showPassword = true;

  @override
  void dispose() {
    emailController.dispose();
    passwordController.dispose();

    super.dispose();
  }

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
          CustomPasswordField(controller: passwordController),
          const SizedBox(height: 20),
          OutlinedButton(
              onPressed: (){
                if(_formKey.currentState!.validate()) {

                }
              },
              child: const Text('Entrar')
          ),
        ],
      ),
    );
  }
}

