import '../../../domain/entities/requisitions/requisitions.dart';
import '../models.dart';

class RequisitionDetailsModel {
  RequisitionModel atendimento;
  List<ObservationsModel> observacoes;

  RequisitionDetailsModel({
    required this.atendimento,
    required this.observacoes,
  });

  factory RequisitionDetailsModel.fromJson(Map<String, dynamic> json) {
    var observacoesList = json['observacoes'] as List<dynamic>;
    List<ObservationsModel> observacoes =
        observacoesList.map((item) => ObservationsModel.fromJson(item)).toList();

    return RequisitionDetailsModel(
      atendimento: RequisitionModel.fromJson(json['atendimento']),
      observacoes: observacoes,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'atendimento': atendimento.toJson(),
      'observacoes': observacoes.map((observacao) => observacao.toJson()).toList(),
    };
  }

  RequisitionDetailsEntity toEntity() => RequisitionDetailsEntity(
        atendimento: atendimento.toEntity(),
        observacoes: observacoes.map((obs) => obs.toEntity()).toList(),
      );
}

class ObservationsModel {
  String id;
  String mensagem;
  String usuario;
  String datahora;

  ObservationsModel({
    required this.id,
    required this.mensagem,
    required this.usuario,
    required this.datahora,
  });

  factory ObservationsModel.fromJson(Map<String, dynamic> json) {
    return ObservationsModel(
      id: json['id'],
      mensagem: json['mensagem'],
      usuario: json['usuario'],
      datahora: json['datahora'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'mensagem': mensagem,
      'usuario': usuario,
      'datahora': datahora,
    };
  }

  ObservationsEntity toEntity() => ObservationsEntity(
        id: id,
        mensagem: mensagem,
        usuario: usuario,
        datahora: datahora,
      );
}
