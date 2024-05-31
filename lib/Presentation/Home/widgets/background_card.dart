import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:movie_box_app/Core/Colors/colors.dart';
import 'package:movie_box_app/Core/strings.dart';
import 'package:video_player/video_player.dart';
import '../../../Application/home/home_bloc.dart';

class MainImageWidget extends StatelessWidget {
  const MainImageWidget({super.key});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return BlocBuilder<HomeBloc, HomeState>(
      builder: (context, state) {
        if (state.isLoadingImgList) {
          
          return const Center(child: CircularProgressIndicator());
        } else if (state.isErrorImgList) {
          return const Center(child: Text('Error Occurred'));
        } else if (state.mainImgList == null) {
          return const Center(child: Text('List is empty'));
        }
        final movie = state.mainImgList;
        return Stack(
          alignment: Alignment.bottomCenter,
          children: [
            Container(
              height: size.height * 0.65,
              width: size.width,
              decoration: BoxDecoration(
                image: DecorationImage(
                  fit: BoxFit.cover,
                  image: NetworkImage('$imageAppendUrl$movie'),
                ),
              ),
            ),
            Container(
              width: size.width,
              height: 200,
              decoration: const BoxDecoration(
                gradient: LinearGradient(
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                  colors: [Colors.transparent, Colors.black],
                ),
              ),
            ),
            Positioned(
              bottom: 10,
              child: SizedBox(
                width: size.width,
                child: const Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    _PlayButton(),
                  ],
                ),
              ),
            ),
          ],
        );
      },
    );
  }
}

class _PlayButton extends StatelessWidget {
  const _PlayButton();

  final String videoUrl = 'http://commondatastorage.googleapis.com/gtv-videos-bucket/sample/BigBuckBunny.mp4';

  @override
  Widget build(BuildContext context) {
    return ElevatedButton.icon(
      onPressed: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => VideoPlayerPage(videoUrl: videoUrl),
          ),
        );
      },
      icon: const Icon(
        Icons.play_arrow,
        color: kButtonBlack,
      ),
      label: const Text(
        'Play',
        style: TextStyle(color: kBlackFont, fontWeight: FontWeight.bold),
      ),
      style: ButtonStyle(
        backgroundColor: MaterialStateProperty.all(kButtonWhite),
      ),
    );
  }
}

class VideoPlayerPage extends StatefulWidget {
  final String videoUrl;

  const VideoPlayerPage({Key? key, required this.videoUrl}) : super(key: key);

  @override
  _VideoPlayerPageState createState() => _VideoPlayerPageState();
}

class _VideoPlayerPageState extends State<VideoPlayerPage> {
  late VideoPlayerController _controller;

  @override
  void initState() {
    super.initState();
    // ignore: deprecated_member_use
    _controller = VideoPlayerController.network(widget.videoUrl)
      ..initialize().then((_) {
        setState(() {});  // Ensure the UI updates after initialization
        _controller.play();
      }).catchError((error) {
        // Handle initialization error
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text('Error initializing video: $error')),
        );
      });
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Video Player'),
      ),
      body: Center(
        child: _controller.value.isInitialized
            ? AspectRatio(
                aspectRatio: _controller.value.aspectRatio,
                child: VideoPlayer(_controller),
              )
            : const CircularProgressIndicator(),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          setState(() {
            _controller.value.isPlaying ? _controller.pause() : _controller.play();
          });
        },
        child: Icon(
          _controller.value.isPlaying ? Icons.pause : Icons.play_arrow,
        ),
      ),
    );
  }
}
