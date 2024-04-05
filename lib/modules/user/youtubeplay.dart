import 'package:flutter/material.dart';

void main() {
  runApp(YouTubePlayPage());
}

class YouTubePlayPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(
          title: Text('self defence'),
        ),
        body: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Video Player
              Container(
                width: double.infinity,
                height: 250,
                color: Colors.black, // Placeholder for the video player
                // You can integrate a video player package here
              ),
              // Video Information
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'self defence',
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    SizedBox(height: 8),
                    Text(
                      'commando fitness club • 1.5M views • 2 years ago',
                      style: TextStyle(
                        color: Colors.grey,
                      ),
                    ),
                    SizedBox(height: 16),
                    Text(
                      ' special for girls,self defence with commando commando fitness club',
                    ),
                  ],
                ),
              ),
              // Comments Section
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Comments',
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    SizedBox(height: 8),
                    // You can add a ListView.builder here to display comments
                    // Example:
                    // ListView.builder(
                    //   shrinkWrap: true,
                    //   itemCount: comments.length,
                    //   itemBuilder: (context, index) {
                    //     return ListTile(
                    //       title: Text(comments[index].author),
                    //       subtitle: Text(comments[index].comment),
                    //     );
                    //   },
                    // ),
                    Text('No comments yet.'),
                  ],
                ),
              ),
              // Related Videos Section
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Related Videos',
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    SizedBox(height: 8),
                    // You can add a ListView.builder here to display related videos
                    // Example:
                    // ListView.builder(
                    //   shrinkWrap: true,
                    //   itemCount: relatedVideos.length,
                    //   itemBuilder: (context, index) {
                    //     return ListTile(
                    //       leading: Image.asset(relatedVideos[index].thumbnail),
                    //       title: Text(relatedVideos[index].title),
                    //       subtitle: Text(relatedVideos[index].channel),
                    //     );
                    //   },
                    // ),
                    Text('No related videos found.'),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}