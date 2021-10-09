import 'package:dart_json_mapper/dart_json_mapper.dart'
    show JsonMapperAdapter, EnumDescriptor;
import 'package:model.ninateka.pl/search/result.dart'
    show RecordCategory, RecordType;

export 'package:model.ninateka.pl/search/result.dart';

export 'model.ninateka.pl.mapper.g.dart'
    show
        modelninateka_plAdapter,
        initializeJsonMapper,
        initializeJsonMapperAsync;

final ninatekaAdapter = JsonMapperAdapter(
    title: 'Ninateka.pl Adapter',
    url: 'package:model.ninateka.pl/model.ninateka.pl.dart',
    refUrl: 'http://ninateka.pl',
    enumValues: {
      RecordType: EnumDescriptor(
          values: RecordType.values,
          mapping: <RecordType, String>{
            RecordType.asset: 'Asset',
            RecordType.series: 'Series'
          }),
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