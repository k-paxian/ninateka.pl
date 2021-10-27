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

  Future<http.Response> _doGet(Uri uri, {Map<String, String>? headers}) =>
      _httpClient.get(Uri.parse('$restUri$uri'),
          headers: {...defaultHeaders, ...(headers ?? {})});

  Future<http.Response> _doGetResource(Uri uri,
          {Map<String, String>? headers}) =>
      _doGet(Uri.parse('$resourceUri$uri'), headers: headers);

  @protected
  Future<T> doGetValueObject<T>(Uri uri, {Map<String, String>? headers}) =>
      _doGetResource(uri, headers: headers)
          .then((response) => JsonMapper.deserialize<T>(response.body)!);
}
