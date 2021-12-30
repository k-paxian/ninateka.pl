import 'package:flutter/material.dart';
import 'package:model.ninateka.pl/model.ninateka.pl.dart'
    show
        SearchRecord,
        AssetType,
        ProductsService,
        ContentService,
        ContentResponse;
import 'package:ninateka/widgets/video.player.dart';

class SearchRecordCard extends StatelessWidget {
  final SearchRecord record;

  const SearchRecordCard(this.record, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      child: ListTile(
        onTap: () async {
          final productsService = ProductsService();
          final contentService = ContentService();
          ContentResponse contentResponse =
              await contentService.getContent(record.url!);
          final videoDescriptor = await productsService.getVideoDescriptor(
              contentResponse.content!.seasons!.first.episodes!.first.atdId!);

          Navigator.push(
            context,
            MaterialPageRoute(
                builder: (context) => VideoPlayerPage(
                      vd: videoDescriptor,
                    )),
          );
        },
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
