abstract class ApiService<T> {
  void clearHeaderToken();

  void setHeaderToken(String token);

  Future<T> request(
    String url,
    String mode, {
    Map<String, dynamic>? body,
    Map<String, dynamic>? queryParams,
    Map<String, dynamic>? headers,
  });
}
