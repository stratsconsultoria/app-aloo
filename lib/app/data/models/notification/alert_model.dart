import '../../../domain/entities/entities.dart';

class AlertModel {
  String id;
  String aviso;
  DateTime dataAdd;
  bool ativo;

  AlertModel({
    required this.id,
    required this.aviso,
    required this.dataAdd,
    required this.ativo,
  });

  factory AlertModel.fromJson(Map<String, dynamic> json) {
    return AlertModel(
      id: json['id'],
      aviso: json['aviso'],
      dataAdd: DateTime.parse(json['data_add']),
      ativo: json['ativo'] == "1",
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'aviso': aviso,
      'data_add': dataAdd.toIso8601String(),
      'ativo': ativo ? "1" : "0",
    };
  }

  AlertEntity toEntity() => AlertEntity(
        id: id,
        aviso: aviso,
        dataAdd: dataAdd,
        ativo: ativo,
      );
}
