import './abstract.ninateka.service.dart';
import '../content.result.dart' show ContentResponse;

class ContentService extends AbstractNinatekaService {
  @override
  Uri get resourceUri {
    return Uri.parse('/content');
  }

  Future<ContentResponse> getContent(String url) =>
      doGetValueObject<ContentResponse>(Uri.parse(''),
          headers: {'x-origin-url': 'https://ninateka.pl/$url'});
}
