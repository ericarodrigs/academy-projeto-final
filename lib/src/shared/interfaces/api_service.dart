abstract class ApiService {
  Future<String> get(String url, Map<String, dynamic> params);
  Future<String> post(String url, Map<String, dynamic> params);
  Future<String> patch(String url, Map<String, dynamic> params);
  Future<String> put(String url, Map<String, dynamic> params);
  Future<String> delete(String url, Map<String, dynamic> params);
}
