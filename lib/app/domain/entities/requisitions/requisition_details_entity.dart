import '../entities.dart';

class RequisitionDetailsEntity {
  const RequisitionDetailsEntity({
    required this.atendimento,
    required this.observacoes,
  });

  final RequisitionEntity atendimento;
  final List<ObservationsEntity> observacoes;

  List<Object?> get props => [atendimento.props, observacoes];
}

class ObservationsEntity {
  const ObservationsEntity({
    required this.id,
    required this.mensagem,
    required this.usuario,
    required this.datahora,
  });

  final String id, mensagem, usuario;
  final String datahora;

  List<Object?> get props => [
        id,
        mensagem,
        usuario,
        datahora,
      ];
}
