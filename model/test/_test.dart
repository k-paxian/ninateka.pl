import 'package:dart_json_mapper/dart_json_mapper.dart';
import 'package:http/http.dart' as http;
import 'package:model.ninateka.pl/model.ninateka.pl.dart'
    show
        initializeJsonMapper,
        ninatekaAdapter,
        SearchResponse,
        SearchQueryParameters;
import 'package:test/test.dart';

void main() {
  initializeJsonMapper(adapters: [ninatekaAdapter]).info();

  group('[Integration with API]', () {
    test('Test search model', () async {
      // given
      final searchEndpoint =
          r'''https://admin.fina.gov.pl/umbraco/api/search''';

      // when
      final response = await http.get(
          JsonMapper.toUri(
              getParams: SearchQueryParameters(searchPhrase: 'a'),
              baseUrl: searchEndpoint),
          headers: {'x-language': 'pl-pl'});
      final target = JsonMapper.deserialize<SearchResponse>(response.body)!;

      // then
      expect(target, TypeMatcher<SearchResponse>());
    });
  });
}
