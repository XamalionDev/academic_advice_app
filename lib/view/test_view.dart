import 'package:academic_advice_app/controller/test_controller.dart';
import 'package:flutter/material.dart';

class TestView extends StatefulWidget {
  const TestView({super.key});

  @override
  State<TestView> createState() => _TestViewState();
}

class _TestViewState extends State<TestView> {
  String email = '', password = '', emailRegister = '', passwordRegister = '';
  String messageLogin = 'Message login';
  String messageRegister = 'Message register';
  String messageCurrentUser = 'Message current user';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Auth tests'),
      ),
      body: Center(
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(10),
          child: Column(children: [
            const Text('Inicio de sesión'),
            TextField(onChanged: (inputEmail) {
              setState(() {
                email = inputEmail;
              });
            }),
            TextField(onChanged: (inputPassword) {
              setState(() {
                password = inputPassword;
              });
            }),
            ElevatedButton(
                onPressed: () {
                  signIn(email, password).then((value) =>
                      setState(() {
                        messageLogin = value;
                      })
                  );
                },
                child: const Text('Iniciar sesión')),
            Text(messageLogin),

            const SizedBox(height: 10),
            const Text('Crear usuario'),
            TextField(onChanged: (inputEmail) {
              setState(() {
                emailRegister = inputEmail;
              });
            }),
            TextField(onChanged: (inputPassword) {
              setState(() {
                passwordRegister = inputPassword;
              });
            }),
            ElevatedButton(
                onPressed: () {
                  signUp(emailRegister, passwordRegister).then((value) =>
                      setState(() {
                        messageRegister = value;
                      })
                  );
                },
                child: const Text('Registrarse')),
            Text(messageRegister),

            const SizedBox(height: 10),
            const Text('Get current user'),
            ElevatedButton(
                onPressed: (){
                  getUser().then((value) =>
                      setState(() {
                        messageCurrentUser = value ? 'User log-in' : 'User log-out';
                      })
                  );
                },
                child: const Text('Get')),
            Text(messageCurrentUser),

            const SizedBox(height: 10),
            const Text('Sign out'),
            ElevatedButton(
                onPressed: (){
                  signOut().then((_) =>
                      setState(() {
                        messageCurrentUser = 'User log-out';
                      })
                  );
                },
                child: const Text('Sign out')),
          ]),
        ),
      ),
    );
  }
}
