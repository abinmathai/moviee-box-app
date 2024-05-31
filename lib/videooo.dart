

// import 'package:flutter/material.dart';
// import 'package:video_player/video_player.dart';

// class VideoPlayerWidget extends StatefulWidget {
//   final String videoUrl;

//   VideoPlayerWidget({required this.videoUrl});

//   @override
//   _VideoPlayerWidgetState createState() => _VideoPlayerWidgetState();
// }

// class _VideoPlayerWidgetState extends State<VideoPlayerWidget> {
//   late VideoPlayerController _controller;

//   @override
//   void initState() {
//     super.initState();
//     // ignore: deprecated_member_use
//     _controller = VideoPlayerController.network(widget.videoUrl)
//       ..initialize().then((_) {
//         // Ensure the first frame is shown after the video is initialized
//         setState(() {});
//       });
//   }

//   @override
//   Widget build(BuildContext context) {
//     return _controller.value.isInitialized
//         ? VideoPlayer(_controller)
//          : CircularProgressIndicator();
//   }

//   @override
//   void dispose() {
//     super.dispose();
//     _controller.dispose();
//   }
// }
