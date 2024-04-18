import 'package:flutter/material.dart';
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
}