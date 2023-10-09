import 'package:flutter/material.dart';
import 'package:flutter/services.dart'; // Import the Services package for SystemChrome
import 'package:chewie/chewie.dart';
import 'package:video_player/video_player.dart';
import 'package:demo_app/video_page2.dart';

void main() {
  // Hide the debug banner
  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setEnabledSystemUIMode(SystemUiMode.immersiveSticky);
  SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitUp,
    DeviceOrientation.portraitDown,
  ]).then((_) {
    runApp(MyApp());
  });
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false, // Set debugShowCheckedModeBanner to false
      home: VideoPage(),
    );
  }
}

class VideoPage extends StatefulWidget {
  const VideoPage({Key? key}) : super(key: key);

  @override
  _VideoPageState createState() => _VideoPageState();
}

class _VideoPageState extends State<VideoPage> {
  late VideoPlayerController _videoPlayerController;
  late ChewieController _chewieController;

  @override
  void initState() {
    super.initState();

    // Initialize the video player controller
    _videoPlayerController = VideoPlayerController.asset('lib/images/firstoe.mp4');
    _videoPlayerController.setLooping(true);

    // Initialize the Chewie controller
    _chewieController = ChewieController(
      videoPlayerController: _videoPlayerController,
      autoPlay: true,
      looping: true,
      showControlsOnInitialize: false, // Disable showing controls on initialize
      errorBuilder: (context, errorMessage) {
        return Center(
          child: Text(
            errorMessage,
            style: TextStyle(color: Colors.white),
          ),
        );
      },
    );
  }

  @override
  void dispose() {
    super.dispose();

    // Dispose the video player controller and chewie controller
    _videoPlayerController.dispose();
    _chewieController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFFF0F9FF), // Set the background color to #F0F9FF
      body: Stack(
        children: [
          Positioned.fill(
            child: Container(
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                  colors: [
                    Color(0xFFF0F9FF).withOpacity(0.9), // Use a slightly transparent color at the top
                    Color(0xFFF0F9FF), // Use the same color at the bottom
                  ],
                ),
              ),
            ),
          ),
          Positioned(
            top: MediaQuery.of(context).size.height * 0.1, // Adjust the position of the video
            left: 8,
            right: 8,
            bottom: MediaQuery.of(context).size.height * 0.15, // Adjust the height of the video
            child: Chewie(
              controller: _chewieController,
            ),
          ),
          Positioned(
            bottom: 0,
            left: 0,
            right: 0,
            child: Container(
              height: MediaQuery.of(context).size.height * 0.1, // Set height to 0.1 of the screen height
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  begin: Alignment.bottomLeft,
                  end: Alignment.bottomRight,
                  colors: [
                    Color(0xFFF0F9FF).withOpacity(0.0), // Use a transparent color at the top
                    Color(0xFFF0F9FF), // Use the same color at the bottom
                  ],
                ),
              ),
              child: Align(
                alignment: Alignment.bottomCenter,
                child: Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: ElevatedButton(
                    onPressed: () {
                      // Continue button pressed
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => const VideoPage2(),
                        ),
                      );
                    },
                    style: ElevatedButton.styleFrom(
                      primary: Colors.black,
                      padding: const EdgeInsets.symmetric(
                        horizontal: 40,
                        vertical: 16,
                      ),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(26),
                      ),
                    ),
                    child: const Text(
                      'Continue',
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                      ),
                    ),
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
