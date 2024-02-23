import 'package:equatable/equatable.dart';

class AuthEntity extends Equatable {
  const AuthEntity({
    required this.email,
    required this.username,
    required this.password,
    required this.image,
    required this.id,
  });

  final String email, password, username, image, id;

  @override
  List<Object?> get props => [
    email,
    password,
    username,
    username,
    id,
  ];
}

// class AuthEntity extends Equatable {
//   final String email;
//   final String password;
//   final String id;

//   const AuthEntity({
//     required this.email,
//     required this.password,
//     required this.id,
//   });

//   static const empty = AuthEntity(
//     email: '',
//     password: '',
//     id: '',
//   );

//   AuthEntity copyWith({
//     String? email,
//     String? password,
//     String? id,
//   }) {
//     return AuthEntity(
//       email: email ?? this.email,
//       password: password ?? this.password,
//       id: id ?? this.id,
//     );
//   }

//   AuthEntity toEntity() {
//     return AuthEntity(
//       email: email,
//       password: password,
//       id: id,
//     );
//   }

//   @override
//   List<Object?> get props => [id, email, password];
// }


