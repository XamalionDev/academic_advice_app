import 'package:academic_advice_app/model/providers/height_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart' show SystemChannels;
import 'package:flutter_riverpod/flutter_riverpod.dart';

class LoginScreen extends ConsumerWidget {
  final double heightLogin;
  final double widthLogin;

  const LoginScreen({super.key, required this.heightLogin, required this.widthLogin});

  @override
  Widget build(BuildContext context, WidgetRef ref) {

    return AnimatedContainer(
      color: Colors.white,
      duration: const Duration(milliseconds: 500),
      curve: Curves.easeInOut,
      height: heightLogin,
      width: widthLogin,
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
            const LoginForm()
          ],
        )
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
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      autovalidateMode: AutovalidateMode.onUserInteraction,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          TextFormField(
            validator: (value) {
              return (value == null || value.isEmpty) ? 'Ingrese algún valor' : null;
            },
            controller: emailController,
            keyboardType: TextInputType.emailAddress,
            decoration: InputDecoration(
              labelText: 'Correo electrónico',
              border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10)
              ),
            ),
          ),
          const SizedBox(height: 10),
          TextFormField(
            validator: (value) {
              if (value == null || value.isEmpty) {
                return 'Ingresa algún valor';
              } else if (value.length < 6){
                return 'Minimo 6 caracteres';
              } else {
                return null;
              }
            },
            controller: passwordController,
            keyboardType: TextInputType.visiblePassword,
            decoration: InputDecoration(
                labelText: 'Contraseña',
                border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10)
                ),
                suffixIcon: IconButton(
                    onPressed: (){
                      setState(() {
                        showPassword = !showPassword;
                      });
                    },
                    icon: Icon(showPassword ? Icons.visibility_off : Icons.visibility))
            ),
            obscureText: showPassword
          ),
          const SizedBox(height: 20),
          OutlinedButton(
              onPressed: (){
                if(_formKey.currentState!.validate()) {

                }
              },
              child: const Text('Entrar')
          ),
          TextButton(
              onPressed: (){

              },
              child: const Text('¿Olvidaste tu contraseña?')
          ),
        ],
      ),
    );
  }
}

