import 'package:flutter/material.dart';
import 'package:youtube_player_flutter/youtube_player_flutter.dart';

class YoutubePlayerWidget extends StatefulWidget {
  final String videoUrl;
  final UniqueKey newKey;
  YoutubePlayerWidget({@required this.videoUrl, this.newKey})
      : super(key: newKey);
  @override
  _YoutubePlayerWidgetState createState() => _YoutubePlayerWidgetState();
}

class _YoutubePlayerWidgetState extends State<YoutubePlayerWidget> {
  String videoUrl = "https://www.youtube.com/watch?v=dSBRQUebo7g";

  YoutubePlayerController _controller;

  void initState() {
    _controller = YoutubePlayerController(
        initialVideoId: YoutubePlayer.convertUrlToId(videoUrl));

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Container(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: <Widget>[
                YoutubePlayerBuilder(
                  player: YoutubePlayer(
                    controller: _controller,
                    aspectRatio: 16 / 9,
                    showVideoProgressIndicator: true,
                  ),
                  builder: (context, player) {
                    return Column(
                      children: <Widget>[player],
                    );
                  },
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
