import 'package:dart_json_mapper/dart_json_mapper.dart';

import './abstract.ninateka.service.dart';
import '../search.result.dart';

class SearchService extends AbstractNinatekaService {
  @override
  Uri get resourceUri {
    return Uri.parse('/search');
  }

  Future<SearchResponse> getSearchResults(SearchQueryParameters params) =>
      doGetValueObject<SearchResponse>(JsonMapper.toUri(getParams: params));
}
