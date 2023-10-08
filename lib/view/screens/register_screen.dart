import 'package:academic_advice_app/model/enums/enums.dart';
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
  UserRoles _userRole = UserRoles.Advisee;
  String dropdownValue = Genders.Otro.name;
  final _formKey = GlobalKey<FormState>();
  bool showPassword = true;

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
/******************************************************************************/
          const Text('Perfil:'),
          const Divider(
            color: Colors.black54,
            thickness: 1,
          ),
          RadioListTile(
            title: const Text('Estudiante'),
            value: UserRoles.Advisee,
            groupValue: _userRole,
            onChanged: (value){
              setState(() {
                  _userRole = UserRoles.Advisee;
              });
            }
          ),
          RadioListTile(
            title: const Text('Asesor par'),
            value: UserRoles.Advisor,
            groupValue: _userRole,
            onChanged: (value){
              setState(() {
                _userRole = UserRoles.Advisor;
              });
            }
          ),
          const SizedBox(height: 25),

/******************************************************************************/
          const Text('Datos personales:'),
          const Divider(
            color: Colors.black54,
            thickness: 1,
          ),
          const SizedBox(height: 10),
          TextFormField(
            keyboardType: TextInputType.text,
            validator: (value) {
              if (value == null || value.isEmpty) {
                return 'Please enter some text';
              }
              return null;
            },
            decoration: InputDecoration(
              border: setBorder(),
              labelText: 'Nombre(s)',
            ),
          ),
          const SizedBox(height: 10),
          TextFormField(
            keyboardType: TextInputType.text,
            validator: (value) {
              if (value == null || value.isEmpty) {
                return 'Please enter some text';
              }
              return null;
            },
            decoration: InputDecoration(
              border: setBorder(),
              labelText: 'Apellido paterno',
            ),
          ),
          const SizedBox(height: 10),
          TextFormField(
            keyboardType: TextInputType.text,
            validator: (value) {
              if (value == null || value.isEmpty) {
                return 'Please enter some text';
              }
              return null;
            },
            decoration: InputDecoration(
              border: setBorder(),
              labelText: 'Apellido materno',
            ),
          ),
          const SizedBox(height: 10),
          TextFormField(
            keyboardType: TextInputType.phone,
            validator: (value) {
              if (value == null || value.isEmpty) {
                return 'Please enter some text';
              }
              return null;
            },
            decoration: InputDecoration(
              border: setBorder(),
              labelText: 'Teléfono',
            ),
          ),
          const SizedBox(height: 10),
          DropdownButtonFormField(
            decoration: InputDecoration(
              border: setBorder(),
              labelText: 'Género',
            ),
            value: dropdownValue,
            style: const TextStyle(fontWeight: FontWeight.normal, color: Colors.black),
            icon: const Icon(Icons.arrow_drop_down),
            elevation: 16,
            onChanged: (newValue) {
              setState(() {
                dropdownValue = newValue.toString();
              });
            },
            items: (Genders.values).map<DropdownMenuItem<String>>((Genders value) {
              return DropdownMenuItem<String>(
                alignment: AlignmentDirectional.centerStart,
                value: value.name,
                child: Text(value.name),
              );
            }).toList(),
          ),
          const SizedBox(height: 25),

/******************************************************************************/
          const Text('Datos escolares:'),
          const Divider(
            color: Colors.black54,
            thickness: 1,
          ),
          const SizedBox(height: 10),
          TextFormField(
            validator: (value) {
              if (value == null || value.isEmpty) {
                return 'Please enter some text';
              }
              return null;
            },
            decoration: InputDecoration(
              border: setBorder(),
              labelText: 'Name',
            ),
          ),
          const SizedBox(height: 25),

/******************************************************************************/
          const Text('Credenciales:'),
          const Divider(
            color: Colors.black54,
            thickness: 1,
          ),
          const SizedBox(height: 10),
          TextFormField(
            validator: (value) {
              return (value == null || value.isEmpty) ? 'Ingrese algún valor' : null;
            },
            keyboardType: TextInputType.emailAddress,
            decoration: InputDecoration(
              labelText: 'Correo electrónico',
              border: setBorder(),
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
              keyboardType: TextInputType.visiblePassword,
              decoration: InputDecoration(
                  labelText: 'Contraseña',
                  border: setBorder(),
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
          const SizedBox(height: 10),
        ],
      )
    );
  }

  InputBorder setBorder() {
    return OutlineInputBorder(
      borderRadius: BorderRadius.circular(10)
    );
  }

}

