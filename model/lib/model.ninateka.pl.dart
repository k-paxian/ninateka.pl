import 'package:dart_json_mapper/dart_json_mapper.dart'
    show JsonMapperAdapter, EnumDescriptor;
import 'package:model.ninateka.pl/search.result.dart'
    show RecordCategory, RecordType;

export 'package:model.ninateka.pl/search.result.dart';
export 'package:model.ninateka.pl/content.result.dart';
export 'package:model.ninateka.pl/product.dart';
export 'package:model.ninateka.pl/core.types.dart';
export 'package:model.ninateka.pl/services/search.service.dart';
export 'package:model.ninateka.pl/services/products.service.dart';
export 'package:model.ninateka.pl/services/content.service.dart';

export 'model.ninateka.pl.mapper.g.dart'
    show
        modelNinatekaPlGeneratedAdapter,
        initializeJsonMapper,
        initializeJsonMapperAsync;

final ninatekaAdapter = JsonMapperAdapter(
    title: 'Ninateka.pl Adapter',
    url: 'package:model.ninateka.pl/model.ninateka.pl.dart',
    refUrl: 'http://ninateka.pl',
    enumValues: {
      RecordType:
          EnumDescriptor(values: RecordType.values, caseInsensitive: true),
      RecordCategory: EnumDescriptor(
          values: RecordCategory.values,
          mapping: <RecordCategory, String>{
            RecordCategory.document: 'DOKUMENT',
            RecordCategory.theater: 'TEATR',
            RecordCategory.music: 'MUZYKA',
            RecordCategory.talks: 'ROZMOWY'
          }),
    });

void main() {}
