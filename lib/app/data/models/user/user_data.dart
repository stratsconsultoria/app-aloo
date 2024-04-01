import 'package:app_aloo/app/domain/entities/entities.dart';

class UserData {
  final int success;
  final String jwt, id, nome, email, permissao, master, empresa, pushId;
  DateTime expireAt;

  UserData({
    required this.success,
    required this.jwt,
    required this.id,
    required this.nome,
    required this.email,
    required this.permissao,
    required this.master,
    required this.empresa,
    required this.pushId,
    required this.expireAt,
  });

  factory UserData.fromJson(Map<String, dynamic> json) {
    return UserData(
      success: json['success'],
      jwt: json['jwt'],
      id: json['id'],
      nome: json['nome'],
      email: json['email'],
      permissao: json['permissao'],
      master: json['master'],
      empresa: json['empresa'],
      pushId: json['push_id'],
      expireAt: DateTime.fromMillisecondsSinceEpoch(json['expireAt'] * 1000),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'success': success,
      'jwt': jwt,
      'id': id,
      'nome': nome,
      'email': email,
      'permissao': permissao,
      'master': master,
      'empresa': empresa,
      'push_id': pushId,
      'expireAt': expireAt.millisecondsSinceEpoch ~/ 1000,
    };
  }

  UserEntity toEntity() => UserEntity(
        id: id,
        nome: nome,
        email: email,
        permissao: permissao,
        master: master,
        empresa: empresa,
        pushId: pushId,
        expireAt: expireAt,
      );
}
