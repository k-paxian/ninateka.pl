import 'package:model.ninateka.pl/model.ninateka.pl.dart'
    show
        initializeJsonMapper,
        ninatekaAdapter,
        SearchService,
        SearchResponse,
        SearchQueryParameters;
import 'package:test/test.dart';

void main() {
  initializeJsonMapper(adapters: [ninatekaAdapter]).info();

  group('[Integration with API]', () {
    test('Test search service', () async {
      // given
      final searchService = SearchService();

      // when
      SearchResponse response = await searchService
          .getSearchResults(SearchQueryParameters(searchPhrase: 'a'));

      print(response);

      // then
      expect(response.records != null, true);
    });
  });
}
