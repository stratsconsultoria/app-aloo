import '../../../domain/entities/entities.dart';

class FileModel {
  String id;
  String arquivo;
  String url;
  String responsavel;
  bool apagar;

  FileModel({
    required this.id,
    required this.arquivo,
    required this.url,
    required this.responsavel,
    required this.apagar,
  });

  factory FileModel.fromJson(Map<String, dynamic> json) {
    return FileModel(
      id: json['id'],
      arquivo: json['arquivo'],
      url: json['url'],
      responsavel: json['responsavel'],
      apagar: json['apagar'] == "1",
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'arquivo': arquivo,
      'url': url,
      'responsavel': responsavel,
      'apagar': apagar ? "1" : "0",
    };
  }

  FileEntity toEntity() => FileEntity(
        id: id,
        arquivo: arquivo,
        url: url,
        responsavel: responsavel,
        apagar: apagar,
      );
}
