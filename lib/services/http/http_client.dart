import 'package:http/http.dart' as http;

abstract class IHttpClient{
  Future get({required String url});
  Future post({required body, required String url});
  Future authenticatePost({
    required body,
    required String url,
    required String token
  });
  Future authenticateGet({
    required String url,
    required String token
  });
}

class HttpClient implements IHttpClient{
  final client = http.Client();

  @override
  Future get({required String url}) async {
    return await client.get(Uri.parse(url));
  }

  @override
  Future post({required body, required String url}) async {
    return await client.post(
        Uri.parse(url),
        headers: {"Content-type" : "application/json; charset=UTF-8"},
        body: body
    );
  }

  @override
  Future authenticatePost({
    required body,
    required String url,
    required String token
  }) async {
    return await client.post(
        Uri.parse(url),
        headers: {
          "Content-type" : "application/json; charset=UTF-8",
          "Authorization": "Bearer $token",
        },
        body: body
    );
  }

  @override
  Future authenticateGet({
    required String url,
    required String token
  }) async {
    return await client.get(
        Uri.parse(url),
        headers: {
          "Authorization": "Bearer $token",
          "Content-type" : "application/json; charset=UTF-8"
        },
    );
  }

}

