import 'package:academic_advice_app/model/providers/height_provider.dart';
import 'package:academic_advice_app/model/static_data/enums.dart';
import 'package:academic_advice_app/model/static_data/lists.dart';
import 'package:academic_advice_app/view/custom_widgets/custom_dropdown_field.dart';
import 'package:academic_advice_app/view/custom_widgets/custom_password_field.dart';
import 'package:academic_advice_app/view/custom_widgets/custom_text_field.dart';
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
            const RegisterForm()
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

  final _formKey = GlobalKey<FormState>();
  final nameController = TextEditingController();
  final lastName1Controller = TextEditingController();
  final lastName2Controller = TextEditingController();
  final phoneNumberController = TextEditingController();
  ValueNotifier<String> gender = ValueNotifier('--Seleccionar--');
  ValueNotifier<String> degreeProgram = ValueNotifier('--Seleccionar--');
  ValueNotifier<String> semester = ValueNotifier('--Seleccionar--');
  final numControlController = TextEditingController();
  final emailController = TextEditingController();
  final passwordController = TextEditingController();

  _genderListener(){

  }
  _degreeProgramListener() {

  }

  _semesterListener() {

  }

  @override
  void dispose() {
    gender.removeListener(_genderListener);
    degreeProgram.removeListener(_degreeProgramListener);
    semester.removeListener(_semesterListener);

    nameController.dispose();
    lastName1Controller.dispose();
    lastName2Controller.dispose();
    phoneNumberController.dispose();
    gender.dispose();
    degreeProgram.dispose();
    semester.dispose();
    numControlController.dispose();
    emailController.dispose();
    passwordController.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    gender.addListener(_genderListener);
    degreeProgram.addListener(_degreeProgramListener);
    semester.addListener(_semesterListener);

    return Form(
      key: _formKey,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
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
          CustomTextField(label: 'Nombre(s)', controller: nameController, inputType: TextInputType.text, empty: false),
          const SizedBox(height: 10),
          CustomTextField(label: 'Primer apellido', controller: lastName1Controller, inputType: TextInputType.text, empty: false),
          const SizedBox(height: 10),
          CustomTextField(label: 'Segundo apellido (Opcional)', controller: lastName2Controller, inputType: TextInputType.text, empty: true),
          const SizedBox(height: 10),
          CustomTextField(label: 'Teléfono', controller: phoneNumberController, inputType: TextInputType.phone, empty: false),
          const SizedBox(height: 10),
          CustomDropdownField(label: 'Género', items: gendersList, dropdownValue: gender),
          const SizedBox(height: 25),

/******************************************************************************/
          const Text('Datos escolares:'),
          const Divider(
            color: Colors.black54,
            thickness: 1,
          ),
          const SizedBox(height: 10),
          CustomDropdownField(label: 'Programa educativo', items: degreeProgramList, dropdownValue: degreeProgram),
          const SizedBox(height: 10),
          CustomDropdownField(label: 'Semestre', items: semesterList, dropdownValue: semester),
          const SizedBox(height: 10),
          CustomTextField(label: 'Número de control', controller: numControlController, inputType: TextInputType.text, empty: false),
          const SizedBox(height: 25),

/******************************************************************************/
          const Text('Credenciales:'),
          const Divider(
            color: Colors.black54,
            thickness: 1,
          ),
          const SizedBox(height: 10),
          CustomTextField(label: 'Correo electrónico', controller: emailController, inputType: TextInputType.emailAddress, empty: false),
          const SizedBox(height: 10),
          CustomPasswordField(controller: passwordController),
          const SizedBox(height: 25),
          ElevatedButton(
            onPressed: () {
              if(_formKey.currentState!.validate()) {

              }
            },
            child: const Text('Registrarse'),
          ),
        ],
      )
    );
  }
}

