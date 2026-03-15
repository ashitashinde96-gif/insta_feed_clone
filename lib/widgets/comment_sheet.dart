
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

 
  final Random random = Random();

  String getRandomProfile() {
    int n = random.nextInt(100); 
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