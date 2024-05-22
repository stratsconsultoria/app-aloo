class RequisitionEntity {
  const RequisitionEntity({
    required this.id,
    required this.protocolo,
    required this.solicitante,
    required this.status,
    required this.postoAtual,
    required this.circuito,
    required this.abertura,
    required this.fechamento,
  });

  final String id, protocolo, solicitante, status, postoAtual, circuito;
  final DateTime abertura;
  final DateTime? fechamento;

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
