
// import 'package:flutter/material.dart';

// class CommentSheet extends StatefulWidget {
//   const CommentSheet({super.key});

//   @override
//   State<CommentSheet> createState() => _CommentSheetState();
// }

// class _CommentSheetState extends State<CommentSheet> {

//   final TextEditingController controller = TextEditingController();

//   List<Map<String, String>> comments = [];

//   void addComment() {

//     if (controller.text.trim().isEmpty) return;

//     setState(() {
//       comments.insert(0, {
//         "text": controller.text,
//         "image":
//             "https://i.pravatar.cc/150?img=${comments.length + 5}"
//       });
//     });

//     controller.clear();
//   }

//   @override
//   Widget build(BuildContext context) {

//     return Container(
//       height: MediaQuery.of(context).size.height * 0.85,
//       decoration: const BoxDecoration(
//         color: Colors.white,
//         borderRadius: BorderRadius.vertical(
//           top: Radius.circular(20),
//         ),
//       ),

//       child: Column(
//         children: [

//           /// HEADER
//           Padding(
//             padding: const EdgeInsets.symmetric(
//               horizontal: 16,
//               vertical: 12,
//             ),

//             child: Row(
//               children: [

//                 const Expanded(
//                   child: Center(
//                     child: Text(
//                       "Comments",
//                       style: TextStyle(
//                         fontWeight: FontWeight.bold,
//                         fontSize: 16,
//                       ),
//                     ),
//                   ),
//                 ),

//                 /// CLOSE BUTTON
//                 GestureDetector(
//                   onTap: () {
//                     Navigator.pop(context);
//                   },
//                   child: const Icon(Icons.close),
//                 )

//               ],
//             ),
//           ),

//           const Divider(),

//           /// COMMENTS LIST
//           Expanded(
//             child: ListView.builder(
//               itemCount: comments.length,
//               itemBuilder: (context, index) {

//                 final comment = comments[index];

//                 return ListTile(

//                   leading: CircleAvatar(
//                     backgroundImage:
//                         NetworkImage(comment["image"]!),
//                   ),

//                   title: Text(comment["text"]!),

//                 );
//               },
//             ),
//           ),

//           const Divider(),

//           /// COMMENT INPUT BOX
//           Padding(
//             padding: const EdgeInsets.symmetric(
//               horizontal: 10,
//               vertical: 8,
//             ),

//             child: Row(
//               children: [

//                 const CircleAvatar(
//                   backgroundImage: NetworkImage(
//                     "https://i.pravatar.cc/150?img=12",
//                   ),
//                 ),

//                 const SizedBox(width: 10),

//                 Expanded(
//                   child: TextField(
//                     controller: controller,
//                     decoration: const InputDecoration(
//                       hintText: "Add a comment...",
//                       border: InputBorder.none,
//                     ),
//                   ),
//                 ),

//                 TextButton(
//                   onPressed: addComment,
//                   child: const Text("Post"),
//                 )

//               ],
//             ),
//           )
//         ],
//       ),
//     );
//   }
// }
import 'package:flutter/material.dart';
import 'dart:math';

class CommentPage extends StatefulWidget {
  final String postOwner;
  final String postImage;

  const CommentPage({Key? key, required this.postOwner, required this.postImage}) : super(key: key);

  @override
  State<CommentPage> createState() => _CommentPageState();
}

class _CommentPageState extends State<CommentPage> {
  final TextEditingController _controller = TextEditingController();
  final List<Map<String, String>> comments = [];

  /// Random profile generator
  final Random random = Random();

  String getRandomProfile() {
    int n = random.nextInt(100); // 0-99
    bool male = random.nextBool();
    return male
        ? "https://randomuser.me/api/portraits/men/$n.jpg"
        : "https://randomuser.me/api/portraits/women/$n.jpg";
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white.withOpacity(0.95),
      body: SafeArea(
        child: Column(
          children: [

            /// TOP BAR WITH CLOSE
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
              child: Row(
                children: [
                  IconButton(
                    icon: Icon(Icons.close),
                    onPressed: () => Navigator.pop(context),
                  ),
                  SizedBox(width: 10),
                  Text(
                    "Comments",
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
                  ),
                ],
              ),
            ),

            Divider(height: 1, color: Colors.grey),

            /// COMMENTS LIST
            Expanded(
              child: ListView.builder(
                itemCount: comments.length,
                padding: EdgeInsets.symmetric(horizontal: 12, vertical: 6),
                itemBuilder: (context, index) {
                  final comment = comments[index];
                  return Padding(
                    padding: const EdgeInsets.symmetric(vertical: 6),
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        CircleAvatar(
                          radius: 16,
                          backgroundImage: NetworkImage(comment['profile']!),
                        ),
                        SizedBox(width: 8),
                        Expanded(
                          child: RichText(
                            text: TextSpan(
                              style: TextStyle(color: Colors.black),
                              children: [
                                TextSpan(
                                  text: comment['username']! + " ",
                                  style: TextStyle(fontWeight: FontWeight.bold),
                                ),
                                TextSpan(text: comment['text']),
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                  );
                },
              ),
            ),

            Divider(height: 1, color: Colors.grey),

            /// COMMENT INPUT BOX
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
              child: Row(
                children: [
                  CircleAvatar(
                    radius: 16,
                    backgroundImage: NetworkImage(getRandomProfile()),
                  ),
                  SizedBox(width: 8),
                  Expanded(
                    child: TextField(
                      controller: _controller,
                      decoration: InputDecoration(
                        hintText: "Add a comment...",
                        border: InputBorder.none,
                      ),
                    ),
                  ),
                  TextButton(
                    onPressed: () {
                      if (_controller.text.trim().isNotEmpty) {
                        setState(() {
                          comments.add({
                            'username': "user${random.nextInt(999)}",
                            'text': _controller.text.trim(),
                            'profile': getRandomProfile(),
                          });
                        });
                        _controller.clear();
                      }
                    },
                    child: Text(
                      "Post",
                      style: TextStyle(
                        color: Colors.blue,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}