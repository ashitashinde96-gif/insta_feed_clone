
import 'dart:math';
import 'package:flutter/material.dart';
import 'package:insta_feed_clone/widgets/comment_sheet.dart';


class PostCard extends StatefulWidget {
  final String username;
  final String? profileImage; 
  final String postImage;
  final String caption;
  final bool isVerified;

  const PostCard({
    Key? key,
    required this.username,
    this.profileImage,
    required this.postImage,
    required this.caption,
    this.isVerified = false,
  }) : super(key: key);

  @override
  _PostCardState createState() => _PostCardState();
}

class _PostCardState extends State<PostCard>
    with SingleTickerProviderStateMixin {
  bool isLiked = false;
  bool showHeart = false;

  late AnimationController _controller;
  late Animation<double> _scaleAnimation;
  late Animation<double> _opacityAnimation;

  late String profileImageUrl;
  final Random random = Random();

  String getRandomProfile() {
    int n = random.nextInt(100);
    bool male = random.nextBool();
    return male
        ? "https://randomuser.me/api/portraits/men/$n.jpg"
        : "https://randomuser.me/api/portraits/women/$n.jpg";
  }

  @override
  void initState() {
    super.initState();

    profileImageUrl = widget.profileImage ?? getRandomProfile();

    _controller =
        AnimationController(vsync: this, duration: Duration(milliseconds: 400));

    _scaleAnimation =
        Tween<double>(begin: 0.5, end: 1.3).animate(CurvedAnimation(
      parent: _controller,
      curve: Curves.easeOut,
    ));

    _opacityAnimation =
        Tween<double>(begin: 1, end: 0).animate(CurvedAnimation(
      parent: _controller,
      curve: Curves.easeOut,
    ));
  }

  void onDoubleTapLike() {
    setState(() {
      isLiked = true;
      showHeart = true;
    });

    _controller.forward().then((value) {
      _controller.reset();
      setState(() {
        showHeart = false;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
    
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 10),
          child: Row(
            children: [
              CircleAvatar(
                radius: 18,
                backgroundImage: NetworkImage(profileImageUrl),
              ),
              SizedBox(width: 10),
              Row(
                children: [
                  Text(
                    widget.username,
                    style: TextStyle(
                      fontWeight: FontWeight.w600,
                      fontSize: 14,
                    ),
                  ),
                  if (widget.isVerified)
                    Padding(
                      padding: const EdgeInsets.only(left: 4),
                      child: Icon(
                        Icons.verified,
                        color: Colors.blue,
                        size: 16,
                      ),
                    ),
                ],
              ),
              Spacer(),
              Icon(Icons.more_vert),
            ],
          ),
        ),

        GestureDetector(
          onDoubleTap: onDoubleTapLike,
          child: Stack(
            alignment: Alignment.center,
            children: [
              Image.network(
                widget.postImage,
                width: double.infinity,
                height: 350,
                fit: BoxFit.cover,
              ),
              if (showHeart)
                AnimatedBuilder(
                  animation: _controller,
                  builder: (context, child) {
                    return Opacity(
                      opacity: 1 - _controller.value,
                      child: Transform.scale(
                        scale: _scaleAnimation.value,
                        child: Icon(
                          Icons.favorite,
                          color: Colors.white,
                          size: 100,
                        ),
                      ),
                    );
                  },
                ),
            ],
          ),
        ),

      
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 6),
          child: Row(
            children: [
              IconButton(
                icon: Icon(
                  isLiked ? Icons.favorite : Icons.favorite_border,
                  color: isLiked ? Colors.red : Colors.black,
                ),
                onPressed: () {
                  setState(() {
                    isLiked = !isLiked;
                  });
                },
              ),
              IconButton(
                icon: Icon(Icons.chat_bubble_outline),
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (_) => CommentPage(
                        postOwner: widget.username,
                        postImage: widget.postImage,
                      ),
                    ),
                  );
                },
              ),
              IconButton(
                icon: Icon(Icons.send_outlined),
                onPressed: () {},
              ),
              Spacer(),
              IconButton(
                icon: Icon(Icons.bookmark_border),
                onPressed: () {},
              ),
            ],
          ),
        ),

        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 14),
          child: Text(
            "Liked by alex and ${random.nextInt(2000) + 100} others",
            style: TextStyle(fontWeight: FontWeight.w600),
          ),
        ),

        SizedBox(height: 4),

     
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 14),
          child: RichText(
            text: TextSpan(
              style: TextStyle(color: Colors.black),
              children: [
                TextSpan(
                  text: widget.username + " ",
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
                TextSpan(text: widget.caption),
              ],
            ),
          ),
        ),

        SizedBox(height: 10),
      ],
    );
  }
}