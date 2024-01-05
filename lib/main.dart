import 'package:flutter/material.dart';

// Majority of code derived/obtained from ChatGPT

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: const Text('Lab 3 & 4'),
        ),
        body: TweetList(
           tweetDataList: tweetDataList,
        ),
      ),
    );
  }
}

List<Map<String, dynamic>> tweetDataList = [
  {
    'avatarImageURL': "https://yt3.ggpht.com/-JQLUtNiCOPI/AAAAAAAAAAI/AAAAAAAAAAA/qOUhTC7FnZM/s900-c-k-no/photo.jpg",
    'userShortName': 'National Geographic',
    'userLongName': '@NatGeo',
    'timeString': '2h',
    'description': "A European jackal dives at a Eurasian magpie who got too close to the jackal's recent catch in this photo by Your Shot photographer Sergey Zlatkov. https://on.natgeo.com/30o41m0",
    'postImageURL': 'https://th.bing.com/th/id/OIP.4NxUIcGeOlq_43xQBWY4-gHaFT?w=282&h=202&c=7&r=0&o=5&pid=1.7',
    'numComments': 35,
    'numRetweets': 256,
    'numLikes': 789,
  },
  {
    'avatarImageURL': "https://th.bing.com/th/id/OIP.Ksq42qkN5FupHzUJLrsPCAHaGK?w=188&h=180&c=7&r=0&o=5&pid=1.7",
    'userShortName': 'NASA',
    'userLongName': '@NASA',
    'timeString': '5h',
    'description': "Named for the mythological Greek Moon goddess and twin of Apollo, #Artemis will carry humanity back to the Moon -- this time, for good -- before we launch to Mars and to the unexplored beyond. Get the latest updates and more, straight to your inbox: https://go.nasa.gov/2OY7INQ",
    'postImageURL': 'https://th.bing.com/th/id/R.0b5b94ba078a295fc29179d9e7859698?rik=iJywF1H9Az0jjg&pid=ImgRaw&r=0',
    'numComments': 112,
    'numRetweets': 504,
    'numLikes': 1203,
  },
  {
    'avatarImageURL': "https://th.bing.com/th/id/OIP.l3OV6YCiNCA0xOBNJA70zgHaEK?w=245&h=180&c=7&r=0&o=5&pid=1.7",
    'userShortName': 'Netflix',
    'userLongName': '@Netflix',
    'timeString': '8h',
    'description': "More adventure is on the horizon!  One Piece renewed for season 2 coming 2025! ",
    'postImageURL': 'https://th.bing.com/th/id/R.442033f2b02f1685e5670c8d0addc6de?rik=JK2GKrcVXUbB%2fg&pid=ImgRaw&r=0',
    'numComments': 1024,
    'numRetweets': 2305,
    'numLikes': 10765,
  },
  {
    'avatarImageURL': "https://th.bing.com/th/id/OIP.1ITnVv9wwdifX82yfP9eTgHaEK?w=259&h=180&c=7&r=0&o=5&pid=1.7",
    'userShortName': 'Marvel',
    'userLongName': '@MarvelStudios',
    'timeString': '15h',
    'description': "The multiverse converges into an interdimensional space vacuum filled with Spider-Man and God himself, the 1v1 we've all been waiting for! Coming to theatres in 2069!",
    'postImageURL': 'https://th.bing.com/th/id/OIP.ZlYGCsV34zh-V3w8RqGdxgHaDg?w=301&h=165&c=7&r=0&o=5&pid=1.7',
    'numComments': 3507,
    'numRetweets': 7690,
    'numLikes': 2004065,
  }
];

class TweetList extends StatelessWidget {
  final List<Map<String, dynamic>> tweetDataList;
  const TweetList({super.key, required this.tweetDataList});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      shrinkWrap: true,
      itemCount: tweetDataList.length, // Replace with the desired number of tweets
      itemBuilder: (context, index) {
        final tweetData = tweetDataList[index];
        // Replace the placeholder data with your actual tweet data
        return TweetWidget(
          avatarImageURL: tweetData['avatarImageURL'],
          userShortName: tweetData['userShortName'],
          userLongName: tweetData['userLongName'],
          timeString: tweetData['timeString'],
          description: tweetData['description'],
          postImageURL: tweetData['postImageURL'],
          numComments: tweetData['numComments'],
          numRetweets: tweetData['numRetweets'],
          numLikes: tweetData['numLikes'],
        );
      },
    );
  }
}

class TweetWidget extends StatelessWidget {
  final String avatarImageURL;
  final String userShortName;
  final String userLongName;
  final String timeString;
  final String description;
  final String postImageURL;
  final int numComments;
  final int numRetweets;
  final int numLikes;

  const TweetWidget({super.key,
    required this.avatarImageURL,
    required this.userShortName,
    required this.userLongName,
    required this.timeString,
    required this.description,
    required this.postImageURL,
    required this.numComments,
    required this.numRetweets,
    required this.numLikes,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          CircleAvatar(
            backgroundImage: NetworkImage(avatarImageURL), // Replace with user's avatar image
            radius: 22.0,
          ),
          const SizedBox(width: 14.0),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  // mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Text(
                      userShortName,
                      style: const TextStyle(
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    Text(
                      '\t\t\t\t\t $userLongName \t\t\t\t\t $timeString \t\t',
                    ),
                    const Opacity(
                      opacity: 0.4,
                      child: Icon(Icons.expand_more),
                    ),
                  ],
                ),
                SizedBox(
                  width: 310.0,
                  child: Text(
                    description,
                  ),
                ),
                const SizedBox(height: 8.0),
                Image.network(
                  postImageURL, // Replace with the tweet's image
                  width: 310.0,
                  height: 200.0,
                  fit: BoxFit.cover,
                ),
                const SizedBox(height: 8.0),
                Row(
                  // mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    const Opacity(
                      opacity: 0.4,
                      child: Icon(Icons.chat_bubble_outline),
                    ), const Text("\t\t"),
                    Text('$numComments'), const Text("\t\t\t\t\t\t"),
                    const Opacity(
                      opacity: 0.4,
                      child: Icon(Icons.repeat),
                    ), const Text("\t\t"),
                    Text('$numRetweets'), const Text("\t\t\t\t\t\t"),
                    const Opacity(
                      opacity: 0.4,
                      child: Icon(Icons.favorite_border),
                    ), const Text("\t\t"),
                    Text('$numLikes'), const Text("\t\t\t\t\t\t"),
                    const Opacity(
                      opacity: 0.4,
                      child: Icon(Icons.bookmark_border),
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
