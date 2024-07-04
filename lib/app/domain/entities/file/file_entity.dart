class FileEntity {
  FileEntity({
    required this.id,
    required this.arquivo,
    required this.url,
    required this.responsavel,
    required this.apagar,
  });

  final String id, arquivo, url, responsavel;
  final bool apagar;

  List<Object> get props => [
        id,
        arquivo,
        url,
        responsavel,
        apagar,
      ];
}
