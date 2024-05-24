import 'package:flutter/material.dart';
import 'package:youtube_player_flutter/youtube_player_flutter.dart';

class Youtubedemo extends StatefulWidget {
  @override
  _YoutubedemoState createState() => _YoutubedemoState();
}

class _YoutubedemoState extends State<Youtubedemo> {
  late YoutubePlayerController _controller;
  int _currentIndex = 0;

  final List<String> _selfDefenceVideoIds = [
    'tWDfPCP1BmQ', // Extracted video ID from URL
    '9m-x64bKfR4', // Extracted video ID from URL
    '72-8jhREtzI', // Extracted video ID from URL
    // Add more video IDs as needed
  ];

  @override
  void initState() {
    super.initState();
    _controller = YoutubePlayerController(
      initialVideoId: _selfDefenceVideoIds[_currentIndex],
      flags: YoutubePlayerFlags(
        autoPlay: true,
        mute: false,
      ),
    );
  }

  void _loadNextVideo() {
    setState(() {
      _currentIndex = (_currentIndex + 1) % _selfDefenceVideoIds.length;
      _controller.load(_selfDefenceVideoIds[_currentIndex]);
    });
  }

  void _loadPreviousVideo() {
    setState(() {
      _currentIndex = (_currentIndex - 1 + _selfDefenceVideoIds.length) % _selfDefenceVideoIds.length;
      _controller.load(_selfDefenceVideoIds[_currentIndex]);
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
        title: Text('Self Defence Demo'),
        backgroundColor: Colors.black,
      ),
      body: Column(
        children: [
          YoutubePlayer(
            controller: _controller,
            showVideoProgressIndicator: true,
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    IconButton(
                      icon: Icon(Icons.thumb_up),
                      onPressed: () {
                        ScaffoldMessenger.of(context).showSnackBar(
                          SnackBar(content: Text("You liked this video!")),
                        );
                      },
                    ),
                    IconButton(
                      icon: Icon(Icons.thumb_down),
                      onPressed: () {
                        ScaffoldMessenger.of(context).showSnackBar(
                          SnackBar(content: Text("You disliked this video!")),
                        );
                      },
                    ),
                    IconButton(
                      icon: Icon(Icons.share),
                      onPressed: () {
                        // Implement share functionality here
                      },
                    ),
                  ],
                ),
                TextFormField(
                  decoration: InputDecoration(
                    labelText: 'Comment',
                    hintText: 'Write a comment...',
                    border: OutlineInputBorder(),
                  ),
                  onFieldSubmitted: (value) {
                    // Handle comment submission here
                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(content: Text("Comment submitted!")),
                    );
                  },
                ),
                SizedBox(height: 20),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    ElevatedButton(
                      onPressed: _loadPreviousVideo,
                      child: Text('Previous'),
                    ),
                    ElevatedButton(
                      onPressed: _loadNextVideo,
                      child: Text('Next'),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}




/*import 'package:flutter/material.dart';
import 'package:flutter_application_1/modules/user/Home.dart';

void main() {
  runApp(Youtubedemo());
}

class Youtubedemo extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
  
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        backgroundColor: Colors.black,
        appBar: AppBar(
          title: Row(
            children: [
              IconButton(
                icon:  Icon(Icons.arrow_back,color: Colors.black),
                 onPressed: (){
                  Navigator.push(context,MaterialPageRoute(builder:(context) => Home()),);

                 },

              ),
             
              SizedBox(width: 8),
              Text('YouTube'),
            ],
          ),
          actions: [
            IconButton(
              icon: Icon(Icons.search),
              onPressed: () {
                // Add search functionality
              },
            ),
            IconButton(
              icon: Icon(Icons.more_vert),
              onPressed: () {
                // Add more options functionality
              },
            ),
          ],
        ),
     
        body: ListView.builder(
  itemCount: 3, // Number of videos
  itemBuilder: (BuildContext context, int index) {
    String thumbnailAsset;
    String title;
    String channel;
    String views;

    // Set different images and channels for the first and second index
    if (index == 0) {
      thumbnailAsset = 'assets/self.png';
      title = 'self defence with commando';
      channel = 'fitness club';
      views = '263K views';
    } else if (index == 1) {
      thumbnailAsset = 'assets/commonself.png';
      title = 'types of blocks you should know';
      channel = 'len tran';
      views = '384K views';
    } else {
      // For other indices, use default values
      thumbnailAsset = 'assets/self2.png';
      title = 'road fight with commando';
      channel = 'escape neck lock';
      views = '1.4M views';
    }

    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: VideoCard(
        thumbnailAsset: thumbnailAsset,
        title: title,
        channel: channel,
        views: views,
      ),
    );
  },
),
      ),
    );
  }
}

class VideoCard extends StatelessWidget {
  final String thumbnailAsset;
  final String title;
  final String channel;
  final String views;

  const VideoCard({
    required this.thumbnailAsset,
    required this.title,
    required this.channel,
    required this.views,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(8.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Image.asset(
            thumbnailAsset,
            width: double.infinity,
            fit: BoxFit.cover,
          ),
          SizedBox(height: 8.0),
          Text(
            title,
            style: TextStyle(
             /// fontWeight: FontWeight.bold,
              color: Colors.white,
            ),
          ),
          SizedBox(height: 4.0),
          Text(
            channel,
            style: TextStyle(
              color: Colors.grey,
            ),
          ),
          SizedBox(height: 4.0),
          Text(
            views,
            style: TextStyle(
              color: Colors.grey,
            ),
          ),
        ],
      ),
    );
  }
}*/