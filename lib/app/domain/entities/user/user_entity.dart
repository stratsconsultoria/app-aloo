class UserEntity {
  const UserEntity({
    required this.id,
    required this.nome,
    required this.email,
    required this.permissao,
    required this.master,
    required this.empresa,
    required this.pushId,
    required this.expireAt,
  });

  final String id, nome, email, permissao, master, empresa;
  final String? pushId;
  final DateTime expireAt;

  List<Object?> get props => [
        id,
        nome,
        email,
        permissao,
        master,
        empresa,
        pushId,
        expireAt,
      ];
}
