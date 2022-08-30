abstract class ApiService {
  void clearHeaderToken();

  void setHeaderToken(String token);

  Future<dynamic> request(
    String url,
    String mode, {
    dynamic data,
    Map<String, dynamic>? queryParams,
  });
}
