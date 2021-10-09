import 'package:dart_json_mapper/dart_json_mapper.dart';
import 'package:http/http.dart' as http;
import 'package:model.ninateka.pl/model.ninateka.pl.dart'
    show initializeJsonMapper, ninatekaAdapter, SearchResponse;
import 'package:test/test.dart';

void main() {
  initializeJsonMapper(adapters: [ninatekaAdapter]).info();

  group('[Integration with API]', () {
    test('Test search model', () async {
      // given
      final urlString =
          r'''https://admin.fina.gov.pl/umbraco/api/search?page=1&limit=48&field_searchable.0=yes&searchPhrase.3=a&__NodeTypeAlias.2=asset,series''';

      // when
      final response = await http
          .get(Uri.parse(urlString), headers: {'x-language': 'pl-pl'});
      final target = JsonMapper.deserialize<SearchResponse>(response.body)!;
      print(target);

      // then
      expect(target, TypeMatcher<SearchResponse>());
    });
  });
}
