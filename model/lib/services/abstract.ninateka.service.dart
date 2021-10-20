import './abstract.http.service.dart';

abstract class AbstractNinatekaService extends AbstractHttpService {
  @override
  Uri get restUri {
    return Uri.parse('https://admin.fina.gov.pl/umbraco/api');
  }

  @override
  Map<String, String> get defaultHeaders {
    return {'x-language': 'pl-pl'};
  }
}
