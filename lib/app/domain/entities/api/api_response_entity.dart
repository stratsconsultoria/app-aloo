class ApiResponseEntity<T> {
  const ApiResponseEntity({
    required this.totalPaginas,
    required this.paginaAtual,
    required this.data,
  });

  final int totalPaginas, paginaAtual;
  final List<T> data;
}
