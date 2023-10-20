import 'package:academic_advice_app/model/providers/height_provider.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter/services.dart' show SystemChannels;

void hideRecoverPassword(WidgetRef ref) {
  SystemChannels.textInput.invokeMethod('TextInput.hide');
  ref.read(heightRecoverPasswordProvider.notifier).state = 0.0;
}

void hideRegister(WidgetRef ref) {
  SystemChannels.textInput.invokeMethod('TextInput.hide');
  ref.read(heightRegisterProvider.notifier).state = 0.0;
}

void hideLogin(WidgetRef ref) {
  SystemChannels.textInput.invokeMethod('TextInput.hide');
  ref.read(heightLoginProvider.notifier).state = 0.0;
}

void showRecoverPassword(double heightRecover, WidgetRef ref) {
  ref.read(heightRecoverPasswordProvider.notifier).state = heightRecover;
}

void showRegister(double heightRegister, WidgetRef ref) {
  ref.read(heightRegisterProvider.notifier).state = heightRegister;
}

void showLogin(double heightLogin, WidgetRef ref) {
  ref.read(heightLoginProvider.notifier).state = heightLogin;
}

void toggleLoginRegister(double heightLogin, double heightRegister, WidgetRef ref) {
  if(ref.read(heightLoginProvider) > 0) {
    hideLogin(ref);
    showRegister(heightRegister, ref);
  } else {
    hideRegister(ref);
    showLogin(heightLogin, ref);
  }
}