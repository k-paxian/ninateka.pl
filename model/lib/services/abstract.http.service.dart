import 'package:dart_json_mapper/dart_json_mapper.dart';
import 'package:http/http.dart' as http;
import 'package:meta/meta.dart';

abstract class AbstractHttpService {
  final _httpClient = http.Client();

  Uri get restUri {
    return Uri();
  }

  Uri get resourceUri {
    return Uri();
  }

  Map<String, String> get defaultHeaders {
    return {};
  }

  Future<http.Response> _doGet(Uri uri) =>
      _httpClient.get(Uri.parse('$restUri$uri'), headers: defaultHeaders);

  Future<http.Response> _doGetResource(Uri uri) =>
      _doGet(Uri.parse('$resourceUri$uri'));

  @protected
  Future<T> doGetValueObject<T>(Uri uri) => _doGetResource(uri)
      .then((response) => JsonMapper.deserialize<T>(response.body)!);
}
