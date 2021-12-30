import 'package:better_player/better_player.dart';
import 'package:flutter/material.dart';
import 'package:model.ninateka.pl/model.ninateka.pl.dart' show VideoDescriptor;

class VideoPlayerPage extends StatefulWidget {
  final VideoDescriptor? vd;

  const VideoPlayerPage({this.vd, Key? key}) : super(key: key);

  @override
  State<VideoPlayerPage> createState() => _VideoPlayerPageState();
}

class _VideoPlayerPageState extends State<VideoPlayerPage> {
  late BetterPlayerController _betterPlayerController;

  @override
  void initState() {
    BetterPlayerConfiguration betterPlayerConfiguration =
        const BetterPlayerConfiguration(
      aspectRatio: 16 / 9,
      fit: BoxFit.contain,
    );
    BetterPlayerDataSource dataSource = BetterPlayerDataSource(
        BetterPlayerDataSourceType.network,
        'https:' + widget.vd!.sources!.dash!.first.src!,
        headers: {
          'accept': '*/*',
          'accept-encoding': 'gzip, deflate, br',
          'sec-ch-ua':
              '" Not A;Brand";v="99", "Chromium";v="96", "Google Chrome";v="96"',
          'sec-ch-ua-mobile': '?0',
          'sec-ch-ua-platform': '"Windows"',
          'sec-fetch-dest': 'empty',
          'sec-fetch-mode': 'cors',
          'sec-fetch-site': 'cross-site',
          'user-agent':
              'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/96.0.4664.110 Safari/537.36',
          'origin': 'https://ninateka.pl',
          'referer': 'https://ninateka.pl/',
          'accept-language':
              'en-US,en;q=0.9,pl-PL;q=0.8,pl;q=0.7,uk-UA;q=0.6,uk;q=0.5,ru-UA;q=0.4,ru;q=0.3'
        },
        drmConfiguration: BetterPlayerDrmConfiguration(
            drmType: BetterPlayerDrmType.widevine,
            licenseUrl: widget.vd!.drm!.widewine!.src!,
            headers: {
              'Referrer-Policy': 'strict-origin-when-cross-origin',
              ':authority': 'admin.fina.gov.pl',
              ':method': 'POST',
              ':scheme': 'https',
              'accept': '*/*',
              'accept-encoding': 'gzip, deflate, br',
              'sec-ch-ua':
                  '" Not A;Brand";v="99", "Chromium";v="96", "Google Chrome";v="96"',
              'sec-ch-ua-mobile': '?0',
              'sec-ch-ua-platform': '"Windows"',
              'sec-fetch-dest': 'empty',
              'sec-fetch-mode': 'cors',
              'sec-fetch-site': 'cross-site',
              'user-agent':
                  'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/96.0.4664.110 Safari/537.36',
              'origin': 'https://ninateka.pl',
              'referer': 'https://ninateka.pl/',
              'accept-language':
                  'en-US,en;q=0.9,pl-PL;q=0.8,pl;q=0.7,uk-UA;q=0.6,uk;q=0.5,ru-UA;q=0.4,ru;q=0.3'
            }));
    _betterPlayerController = BetterPlayerController(betterPlayerConfiguration);
    _betterPlayerController.setupDataSource(dataSource);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BetterPlayer(controller: _betterPlayerController);
  }
}
