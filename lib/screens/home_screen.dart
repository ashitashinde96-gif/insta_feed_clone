
// import 'dart:math';
// import 'package:flutter/material.dart';
// import 'package:insta_feed_clone/widgets/post_card.dart';

// class HomeScreen extends StatelessWidget {
//   const HomeScreen({Key? key}) : super(key: key);

//   // Random profile generator
//   String getRandomProfile() {
//     final random = Random();
//     int n = random.nextInt(100);
//     bool male = random.nextBool();
//     return male
//         ? "https://randomuser.me/api/portraits/men/$n.jpg"
//         : "https://randomuser.me/api/portraits/women/$n.jpg";
//   }

//   @override
//   Widget build(BuildContext context) {
//     final random = Random();

//     // Generate posts with **fixed random profile images**
//     final List<Map<String, Object>> posts = [
//       {"username": "virat", "caption": "Great day!", "verified": true, "profile": getRandomProfile()},
//       {"username": "john", "caption": "Morning vibes", "verified": false, "profile": getRandomProfile()},
//       {"username": "emma", "caption": "Love this view!", "verified": true, "profile": getRandomProfile()},
//       {"username": "alex", "caption": "Chill day", "verified": false, "profile": getRandomProfile()},
//       {"username": "sara", "caption": "Coffee time!", "verified": false, "profile": getRandomProfile()},
//     ];

//     return Scaffold(
//       backgroundColor: Colors.white,
//       appBar: AppBar(
//         backgroundColor: Colors.white,
//         elevation: 0,
//         title: Text(
//           "Instagram",
//           style: TextStyle(
//             color: Colors.black,
//             fontWeight: FontWeight.w700,
//             fontSize: 28,
//             letterSpacing: 1.2,
//           ),
//         ),
//         actions: [
//           IconButton(
//             icon: Icon(Icons.add_box_outlined, color: Colors.black),
//             onPressed: () {},
//           ),
//           IconButton(
//             icon: Icon(Icons.favorite_border, color: Colors.black),
//             onPressed: () {},
//           ),
//           IconButton(
//             icon: Icon(Icons.send_outlined, color: Colors.black),
//             onPressed: () {},
//           ),
//         ],
//       ),

//       body: ListView(
//         children: [
//           /// STORIES
//           Container(
//             height: 100,
//             padding: EdgeInsets.symmetric(vertical: 8),
//             child: ListView.builder(
//               scrollDirection: Axis.horizontal,
//               itemCount: 12,
//               padding: EdgeInsets.symmetric(horizontal: 10),
//               itemBuilder: (context, index) {
//                 final profile = getRandomProfile(); // store once
//                 return Padding(
//                   padding: EdgeInsets.symmetric(horizontal: 6),
//                   child: Column(
//                     children: [
//                       CircleAvatar(
//                         radius: 30,
//                         backgroundImage: NetworkImage(profile),
//                       ),
//                       SizedBox(height: 4),
//                       Text(
//                         'User$index',
//                         style: TextStyle(fontSize: 12),
//                       ),
//                     ],
//                   ),
//                 );
//               },
//             ),
//           ),

//           /// POSTS
//           ...posts.map((post) {
//             return PostCard(
//               username: post["username"] as String,
//               profileImage: post["profile"] as String, // use fixed profile
//               postImage: "https://picsum.photos/${500 + random.nextInt(50)}",
//               caption: post["caption"] as String,
//               isVerified: post["verified"] as bool,
//             );
//           }).toList(),
//         ],
//       ),
//     );
//   }
// }
import 'dart:math';
import 'package:flutter/material.dart';
import 'package:insta_feed_clone/widgets/post_card.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  // Random profile generator
  String getRandomProfile() {
    final random = Random();
    int n = random.nextInt(100);
    bool male = random.nextBool();
    return male
        ? "https://randomuser.me/api/portraits/men/$n.jpg"
        : "https://randomuser.me/api/portraits/women/$n.jpg";
  }

  @override
  Widget build(BuildContext context) {
    final random = Random();

    /// POSTS LIST WITH FIXED RANDOM PROFILE IMAGES
    final List<Map<String, Object>> posts = [
      {
        "username": "virat",
        "caption": "Great day!",
        "verified": true,
        "profile": getRandomProfile()
      },
      {
        "username": "john",
        "caption": "Morning vibes",
        "verified": false,
        "profile": getRandomProfile()
      },
      {
        "username": "emma",
        "caption": "Love this view!",
        "verified": true,
        "profile": getRandomProfile()
      },
      {
        "username": "alex",
        "caption": "Chill day",
        "verified": false,
        "profile": getRandomProfile()
      },
      {
        "username": "sara",
        "caption": "Coffee time!",
        "verified": false,
        "profile": getRandomProfile()
      },
    ];

    /// STORIES - PRE-GENERATE RANDOM PROFILE IMAGES
    final List<String> storyProfiles =
        List.generate(12, (_) => getRandomProfile());

    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        title: Text(
          "Instagram",
          style: TextStyle(
            color: Colors.black,
            fontWeight: FontWeight.w700,
            fontSize: 28,
            letterSpacing: 1.2,
          ),
        ),
        actions: [
          IconButton(
            icon: Icon(Icons.add_box_outlined, color: Colors.black),
            onPressed: () {},
          ),
          IconButton(
            icon: Icon(Icons.favorite_border, color: Colors.black),
            onPressed: () {},
          ),
          IconButton(
            icon: Icon(Icons.send_outlined, color: Colors.black),
            onPressed: () {},
          ),
        ],
      ),
      body: ListView(
        children: [
          /// STORIES
          Container(
            height: 100,
            padding: EdgeInsets.symmetric(vertical: 8),
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              itemCount: storyProfiles.length,
              padding: EdgeInsets.symmetric(horizontal: 10),
              itemBuilder: (context, index) {
                return Padding(
                  padding: EdgeInsets.symmetric(horizontal: 6),
                  child: Column(
                    children: [
                      CircleAvatar(
                        radius: 30,
                        backgroundImage: NetworkImage(storyProfiles[index]),
                      ),
                      SizedBox(height: 4),
                      Text(
                        'User$index',
                        style: TextStyle(fontSize: 12),
                      ),
                    ],
                  ),
                );
              },
            ),
          ),

          /// POSTS
          ...posts.map((post) {
            return PostCard(
              username: post["username"] as String,
              profileImage: post["profile"] as String,
              postImage: "https://picsum.photos/${500 + random.nextInt(50)}",
              caption: post["caption"] as String,
              isVerified: post["verified"] as bool,
            );
          }).toList(),
        ],
      ),
    );
  }
}