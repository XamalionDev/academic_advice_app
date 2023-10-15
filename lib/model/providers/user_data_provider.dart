import 'package:academic_advice_app/model/entities/user_entity.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

UserEntity? userData;

final userDataProvider = StateProvider<UserEntity?>((ref) => userData);