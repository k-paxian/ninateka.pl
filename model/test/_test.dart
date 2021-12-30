import 'package:model.ninateka.pl/model.ninateka.pl.dart'
    show
        initializeJsonMapper,
        ninatekaAdapter,
        SearchService, ContentService, ProductsService,
        SearchResponse,
        ContentResponse,
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

      // then
      expect(response.records != null, true);
    });

    test('Test content service', () async {
      // given
      final contentService = ContentService();
      final searchService = SearchService();

      // when
      SearchResponse searchResponse = await searchService
          .getSearchResults(SearchQueryParameters(searchPhrase: 'a'));
      ContentResponse response =
          await contentService.getContent(searchResponse.records!.first.url!);

      print(response);

      // then
      expect(response.content != null, true);
    });

    test('Test product service', () async {
      // given
      final contentService = ContentService();
      final searchService = SearchService();
      final productService = ProductsService();

      // when
      SearchResponse searchResponse = await searchService
          .getSearchResults(SearchQueryParameters(searchPhrase: 'a'));
      ContentResponse response =
          await contentService.getContent(searchResponse.records!.first.url!);
      final videoDescriptor = await productService.getVideoDescriptor(response.content!.seasons!.first.episodes!.first.atdId!);

      print(videoDescriptor);

      // then
      expect(videoDescriptor.sources != null, true);
    });
  });
}
