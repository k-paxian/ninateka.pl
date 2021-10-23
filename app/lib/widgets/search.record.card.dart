import 'package:flutter/material.dart';
import 'package:model.ninateka.pl/model.ninateka.pl.dart'
    show SearchRecord, AssetType;

class SearchRecordCard extends StatelessWidget {
  final SearchRecord record;

  const SearchRecordCard(this.record, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      child: ListTile(
        leading: Image(
          width: 80,
          image: NetworkImage(record.image!.url!),
        ),
        title: Text(record.title!),
        subtitle: Text(record.subtitle!),
        trailing: Icon(record.assetType == AssetType.audio
            ? Icons.audiotrack
            : Icons.movie),
      ),
    );
  }
}
