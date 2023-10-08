import 'package:academic_advice_app/model/providers/height_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart' show SystemChannels;
import 'package:flutter_riverpod/flutter_riverpod.dart';

class RegisterScreen extends ConsumerWidget {
  static const String routeName = 'register_screen';
  final double heightRegister;
  final double widthRegister;

  const RegisterScreen({super.key, required this.heightRegister, required this.widthRegister});

  @override
  Widget build(BuildContext context, WidgetRef ref) {

    return AnimatedContainer(
      color: Colors.white,
      height: heightRegister,
      width: widthRegister,
      duration: const Duration(milliseconds: 500),
      curve: Curves.fastOutSlowIn,
      child: SingleChildScrollView(
        padding: const EdgeInsets.all(20),
        child: Column(
          children: [
            IconButton(
                onPressed: (){
                  ref.read(heightRegisterProvider.notifier).state = 0.0;
                  SystemChannels.textInput.invokeMethod('TextInput.hide');
                },
                icon: const Icon(Icons.arrow_drop_down)),
            const SizedBox(height: 10),
            const RegisterForm(),
            const SizedBox(height: 10),
            ElevatedButton(
              onPressed: () {},
              child: const Text('Registrarse'),
            ),
          ],
        ),
      ),
    );
  }
}

class RegisterForm extends StatefulWidget {
  const RegisterForm({super.key});

  @override
  State<RegisterForm> createState() => _RegisterFormState();
}

class _RegisterFormState extends State<RegisterForm> {
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: Column(
        children: [
          TextFormField(
            validator: (value) {
              if (value == null || value.isEmpty) {
                return 'Please enter some text';
              }
              return null;
            },
            decoration: const InputDecoration(
              border: OutlineInputBorder(),
              labelText: 'Name',
            ),
          ),
          TextFormField(
            validator: (value) {
              if (value == null || value.isEmpty) {
                return 'Please enter some text';
              }
              return null;
            },
            decoration: const InputDecoration(
              border: OutlineInputBorder(),
              labelText: 'Name',
            ),
          ),
        ],
      )
    );
  }
}

