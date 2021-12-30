import './abstract.http.service.dart';

abstract class AbstractNinatekaService extends AbstractHttpService {
  final _url = Uri.parse('https://admin.fina.gov.pl/umbraco/api');
  final _headers = {'x-language': 'pl-pl'};

  @override
  Uri get restUri {
    return _url;
  }

  @override
  Map<String, String> get defaultHeaders {
    return _headers;
  }
}
