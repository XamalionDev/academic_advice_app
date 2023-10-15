import 'dart:convert';
/// userType : ""
/// name : ""
/// lastName1 : ""
/// lastName2 : ""
/// phoneNumber : ""
/// gender : ""
/// degreeProgram : ""
/// semester : ""
/// numControl : ""
/// email : ""

UserEntity userEntityFromJson(String str) => UserEntity.fromJson(json.decode(str));
String userEntityToJson(UserEntity data) => json.encode(data.toJson());

class UserEntity {

  UserEntity({
      String? userType, 
      String? name, 
      String? lastName1, 
      String? lastName2, 
      String? phoneNumber, 
      String? gender, 
      String? degreeProgram, 
      String? semester, 
      String? controlNumber,
      String? email,}){
    _userType = userType;
    _name = name;
    _lastName1 = lastName1;
    _lastName2 = lastName2;
    _phoneNumber = phoneNumber;
    _gender = gender;
    _degreeProgram = degreeProgram;
    _semester = semester;
    _controlNumber = controlNumber;
    _email = email;
}

  UserEntity.fromJson(dynamic json) {
    _userType = json['userType'];
    _name = json['name'];
    _lastName1 = json['lastName1'];
    _lastName2 = json['lastName2'];
    _phoneNumber = json['phoneNumber'];
    _gender = json['gender'];
    _degreeProgram = json['degreeProgram'];
    _semester = json['semester'];
    _controlNumber = json['controlNumber'];
    _email = json['email'];
  }

  String? _userType;
  String? _name;
  String? _lastName1;
  String? _lastName2;
  String? _phoneNumber;
  String? _gender;
  String? _degreeProgram;
  String? _semester;
  String? _controlNumber;
  String? _email;

UserEntity copyWith({
  String? userType,
  String? name,
  String? lastName1,
  String? lastName2,
  String? phoneNumber,
  String? gender,
  String? degreeProgram,
  String? semester,
  String? numControl,
  String? email,
}) => UserEntity(  userType: userType ?? _userType,
  name: name ?? _name,
  lastName1: lastName1 ?? _lastName1,
  lastName2: lastName2 ?? _lastName2,
  phoneNumber: phoneNumber ?? _phoneNumber,
  gender: gender ?? _gender,
  degreeProgram: degreeProgram ?? _degreeProgram,
  semester: semester ?? _semester,
  controlNumber: numControl ?? _controlNumber,
  email: email ?? _email,
);
  String? get userType => _userType;
  String? get name => _name;
  String? get lastName1 => _lastName1;
  String? get lastName2 => _lastName2;
  String? get phoneNumber => _phoneNumber;
  String? get gender => _gender;
  String? get degreeProgram => _degreeProgram;
  String? get semester => _semester;
  String? get numControl => _controlNumber;
  String? get email => _email;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['userType'] = _userType;
    map['name'] = _name;
    map['lastName1'] = _lastName1;
    map['lastName2'] = _lastName2;
    map['phoneNumber'] = _phoneNumber;
    map['gender'] = _gender;
    map['degreeProgram'] = _degreeProgram;
    map['semester'] = _semester;
    map['controlNumber'] = _controlNumber;
    map['email'] = _email;
    return map;
  }

}