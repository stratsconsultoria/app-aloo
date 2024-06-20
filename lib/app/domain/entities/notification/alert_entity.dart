class AlertEntity {
  AlertEntity({
    required this.id,
    required this.aviso,
    required this.dataAdd,
    required this.ativo,
  });

  final String id, aviso;
  final DateTime dataAdd;
  final bool ativo;

  List<Object?> get props => [
        id,
        aviso,
        dataAdd,
        ativo,
      ];
}
