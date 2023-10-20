import 'package:academic_advice_app/controller/auth_controller.dart';
import 'package:academic_advice_app/controller/firestore_controller.dart';
import 'package:academic_advice_app/model/dialogs/error_dialog.dart';
import 'package:academic_advice_app/model/entities/user_entity.dart';
import 'package:academic_advice_app/model/static_data/enums.dart';
import 'package:academic_advice_app/model/static_data/lists.dart';
import 'package:academic_advice_app/model/utils/manipule_ui.dart';
import 'package:academic_advice_app/model/utils/set_messages.dart';
import 'package:academic_advice_app/view/custom_widgets/custom_dropdown_field.dart';
import 'package:academic_advice_app/view/custom_widgets/custom_password_field.dart';
import 'package:academic_advice_app/view/custom_widgets/custom_phone_field.dart';
import 'package:academic_advice_app/view/custom_widgets/custom_text_field.dart';
import 'package:academic_advice_app/view/screens/home_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

class RegisterScreen extends ConsumerWidget {
  static const String routeName = 'register_screen';
  final double heightRegister;
  final double widthRegister;

  const RegisterScreen({super.key, required this.heightRegister, required this.widthRegister});

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
                  hideRegister(ref);
                },
                icon: const Icon(Icons.arrow_drop_down)
            ),
            const Text('FORMULARIO DE REGISTRO',
                style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.w700
                )
            ),
            const SizedBox(height: 10),
            RegisterForm(ref: ref),
            const SizedBox(height: 15),
            Align(
              alignment: Alignment.centerRight,
              child: TextButton(
                  onPressed: (){
                    toggleLoginRegister(heightRegister * 0.5, 0.0, ref);
                  },
                  child: const Text('Ya estoy registrado', style: TextStyle(decoration: TextDecoration.underline))
              ),
            )
          ],
        ),
      ),
    );
  }
}

class RegisterForm extends StatefulWidget {
  final WidgetRef ref;
  const RegisterForm({super.key, required this.ref});

  @override
  State<RegisterForm> createState() => _RegisterFormState();
}

class _RegisterFormState extends State<RegisterForm> {
  Map<String, dynamic> userData = {
    "userType" : "",
    "name" : "",
    "lastName1" : "",
    "lastName2" : "",
    "phoneNumber" : "",
    "gender" : "",
    "degreeProgram" : "",
    "semester" : "",
    "controlNumber" : "",
    "email" : ""
  };
  UserRoles _userRole = UserRoles.Asesorado;

  final _formKey = GlobalKey<FormState>();
  final nameController = TextEditingController();
  final lastName1Controller = TextEditingController();
  final lastName2Controller = TextEditingController();
  final phoneNumberController = TextEditingController();
  ValueNotifier<String> gender = ValueNotifier('--Seleccionar--');
  ValueNotifier<String> degreeProgram = ValueNotifier('--Seleccionar--');
  ValueNotifier<String> semester = ValueNotifier('--Seleccionar--');
  final controlNumberController = TextEditingController();
  final emailController = TextEditingController();
  final passwordController = TextEditingController();

  @override
  void dispose() {
    nameController.dispose();
    lastName1Controller.dispose();
    lastName2Controller.dispose();
    phoneNumberController.dispose();
    gender.dispose();
    degreeProgram.dispose();
    semester.dispose();
    controlNumberController.dispose();
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
/******************************************************************************/
          const Text('Perfil:'),
          const Divider(
            thickness: 1,
          ),
          RadioListTile(
            title: const Text('Estudiante'),
            value: UserRoles.Asesorado,
            groupValue: _userRole,
            onChanged: (value){
              setState(() {
                  _userRole = UserRoles.Asesorado;
              });
            }
          ),
          RadioListTile(
            title: const Text('Asesor par'),
            value: UserRoles.Asesor,
            groupValue: _userRole,
            onChanged: (value){
              setState(() {
                _userRole = UserRoles.Asesor;
              });
            }
          ),
          const SizedBox(height: 25),

/******************************************************************************/
          const Text('Datos personales:'),
          const Divider(
            thickness: 1,
          ),
          const SizedBox(height: 10),
          CustomTextField(label: 'Nombre(s)', controller: nameController, inputType: TextInputType.text, empty: false),
          const SizedBox(height: 10),
          CustomTextField(label: 'Primer apellido', controller: lastName1Controller, inputType: TextInputType.text, empty: false),
          const SizedBox(height: 10),
          CustomTextField(label: 'Segundo apellido (opcional)', controller: lastName2Controller, inputType: TextInputType.text, empty: true),
          const SizedBox(height: 10),
          CustomPhoneField(label: 'Teléfono', controller: phoneNumberController),
          const SizedBox(height: 10),
          CustomDropdownField(label: 'Género', items: gendersList, dropdownValue: gender),
          const SizedBox(height: 25),

/******************************************************************************/
          const Text('Datos escolares:'),
          const Divider(
            thickness: 1,
          ),
          const SizedBox(height: 10),
          CustomDropdownField(label: 'Programa educativo', items: degreeProgramList, dropdownValue: degreeProgram),
          const SizedBox(height: 10),
          CustomDropdownField(label: 'Semestre', items: semesterList, dropdownValue: semester),
          const SizedBox(height: 10),
          CustomTextField(label: 'Número de control', controller: controlNumberController, inputType: TextInputType.text, empty: false),
          const SizedBox(height: 25),

/******************************************************************************/
          const Text('Credenciales:'),
          const Divider(
            thickness: 1,
          ),
          const SizedBox(height: 10),
          CustomTextField(label: 'Correo electrónico', controller: emailController, inputType: TextInputType.emailAddress, empty: false),
          const SizedBox(height: 10),
          CustomPasswordField(controller: passwordController, validate: true),
          const SizedBox(height: 25),
          OutlinedButton(
            onPressed: () {
              if(_formKey.currentState!.validate()) {
                String email = emailController.text.trim();
                String password = passwordController.text.trim();

                userData['userType'] = _userRole.name;
                userData['name'] = nameController.text.trim();
                userData['lastName1'] = lastName1Controller.text.trim();
                userData['lastName2'] = lastName2Controller.text.trim();
                userData['phoneNumber'] = phoneNumberController.text.trim();
                userData['gender'] = gender.value.trim();
                userData['degreeProgram'] = degreeProgram.value.trim();
                userData['semester'] = semester.value;
                userData['controlNumber'] = controlNumberController.text.trim();
                userData['email'] = email;

                signUp(email, password).then((responseSignUp) {
                  if(responseSignUp == 'Success') {
                    addData(UserEntity.fromJson(userData), widget.ref)
                        .then((responseAddData) {
                          if (responseAddData){
                            context.pushNamed(HomeScreen.routeName);
                            _formKey.currentState?.dispose();
                            hideRegister(widget.ref);
                          }
                    });
                  } else {
                    openDialog(context, 'Error de registro', getErrorMessage(responseSignUp));
                  }
                });
              }
            },
            child: const Text('Registrarse'),
          )
        ],
      )
    );
  }
}

