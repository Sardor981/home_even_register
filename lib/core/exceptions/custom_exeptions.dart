class ServerExeption implements Exception {
  final String errorMessage;
  final int statusCode;

  ServerExeption({required this.errorMessage, required this.statusCode});
}
