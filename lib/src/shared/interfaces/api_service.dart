abstract class ApiService {
  void clearHeaderToken();

  void setHeaderToken(String token);

  Future<dynamic> request(
    String url,
    String mode, {
    Map<String, dynamic> body,
    Map<String, dynamic>? queryParams,
    Map<String, dynamic>? headers,
  });
}
