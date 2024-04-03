class RequisitionEntity {
  const RequisitionEntity({
    required this.id,
    required this.protocolo,
    required this.abertura,
    required this.fechamento,
    required this.solicitante,
    required this.status,
    required this.postoAtual,
    required this.circuito,
  });

  final String id, protocolo, solicitante, status, postoAtual, circuito, abertura, fechamento;

  List<Object?> get props => [
        id,
        protocolo,
        solicitante,
        status,
        postoAtual,
        circuito,
        abertura,
        fechamento,
      ];
}
